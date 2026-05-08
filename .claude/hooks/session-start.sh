#!/usr/bin/env bash
# Phase 0 SessionStart hook
# 起動時にプロジェクト状況を1画面で表示する

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

PHASE0_START="2026-05-08"
TODAY="$(date +%Y-%m-%d)"

# Phase 0 経過週を計算(macOS / Linux 両対応)
if date -d "$PHASE0_START" +%s >/dev/null 2>&1; then
  START_EPOCH=$(date -d "$PHASE0_START" +%s)
  TODAY_EPOCH=$(date +%s)
else
  START_EPOCH=$(date -j -f "%Y-%m-%d" "$PHASE0_START" +%s 2>/dev/null || echo 0)
  TODAY_EPOCH=$(date +%s)
fi

DAYS=$(( (TODAY_EPOCH - START_EPOCH) / 86400 ))
WEEK=$(( DAYS / 7 ))
REMAINING=$(( 12 - WEEK ))

# Track 別ファイル数
count_files() {
  local dir="$1"
  if [ -d "$dir" ]; then
    find "$dir" -type f -name '*.md' ! -name 'README.md' ! -name '.gitkeep' 2>/dev/null | wc -l | tr -d ' '
  else
    echo 0
  fi
}

A_COUNT=$(count_files "tracks/A-competitors")
B_COUNT=$(count_files "tracks/B-regulations")
C_COUNT=$(count_files "tracks/C-tech-trends")
D_COUNT=$(count_files "tracks/D-business-models")

# inbox 未処理
INBOX_COUNT=0
if [ -d "inbox" ]; then
  INBOX_COUNT=$(find "inbox" -type f -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
fi

# 直近の weekly digest
LAST_WEEKLY="(なし)"
if [ -d "synthesis/weekly" ]; then
  LATEST=$(ls -1 synthesis/weekly/*.md 2>/dev/null | tail -1 || true)
  if [ -n "$LATEST" ]; then
    LAST_WEEKLY="$(basename "$LATEST")"
  fi
fi

cat <<EOF
=== KYA Project — Phase 0 Status ===
Today:        $TODAY
Phase 0 Week: W${WEEK} / W12  (残り ${REMAINING} 週)

Track 別ファイル数:
  A 競合:        ${A_COUNT}
  B 規制:        ${B_COUNT}
  C 技術動向:    ${C_COUNT}
  D ビジネス:    ${D_COUNT}

inbox 未統合:   ${INBOX_COUNT} 件
直近 digest:    ${LAST_WEEKLY}

推奨次アクション:
EOF

if [ "$WEEK" -lt 1 ]; then
  cat <<EOF
  - PHASE0.md と CLAUDE.md を読む
  - Track A の long-list を確定 → /track-scan A
  - 上位 5 社を /research <name> で開始
EOF
elif [ "$WEEK" -lt 4 ]; then
  cat <<EOF
  - 上位 10 社プロファイル(/research <name>)
  - Track B 主要論点 5-8 件確定
  - 毎日 /daily-scan、日曜に /weekly-digest
EOF
elif [ "$WEEK" -lt 8 ]; then
  cat <<EOF
  - Track A 残 10-20 社、カンファレンス transcript
  - Track B JP/UK/SG/UAE
  - Track C 論文 10 本(impact rating 付き)
  - /update-decision-doc を試走
EOF
elif [ "$WEEK" -lt 11 ]; then
  cat <<EOF
  - Track A publishable 化準備
  - Track B 弁護士確認用ドラフト
  - Track C キーパーソン3-5名特定
  - /update-decision-doc 本格化
EOF
else
  cat <<EOF
  ⚠️  Phase 0 終盤(W11+):
  - decision-doc.md の §1-§5 を「確定」へ昇格
  - Path A/B/C/D 選択
  - Phase 1 実行計画ドラフト
EOF
fi

if [ "$INBOX_COUNT" -gt 5 ]; then
  echo ""
  echo "⚠️  inbox に $INBOX_COUNT 件未処理 → /weekly-digest 推奨"
fi

echo ""
echo "===================================="
