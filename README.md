# KYA Project

Agent Payments / KYA(Know Your Agent) のリサーチ・プロジェクト。

現在 **Phase 0(リサーチ・ファースト、8-12週間)** を進行中。
詳細は [`PHASE0.md`](./PHASE0.md) を参照。

## クイックスタート

```bash
# Claude Code で開く
cd KYA-Project
claude

# 初日
/phase0-status

# 日次運用
/daily-scan          # ニュース・論文・調達ラウンドを inbox/ に drop
/weekly-digest       # 週次統合(Sunday推奨)

# 必要時
/research <target>   # 企業 or 論点を深堀り
/track-scan A        # Track A 全体スキャン
/update-decision-doc # 戦略意思決定文書を更新
```

## ディレクトリ

| Path | 内容 |
|------|------|
| `tracks/A-competitors/` | 競合プロファイル + カンファレンス + 資金調達 |
| `tracks/B-regulations/` | 法域別規制マッピング |
| `tracks/C-tech-trends/` | DID / ZK / PQC 論文 + キーパーソン |
| `tracks/D-business-models/` | 5モデルの経済性 |
| `synthesis/weekly/` | 週次digest |
| `synthesis/decision-doc.md` | **Phase 0 最終出力** |
| `inbox/` | daily-scan の生 drop |
| `PHASE0.md` | 12週マスタープラン |
| `CLAUDE.md` | Claude 向けプロジェクトガイド |

## 関連プラグイン

`~/.claude/plugins/agent-payments-research-toolkit/` に Skills 5 本配置済み。
このプロジェクトを超えて再利用可能。
