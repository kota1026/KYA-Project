---
company: Amazon Bedrock AgentCore Payments(Amazon Web Services)
slug: aws-bedrock-agentcore-payments
last_updated: 2026-05-20
status: active
hq: Seattle, WA, USA
website: https://aws.amazon.com/bedrock/agentcore/
category: payment-protocol
---

# AWS Bedrock AgentCore Payments

## 1行サマリ

AWS が 2026-05-07 に Preview 開始したマネージド Agent Payments サービス。**x402 protocol + Coinbase + Stripe + Privy** を統合し、AI Agent が API・MCP server・他 Agent に stablecoin で自律支払い可能。

## (a) 技術アプローチ

- **アーキテクチャ**: マネージドサービス(AWS が運用)+ ノンカストディ wallet 統合(Coinbase CDP / Privy が wallet を提供)
- **主要プロトコル**: **x402**(HTTP 402 "Payment Required" → wallet 署名 → proof of purchase) — Coinbase が提唱したオープン仕様。Google AP2 や Stripe Agentic とは別系統
- **スタック**:
  - `PaymentManager`(workload identity + auth config + IAM role)
  - `PaymentCredentialProvider`(Coinbase CDP API key / Privy app credential を AWS Secrets Manager に格納)
  - `PaymentConnector`(PaymentCredentialProvider を参照する接続)
  - **AgentCore Identity**(workload identity、AWS_IAM または CUSTOM_JWT 認証)
- **SDK**: AWS CLI / AWS SDK / **AgentCore SDK** / Strands Agents framework 統合(出典: AWS Blog 2026-05-07)
- **公開リポジトリ**: 未確認(AgentCore SDK の公開状況、サンプル repo の有無は W2 で再調査)

## (b) 責任分界点の設計思想

- **ユーザー**: 最終的な支払い意思決定者。consent + spending limit 設定
- **Agent 所有者**: AWS account holder。IAM role / JWT subject 経由で Agent action に紐付く
- **AWS**: 配管提供者。credential storage、observability、authorization layer
- **Coinbase / Stripe / Privy**: wallet custody + settlement(ノンカストディ wallet として Privy / CDP は秘密鍵をユーザーに保持させる構造、出典: ATXP 解説記事、推定)
- **Dispute Resolution**: 未確認(AWS docs に明示記述あるかは一次資料直接確認が必要)

**重要な観察**: AWS は **machine identity** までは設計しているが、**人間との binding(delegation chain audit)** および **規制 attestation** は仕様空間として空けている → KYA レイヤーの戦略的余白

## (c) 規制対応スタンス

- **法人**: Amazon Web Services Inc.(US)/ Amazon EU SARL(EU)
- **取得ライセンス**: AWS 本体はクラウドプロバイダ。Money Transmitter / EMI 等は **Coinbase / Stripe / Privy 側** が保持(推定、要 W2 確認)
- **「規制エンティティでない」主張の有無**: AWS 公式 blog では "the Payments service does not custody funds"(推定的表現、要原文確認)。Coinbase が MTL を持つ州で運用、Stripe は EMI/MTL を保有
- **AWS docs 内の "KYA" / "Know Your Agent" 出現**: **ゼロ**(WebSearch site:docs.aws.amazon.com で確認、2026-05-20)
- **規制者発言**: 未確認

## (d) 資金調達と投資家構成

- 該当なし(Amazon の事業部門。NASDAQ:AMZN)
- パートナー企業の動き(Coinbase Ventures / Stripe など)は `tracks/A-competitors/funding/` で個別追跡

## (e) 主要顧客・パートナー

- **公表パートナー**: Coinbase、Stripe、Privy(出典: AWS Blog 2026-05-07)
- **公表顧客**: 未確認(Preview ステージ、GA 後に増加見込み)
- **統合フレームワーク**: Strands Agents(出典: 同 Blog)
- **推定 ARR / ユーザー数**: Preview のため未開示

## 戦略的含意(KYA 視点)

**競合度: 補完(Layer 違いの隣接)**

