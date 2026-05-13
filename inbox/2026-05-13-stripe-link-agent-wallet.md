---
type: news
source: TechCrunch / Stripe Blog / Stripe Sessions 2026
url: https://techcrunch.com/2026/04/30/stripe-link-digital-wallet-ai-agents-shopping/
date_published: 2026-04-30
fetched: 2026-05-13
relevance: high
suggested_track: A
suggested_destination: tracks/A-competitors/stripe-link-agent-wallet.md
---

# Stripe Sessions 2026: Link Agent Wallet — ユーザー資格情報を渡さず AI エージェントに支払い権限を委譲

## 要約（3-5 文）
Stripe は 2026-04-29 の Sessions 2026 カンファレンスで Link Agent Wallet を発表した。ユーザーは OAuth フローでエージェントに Link wallet へのアクセスを付与し、エージェントは spend request を生成してユーザー承認を待つ設計。カード番号はエージェントに渡らない。あわせて「Machine Payments Protocol」（2026-03 発表）と x402（USDC on Base、2026-02 発表）を含む Agentic Commerce Suite を完成させた。

## なぜ KYA に関係あるか
「カード情報を渡さずに支払い委任」はカストディ vs ノンカストディの境界問題に直結する。OAuth ベースの委任モデルはエージェント認証（KYA）の認可レイヤーの参照実装候補になる。Stripe が規制領域で実装をどう設計しているかは Track B の非カストディ論点でも引用できる。

## 推奨アクション
- [ ] Track A: Stripe 競合プロファイルを更新（Agentic Commerce Suite 全体を整理）
- [ ] Track B: OAuth 委任モデルが PSD2 SCA や CFPB 規制とどう整合するか確認
