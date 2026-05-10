---
type: news
source: CoinDesk / AWS Blog / The Block
url: https://www.coindesk.com/business/2026/05/07/amazon-rolls-out-ai-agent-stablecoin-payments-platform-with-coinbase-and-stripe
date_published: 2026-05-07
fetched: 2026-05-10
relevance: high
suggested_track: A
suggested_destination: tracks/A-competitors/aws-bedrock-agentcore-payments.md
---

# Amazon Bedrock AgentCore Payments (Preview) — AWS × Coinbase × Stripe

## 要約
AWS が Bedrock AgentCore Payments をプレビュー公開した。AI エージェントが API・データフィード・MCP サーバー・他エージェントへの支払いを自律実行できる基盤で、Coinbase の x402 プロトコル(USDC ステーブルコイン)と Stripe の Privy ウォレットを決済レールとして採用。開発者は Coinbase ウォレットまたは Stripe Privy ウォレットを選択でき、エンドユーザーはデビットカードまたは暗号資産で資金調達可能。ポリシーベースの支出上限とフル監査証跡を内蔵。Warner Bros. Discovery、Thomson Reuters、Cox Automotive など大手が早期採用中。

## なぜ KYA に関係あるか
x402 を軸にした agent-to-agent マイクロペイメントの商用実装として最大級の事例。ウォレット管理・支出ポリシー・監査証跡はそのまま KYA の permission control / behavior monitoring に対応する要件。非カストディ vs カストディの実装比較としても重要(Stripe Privy = カストディ寄り)。

## 推奨アクション
- [ ] Track A に競合プロファイルとして統合
- [ ] x402 プロトコル詳細を Track C に連携
- [ ] Stripe Privy のカストディ設計を Track B(規制適合性)の観点で要確認