AWS は **Payment Rails Layer**(L2)を抑えたが、**KYA Layer**(L3)は意図的に未着手 — または競合製品が出る前の余白として残してある。

### コタさん KYA プロジェクトとの関係

| 観点 | AWS AgentCore | KYA Project が狙う場所 |
|------|---------------|----------------------|
| Machine identity | ✅ AgentCore Identity | (利用する側) |
| Human binding | ⚠️ IAM principal どまり | ✅ **DID + delegation audit** |
| Capability attestation | ⚠️ JWT scope どまり | ✅ **規制適合 attestation** |
| Audit trail | ✅ Payment observability | ✅ **規制提出用 audit** |
| Dispute mediation | ❌ 未確認 | ✅ **独立第三者として位置取り** |
| Multi-cloud | ❌ AWS lock-in | ✅ **AWS / GCP / Azure / 自前 横断** |

### 学べる点

- **マネージドサービス化**の良い参考。コタさんの SDK は AWS 上でも GCP 上でも動く必要あり
- **x402 を採用**したことで、ノンカストディ wallet 統合の標準パターンが事実上確定
- AWS Secrets Manager 相当の credential federation を **マルチクラウド版で設計** すれば、AWS 顧客でも KYA Project の SDK を採用する動機が生まれる

### 警戒すべき動き

1. **AWS が KYA レイヤーを自前で吸収するシナリオ**:
   - re:Invent 2026(12 月)で "AgentCore Compliance" / "AgentCore Identity Federation" 系の発表があれば要警戒
   - 求人タイトル(Identity for Agents、Agent Trust)を継続監視
   - 特許出願("agent identity verification", "agentic commerce attestation")
2. **Google AP2 / Stripe Agentic との競合**:
   - GCP が同等 OEM を出した時、KYA レイヤーが両方を吸収できる中立性が価値になる
3. **AWS が ATXP / Trulioo を買収するシナリオ**:
   - サードパーティ KYA 企業の AWS 系投資が増えると後出し買収の兆候

## ソース

- [AWS Blog: Agents that transact](https://aws.amazon.com/blogs/machine-learning/agents-that-transact-introducing-amazon-bedrock-agentcore-payments-built-with-coinbase-and-stripe/) — 2026-05-07 アクセス 2026-05-20
- [What's New: AgentCore Payments preview](https://aws.amazon.com/about-aws/whats-new/2026/04/amazon-bedrock-agentcore-payments-preview/) — アクセス 2026-05-20
- [AWS Weekly Roundup 2026-05-11](https://aws.amazon.com/blogs/aws/aws-weekly-roundup-amazon-bedrock-agentcore-payments-agent-toolkit-for-aws-and-more-may-11-2026/)
- [AgentCore Payments dev guide](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/payments.html)
- [AgentCore Identity overview](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/identity-overview.html)
- [AgentCore Payments core concepts](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/payments-concepts.html)
- [x402 and Agentic Commerce | AWS for Industries](https://aws.amazon.com/blogs/industries/x402-and-agentic-commerce-redefining-autonomous-payments-in-financial-services/)
- [Coindesk: Amazon's new AI wallet](https://www.coindesk.com/business/2026/05/07/amazon-rolls-out-ai-agent-stablecoin-payments-platform-with-coinbase-and-stripe) — 2026-05-07 アクセス 2026-05-20
- [ATXP: Know Your Agent (KYA) explained](https://atxp.ai/blog/know-your-agent-kya-explained/) — third-party 統合論
- [Trulioo: KYA Identity Framework](https://www.trulioo.com/resources/white-papers/know-your-agent-an-identity-framework-for-trusted-agentic-commerce)

## W2 で深掘りすべき項目

- [ ] AWS docs(payments-concepts, payments-how-it-works, identity)の一次資料を直接精読
- [ ] AgentCore SDK 公開 repo / sample code 確認
- [ ] AWS の MTL / Money Transmitter ポジション(Coinbase / Stripe との責任分界)
- [ ] re:Invent 2026 セッション CFP に "Agent Identity" 系がどれだけ採択されるか(11月公開予定)
- [ ] Strands Agents framework と AgentCore Identity の統合詳細
