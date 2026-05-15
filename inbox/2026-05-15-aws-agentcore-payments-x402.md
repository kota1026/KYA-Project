---
type: news
source: AWS Blog / CoinDesk
url: https://aws.amazon.com/blogs/machine-learning/agents-that-transact-introducing-amazon-bedrock-agentcore-payments-built-with-coinbase-and-stripe/
date_published: 2026-05-07
fetched: 2026-05-15
relevance: high
suggested_track: A
suggested_destination: tracks/A-competitors/aws-agentcore-payments.md
---

# Amazon Bedrock AgentCore Payments (Preview) — Coinbase x402 + Stripe 統合

## 要約
2026年5月7日、AWSが Amazon Bedrock AgentCore Payments をプレビュー公開。Coinbase x402 プロトコルと Stripe を統合し、AIエージェントが自律的にマイクロペイメントを実行できるマネージドインフラを提供。HTTP 402 レスポンス受信時に x402 ネゴシエーション・ウォレット認証・ステーブルコイン決済を自動処理。支出上限はインフラ層で決定論的に強制。Coinbase x402 Bazaar MCP サーバー経由で10,000以上のエンドポイントに対応。米・欧・アジア太平洋リージョンで利用可能。

## なぜ KYA に関係あるか
x402 が AWS のマネージドサービスに組み込まれたことで、エージェント決済の実質的なデファクト標準化が加速。エージェント認証・支出制御・監査ログの実装パターンが公式に示された点は Track A の競合地図と Track C の技術スタックに直結する。

## 推奨アクション
- [x] Track A に統合（AWS/Coinbase/Stripe 三者の競合ポジション更新）
- [ ] subagent に x402 V2 の技術詳細リサーチ依頼
- [ ] watch list に追加して様子見
