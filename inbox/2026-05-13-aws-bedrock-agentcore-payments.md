---
type: news
source: CoinDesk / AWS Blog / Coinbase Blog
url: https://www.coindesk.com/business/2026/05/07/amazon-rolls-out-ai-agent-stablecoin-payments-platform-with-coinbase-and-stripe
date_published: 2026-05-07
fetched: 2026-05-13
relevance: high
suggested_track: A
suggested_destination: tracks/A-competitors/aws-agentcore-payments.md
---

# Amazon Bedrock AgentCore Payments — AWS × Coinbase × Stripe による AI エージェント決済基盤

## 要約（3-5 文）
AWS は 2026-05-07 に Amazon Bedrock AgentCore Payments をプレビュー公開した。AI エージェントが API・MCP サーバー・コンテンツ・他エージェントへの支払いを自律実行できる。決済レールは Coinbase wallet（x402 / USDC on Base）と Stripe Privy wallet の二択で、エンドユーザーはデビットカードまたはステーブルコインで資金供給する。x402 は HTTP-ネイティブのオープン決済プロトコルであり、マイクロペイメントを即時決済できる。対応リージョンは US East・US West・EU Frankfurt・APAC Sydney。

## なぜ KYA に関係あるか
AWS という超大手クラウドが x402 + Coinbase Wallet + Stripe Privy という非カストディ寄りのスタックをデファクト基盤として採用した点が重要。KYA の対象エージェントがどの wallet インフラで動くかの答えのひとつになりうる。Coinbase Agentic Wallets が「enterprise-grade security + programmable guardrails」を謳っており、KYA の認証・認可層との接合点を検討すべき。Warner Bros. Discovery・Heurist AI が早期採用。

## 推奨アクション
- [ ] Track A: Coinbase Agentic Wallets プロファイルを作成（`/research Coinbase Agentic Wallets`）
- [ ] Track D: x402 + Coinbase + Stripe のビジネスモデル比較に追加
- [ ] Track B: AgentCore Payments のカストディ分類・AML 義務を確認
