---
type: news
source: TechCrunch / Stripe
url: https://techcrunch.com/2026/04/30/stripe-link-digital-wallet-ai-agents-shopping/
date_published: 2026-04-30
fetched: 2026-05-12
relevance: high
suggested_track: D
suggested_destination: tracks/D-business-models/stripe-agentic-commerce-suite.md
---

# Stripe Sessions 2026 — Agentic Commerce Suite・Machine Payments Protocol (MPP) 発表

## 要約
StripeがSessions 2026でAgentic Commerce Suiteを発表。LinkウォレットをエージェントOAuth対応に拡張し、ユーザーが支払い権限を委譲できる仕組みを導入。Tempo共同開発のMachine Payments Protocol (MPP) でステーブルコイン・カード・BNPLを横断対応。Visaも本プロトコルに参加を表明。参照blog: https://stripe.com/blog/agentic-commerce-suite

## なぜ KYA に関係あるか
StripeはMPPで「エージェントが誰の権限で払うか」の委譲モデルを実装。KYAの認可レイヤー設計の有力参照実装。OAuthベースの権限委譲がKYAと統合・競合するかを Track D ビジネスモデル分析で評価する必要あり。

## 推奨アクション
- [ ] MPP仕様書を取得してKYA認可レイヤーとの差分分析（Track C/D）
- [ ] Stripe を Track A 競合プロファイル対象に追加
