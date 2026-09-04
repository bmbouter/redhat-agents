#!/bin/bash
# Convert a grooming audit log (JSONL) to a human-readable Markdown report.
#
# Usage: ./generate-md-report.sh [input.jsonl] [output.md]
# Defaults: grooming_log.jsonl -> grooming_report.md
#
# Requires: jq

JSONL_FILE="${1:-grooming_log.jsonl}"
OUTPUT="${2:-grooming_report.md}"

if ! command -v jq >/dev/null 2>&1; then
    echo "Error: jq is required but not installed"
    exit 1
fi

if [[ ! -f "$JSONL_FILE" ]]; then
    echo "Error: $JSONL_FILE not found"
    exit 1
fi

# Start markdown
cat > "$OUTPUT" << 'EOF'
# Backlog Grooming History

This report is auto-generated from the grooming audit log.

**To regenerate:** `./generate-md-report.sh <input.jsonl> <output.md>`

---

EOF

# Group by session
while IFS= read -r line; do
    # Check if it's a session_start marker
    session=$(echo "$line" | jq -r 'select(.session_start != null) | .session_start' 2>/dev/null)

    if [[ -n "$session" ]]; then
        # New session
        total=$(echo "$line" | jq -r '.total_issues // "-"')
        analyzed=$(echo "$line" | jq -r '.analyzed // "-"')
        groomer=$(echo "$line" | jq -r '.groomer // "-"')

        {
            echo ""
            echo "## Session: $session"
            echo ""
            echo "**Groomer:** $groomer  "
            echo "**Total issues:** $total  "
            echo "**Analyzed:** $analyzed"
            echo ""
            echo "| Issue | Action | Changes | Notes |"
            echo "|-------|--------|---------|-------|"
        } >> "$OUTPUT"
    else
        # Regular entry
        action=$(echo "$line" | jq -r '.action // ""')

        # Skip entries without action field (summary-only entries)
        if [[ -z "$action" ]]; then
            continue
        fi

        # clean: escape pipes and flatten newlines so free-text values
        # can't break the Markdown table layout.
        clean='def clean: tostring | gsub("\\|"; "\\|") | gsub("[\\n\\r]+"; " ");'

        # Handle issue vs issues vs features (single vs array)
        issue=$(echo "$line" | jq -r "$clean"' (if .issues then (.issues | if type == "array" then join(", ") else . end) elif .issue then .issue elif .features then (.features | if type == "array" then join(", ") else . end) else "" end) | clean')

        # Skip entries without issue/issues/features field
        if [[ -z "$issue" ]]; then
            continue
        fi

        # Handle changes array or string
        changes=$(echo "$line" | jq -r "$clean"' (if .changes then (.changes | if type == "array" then join(", ") else . end) else "-" end) | clean')

        # Combine notes and reason
        notes=$(echo "$line" | jq -r "$clean"' (.notes // .reason // .summary // "-") | clean')

        # If it's a created_feature or created_epic, format differently
        if [[ "$action" == "created_feature" ]] || [[ "$action" == "created_epic" ]]; then
            summary=$(echo "$line" | jq -r "$clean"' (.summary // "-") | clean')
            parent=$(echo "$line" | jq -r "$clean"' (.parent // "-") | clean')
            echo "| **$issue** | $action | Parent: $parent | $summary |" >> "$OUTPUT"
        else
            echo "| $issue | $action | $changes | $notes |" >> "$OUTPUT"
        fi
    fi
done < "$JSONL_FILE"

{
    echo ""
    echo "---"
    echo ""
    echo "*Generated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")*"
} >> "$OUTPUT"

echo "Generated $OUTPUT from $JSONL_FILE"
