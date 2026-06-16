---
type: news
source: AWS Blog / Genfinity / BanklessTimes
url: https://aws.amazon.com/blogs/industries/x402-and-agentic-commerce-redefining-autonomous-payments-in-financial-services/
date_published: 2026-06-16
fetched: 2026-06-16
relevance: high
suggested_track: A
suggested_destination: tracks/A-competitors/x402-ecosystem.md
---

# Coinbase + AWS、x402 を CloudFront・WAF に統合—インターネット流量の約 25% でエージェント決済が有効化

## 要約（3-5 文）
2026-06-16、Coinbase と AWS が x402 プロトコルを Amazon CloudFront および WAF へ統合したと発表した。AI エージェントがコンテンツをリクエストすると、サーバーが価格を含む支払い要求を返し、エージェントが Base ネットワーク上の USDC で即時決済する。決済確認後にコンテンツが解放されるため、別途 API キー・請求書・アカウント開設が不要。CloudFront は全インターネット流量の約 25% を処理しており、AWS は x402 Foundation の創設メンバーとして加盟（他に約 20 社）。

## なぜ KYA に関係あるか
x402 による決済時に「どのエージェントが」支払いを行ったかの身元確認が現行では匿名のまま。AWS 規模でのロールアウトは KYA 未実装のまま大量流量に適用される可能性を示し、Track A のプロトコル競争でも x402 が事実上の決済レールとなるリスク・機会を高める。Track D 収益モデル（API 従量課金）の実証事例としても参照価値が高い。

## 推奨アクション
- [ ] tracks/A-competitors/x402-ecosystem.md に AWS 統合を追記
- [ ] x402 Foundation メンバー 20 社リストを取得し Track A 競合マップ更新
- [ ] KYA 側の identity レイヤーが x402 フロー内で実装可能か技術検討
