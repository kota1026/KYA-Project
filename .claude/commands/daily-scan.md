---
description: ニュース・論文・調達ラウンドを Web で巡回し、KYA 関連の新規情報を inbox/ に drop する。daily 運用想定(/loop 24h /daily-scan 推奨)。
allowed-tools: WebFetch, WebSearch, Read, Write, Glob, Bash
---

過去 24 時間の Agent Payments / KYA 関連の新規情報を巡回し、`inbox/YYYY-MM-DD-<slug>.md` として drop する。

## スコープ

### ニュース
- TechCrunch / The Information / Axios Pro Rata / Bloomberg / Reuters / Coindesk / The Block
- 検索キーワード: "agent payments", "AI agent commerce", "agent wallet", "KYA know your agent", "non-custodial AI", "x402", "AP2", "Stripe Agentic"

### 論文
- arXiv cs.CR, cs.CY, cs.AI 新着
- IACR ePrint 新着
- 検索キーワード: "agent identity", "DID", "zk-tls", "selective disclosure", "PQC migration"

### 調達ラウンド
- Crunchbase News
- a16z / Paradigm / Coinbase Ventures / Visa Ventures / Mastercard Start Path 投資先発表

### 規制者発言
- FinCEN / CFPB / OCC / EBA / 金融庁 / FCA / MAS / BIS Innovation Hub / FATF プレスリリース

## 出力フォーマット

各 drop ファイル:

```markdown
---
type: news | paper | funding | regulator-statement
source: <媒体名>
url: <URL>
date_published: YYYY-MM-DD
fetched: YYYY-MM-DD
relevance: high | medium | low
suggested_track: A | B | C | D
suggested_destination: tracks/<path>
---

# <タイトル>

## 要約(3-5 文)
...

## なぜ KYA に関係あるか
...

## 推奨アクション
- [ ] そのまま track に統合
- [ ] subagent に詳細リサーチ依頼
- [ ] watch list に追加して様子見
```

## 必ず守ること

- 重複チェック: 既存 inbox / tracks に同じ URL がないか確認
- relevance: low の項目も記録(後で振り返り用)
- 1 日の drop は 5-15 件目安(多すぎると統合できない)
- 各ファイル 500 字以内
- 推測なし、出典必須

## 完了後の報告

- drop 件数(high/medium/low 別)
- 注目案件 1-3 件を 1 行ずつ
- 次回の `/weekly-digest` で要統合の旨を示唆
