# KYA Project — Claude 向けプロジェクトガイド

## プロジェクト概要

**Agent Payments / KYA(Know Your Agent) リサーチ・プロジェクト**。
Phase 0(リサーチ・ファースト、8-12週間)を進行中。詳細は `PHASE0.md` 参照。

**最終目標**: 12週間後、戦略意思決定文書(`synthesis/decision-doc.md`)を確定し、Path A/B/C/D のいずれかに進む。

## 前提・運用方針

- **言語**: 出力は **日本語ファースト**。Track A の publishable doc のみ英文。引用・原典は英語のまま。
- **自律性**: Checkpointed 運用。Daily scan は自動 / Weekly レビューは人間 / 重要判断は必ず人間。
- **完璧主義禁止**: Phase 0 は12週間で必ず止める。
- **出典**: すべての主張に URL + アクセス日付。推測には(推定)明記。
- **ライセンス・規制**: 法律意見ではない、と必ず明記。最終判断は弁護士確認。

## ディレクトリ構造

```
KYA-Project/
├── .claude/
│   ├── agents/          # 専門subagent定義(competitor-researcher 他)
│   ├── commands/        # slash command定義
│   ├── hooks/           # SessionStart hook
│   └── settings.json
├── tracks/
│   ├── A-competitors/      # 競合プロファイル + カンファレンス + 資金調達
│   ├── B-regulations/      # 法域別規制マッピング
│   ├── C-tech-trends/      # DID / ZK / PQC 論文 + キーパーソン
│   └── D-business-models/  # 5モデルの経済性
├── synthesis/
│   ├── weekly/             # 週次digest
│   └── decision-doc.md     # 戦略意思決定文書(Phase 0 最終出力)
├── inbox/                  # daily-scan の生 drop
├── PHASE0.md              # 12週マスタープラン
└── README.md
```

## 利用可能な Skills(個人プラグイン)

`~/.claude/plugins/agent-payments-research-toolkit/skills/`:

1. `competitor-profile-builder` — 5次元の構造化プロファイル
2. `regulation-comparator` — 法域横断の条文・ガイダンス比較
3. `conference-transcript-analyzer` — 5論点でセッション再編
4. `investment-round-tracker` — ラウンド・投資家追跡
5. `paper-summarizer-with-impact-rating` — 1-5 rating で論文要約

## Subagents

`.claude/agents/`:

- `competitor-researcher` — Track A、特定企業を深堀り
- `regulation-mapper` — Track B、論点ごとに法域横断比較
- `tech-trend-watcher` — Track C、DID/ZK/PQC 領域の最新動向
- `synthesis-curator` — 週次統合 → `synthesis/weekly/`
- `critic` — 既存ドキュメントのギャップ・矛盾検出(read-only)

## Slash Commands

`.claude/commands/`:

- `/research <target>` — 企業 or 論点を深堀り(適切な subagent に振り分け)
- `/track-scan <A|B|C|D>` — Track 全体を一気にスキャン
- `/daily-scan` — ニュース・論文・調達ラウンドを inbox に drop
- `/weekly-digest` — 1週間分を統合 → `synthesis/weekly/YYYY-WW.md`
- `/phase0-status` — 現状進捗を可視化
- `/update-decision-doc` — `synthesis/decision-doc.md` を最新情報で更新

## 推奨フロー

**初日**: PHASE0.md と decision-doc.md を読む。`/phase0-status` で進捗確認。

**通常運用**:
```
Daily:   /daily-scan(任意で /loop 24h /daily-scan)
Weekly:  /weekly-digest → コタが目を通す → 必要なら /research
```

**Phase 0 終盤(W11-W12)**: `/update-decision-doc` を繰り返して decision-doc を完成させる。

## 重要な原則(コタからの指示)

1. **エンジニアリング先行禁止**。リサーチで意思決定を裏打ちしてから実装に入る。
2. **PQC OEM はドロップ済み**。QSB は KYA で必要になった時のプライベート資産として温存。事業化しない。
3. **ノンカストディ型を仮置き**。最終確定は Track B の結果次第。
4. **5年スパンで陳腐化する資産は事業の柱にしない**(Claude が定理証明アシスタントとして上級者水準に到達する前提)。

## Claude が守るべきこと

- 主張には必ず出典 URL + 日付
- 推測には(推定)明記
- Track間のクロスリファレンスを意識(例: Skyfire の規制スタンス → Track A プロファイル + Track B 規制マッピング両方に書く)
- 不明な項目は "未確認" と明示(空欄禁止)
- 法律意見・投資推奨を断定しない
