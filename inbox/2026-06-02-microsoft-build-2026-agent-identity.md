---
type: news
source: Microsoft Security Blog
url: https://www.microsoft.com/en-us/security/blog/2026/06/02/microsoft-build-2026-securing-code-agents-and-models-across-the-development-lifecycle/
date_published: 2026-06-02
fetched: 2026-06-02
relevance: high
suggested_track: A
suggested_destination: tracks/A-competitors/microsoft-agent-identity.md
---

# Microsoft Build 2026: Securing Code, Agents, and Models — Agent Identity 発表

## 要約
Microsoft Build 2026（6月2日開幕）にて、エージェントセキュリティに関する複数の機能を発表。**Agent Identity**：各エージェントを Windows ユーザーまたはサービスプリンシパルに紐付け、Intune ポリシーで管理。**Autopilot エージェント**：自前の Identity を持ち、設定されたパーミッションの範囲内で自律動作。Agent 365 SDK が GA となり、可観測性・アクセス制御・コンプライアンス強制を開発者が組み込み可能に。

## なぜ KYA に関係あるか
「エージェント = 企業 ID に紐付くエンティティ」という Microsoft のアーキテクチャ設計が、KYA における identity binding の事実標準に影響しうる。Autopilot の「self-signed identity + policy scope」は ノンカストディ型 KYA の設計参考になる。エンタープライズ市場での採用速度が大きい分、相互運用性への影響も大きい。

## 推奨アクション
- [ ] Track A プロファイルに Microsoft 競合分析として追記
- [ ] Track C の agent identity 標準動向ファイルとクロスリファレンス
- [ ] Agent 365 SDK の identity モデルを competitor-researcher で深堀り依頼
