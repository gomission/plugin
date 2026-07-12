#!/usr/bin/env bash
# Append a compact [Claude Code] entry to Mission's daily-log if the workspace is present.
# Silent no-op when there is no daily-log — the hook must never block Stop.

set -u

LOG_CANDIDATES=(
  "${MISSION_DAILY_LOG:-}"
  "${MISSION_WORKSPACE:-}/trackers/daily-log.md"
  "$HOME/Projects/ronen-positioning-agents/trackers/daily-log.md"
  "$HOME/Projects/gomission/mission-data/daily-log.md"
)

for candidate in "${LOG_CANDIDATES[@]}"; do
  if [[ -n "$candidate" && -f "$candidate" ]]; then
    LOG="$candidate"
    break
  fi
done

if [[ -z "${LOG:-}" ]]; then
  exit 0
fi

DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)

if ! grep -q "^## ${DATE}" "$LOG" 2>/dev/null; then
  printf "\n## %s\n" "$DATE" >> "$LOG"
fi

printf -- "- [Claude Code %s] session closed\n" "$TIME" >> "$LOG"
exit 0
