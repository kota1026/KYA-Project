# 戦略意思決定文書(Phase 0 最終出力)

> **Status**: Draft / Phase 0 進行中(W1)
> **Last Updated**: 2026-05-20
> **目標確定日**: 2026-08-初(W12)

このドキュメントは Phase 0 終了時点で確定する戦略判断をまとめる。
W1-W11 の間は仮置き → 暫定 → 確定の段階を経る。

## 0. Executive Summary(W1 暫定)

**ポジショニング仮説**: KYA Project = **Multi-cloud Agent Identity & Compliance Layer**。
AWS AgentCore Payments(2026-05-07 GA preview)、Google AP2、Stripe Agentic 等の **Payment Rails Layer** の上に乗る、ベンダーロックインしない **KYA(Know Your Agent)レイヤー** を提供する。

**戦略空間の根拠**: AWS は machine identity(workload identity / IAM / JWT)までしか踏み込んでいない。**人間との binding、delegation chain audit、規制 attestation、dispute mediation** は意図的に空けている。"KYA" 用語は AWS 公式 docs に登場しない(WebSearch 2026-05-20 確認)。サードパーティ(ATXP、Trulioo、Persona、Sumsub 等)が既に "AgentCore + KYA" を組み合わせで論じ始めており、市場の認識は形成されつつある。**6-12 ヶ月の戦略 window**。

**この仮説の検証は W2-W6 で完了させる**(AgentCore Identity の実装範囲精査、サードパーティ KYA 提供者の density 調査、EU AI Act 2026-08 施行影響)。

---

## 1. 法人設立国

**現状**: 未決定

**候補**:
- [ ] 日本法人(金融庁監督下、PayPay との共存しやすい)
- [ ] 米国デラウェア(MTL対応負荷大、シードラウンドのアクセス良)
- [ ] 英国(FCA Sandbox 利用可)
- [ ] シンガポール(MAS、アジア統括)
- [ ] UAE(VARA、Agent特化の枠組み有無を確認)

**判断材料(Track B から)**:
- 各法域でのノンカストディWallet開発者の地位
- 5年スパンの規制リスクシナリオ
- 法人運営コスト・税負担
- 投資家アクセス(米国法人だと米VCが入りやすい)

**暫定ポジション**: (W6-W8 で仮置き、W11 で確定)

---

## 2. ビジネスモデル

**5 候補**:
1. SDK ライセンス(B2B、200-1,000万円/社/年)
2. Hosted Audit/Dispute Backend(SaaS、月100-500万円/顧客)
3. Conformance Test / Certification
4. Insurance Layer 代理店(Lloydsや国内損保と組成、手数料収入)
5. Hybrid: OSS コア + 商用エンタープライズ機能(GitLab / Confluent 型)

**判断材料(Track A・D から)**:
- 既存プレイヤーのモデル分布
- 顧客候補(決済プロセッサ・PSP・AI agent マーケットプレイス)へのインタビュー仮説検証
- ノンカストディ前提とのモデル整合性(2 を選ぶとデータ預かり責任発生 → ノンカスト原則に矛盾)

**暫定選択(1-2つ)**: 未決定

---

## 3. 技術アーキテクチャ基本方針

**前提**: ノンカストディ型(仮置き、Track B 結果で確定)+ **AWS-as-rails、KYA-as-layer**(W1 暫定)

### レイヤー構造(W1 暫定)

```
[L3] KYA Layer ★ コタさんの戦略空間
     - Human ↔ Agent binding(DID + delegation chain)
     - Capability attestation(VC + ZKP)
     - Regulatory audit trail(7年保管、PQC migratable)
     - Dispute mediation(第三者立場)
     - Multi-cloud federation

[L2] Payment Rails Layer ← AWS AgentCore Payments / Google AP2 / Stripe Agentic
     - x402 / AP2 / Stripe Agentic protocols
     - Wallet ops(Coinbase CDP / Privy / Stripe)
     - Stablecoin settlement

[L1] Cloud Infrastructure
     - AWS / GCP / Azure / Self-hosted
```

KYA Project は **L3 のみを提供**。L2 の wallet custody や settlement には触れない → ノンカストディ前提を維持しやすい。

### 論点(Track C から)

- **DID 標準**: W3C DID v1.1 vs ERC-8004(Trustless Agents)。AWS workload identity との glue 設計
- **ZK 系**: Polygon ID / Privado ID を採用するか自前構築か。Halo2 / Plonky3 / SP1 のベンチマーク次第
- **Selective Disclosure**: VC + ZKP の組合せ(個人情報を晒さず agent の権限・人間 binding を証明)
- **PQC**: migration-able に設計、実装は 2030 年代後半(NIST FIPS 203/204/205 採用)
- **zkTLS**: Web2 認証情報を Agent に持たせる際のブリッジ
- **AgentCore Identity 統合**: AWS workload identity → DID 発行のブリッジ実装

### 確定項目(W11 で確定予定)

- [ ] DID 基盤
- [ ] ZK ライブラリ
- [ ] PQC 設計方針(migration-able のみ確定 / 即実装はしない)
- [ ] 署名長期保存(チャージバック保管7年要件)
- [ ] AgentCore Identity 連携モジュール(マルチクラウド前提で AWS は最初のターゲット)
- [ ] AP2 / Stripe Agentic とのプロトコル互換層

---

## 4. 最初の3顧客候補

**カテゴリ**:
- A. 決済プロセッサ(Stripe / Adyen / Worldpay 等)
- B. PSP(GMO / SBペイメント / PayPay内 等)
- C. AI Agent マーケットプレイス(Anthropic / OpenAI / Replit Agents / 専業スタートアップ)

**現状**: 未特定(W9-W10 で3社特定)

| カテゴリ | 候補 | 接点 | 仮説検証ステータス |
|---------|------|------|--------------------|
| A       | TBD  | TBD  | 未着手             |
| B       | TBD  | TBD  | 未着手             |
| C       | TBD  | TBD  | 未着手             |

---

## 5. PayPay との関係(Path 選択)

**4 つの分岐**:

- **Path A**: 独立プロジェクト化(法人設立、最初のSDK実装、シードラウンド調達)。Phase 1 は 6-9 ヶ月。
- **Path B**: PayPay R&D 化(社内上申、本業の一部に)
- **Path C**: Hybrid(個人開発、PayPay にライセンス供与し、他社にも販売可能)
- **Path D**: Drop(Phase 0 結果から「やる価値なし」と判断)

**判断材料**:
- PayPay 社内ニーズの強度
- 利益相反整理(コタが PayPay 内に居つつ独立して動く場合)
- 競合との時間競争(先行投資を受けたスタートアップとのスピード差)
- **AWS launch を踏まえた時間圧力**: KYA レイヤーの戦略 window は **6-12 ヶ月**(2026-Q4 〜 2027-Q2 が分水嶺)。PayPay 社内プロセスの速度と独立スタートアップの速度の比較が決定要因

**暫定ポジション**(W1): **Path C(Hybrid)が最有力**。理由:
1. AWS の時間圧力に PayPay 単独プロセスでは間に合わない可能性が高い
2. KYA Layer は multi-cloud / multi-customer 前提 → PayPay 専用にする意味が薄い
3. PayPay は最初の paying customer + 仮説検証パートナーとして最強
4. 個人開発で IP を保持しつつ PayPay にライセンス供与 → 後から Path A への切替も可能

---

## 6. リスク・前提条件

(随時追記)

- [ ] 規制リスク(US Tornado Cash 型刑事リスク、EU AMLR 2027施行影響)
- [ ] 競合先行リスク(Visa/PayPal 投資先の市場shareによる winner-takes-most)
- [ ] 技術陳腐化リスク(5年で Claude が定理証明アシスタント上級者水準到達 → 形式検証ノウハウのコモディティ化)
- [ ] 個人時間リスク(本業との両立、家庭との両立)
- [ ] **AWS 後出しリスク(NEW W1)**: AWS が re:Invent 2026(12月)で "AgentCore Compliance" / "AgentCore Identity Federation" を発表すれば KYA Layer を吸収される。継続 watch:
  - re:Invent 2026 セッション CFP(11月公開予定)に "Agent Identity" / "Agent Compliance" 系がどれだけ採択されるか
  - AWS の求人タイトル(Identity for Agents、Agent Trust、Agentic Commerce Compliance)
  - 特許出願("agent identity verification", "agentic commerce attestation")
  - AWS が ATXP / Trulioo / Persona を買収する兆候
- [ ] **マルチクラウド非対称性リスク(NEW W1)**: Google AP2、Stripe Agentic が AWS と全く違う identity モデルを採用した場合、横断 KYA Layer の設計コストが膨らむ

---

## 7. Phase 1 ゲート判断

Phase 0 終了時、以下を満たせば Phase 1 着手:

- [ ] 法人設立国 確定
- [ ] ビジネスモデル 1-2 つに絞り込み
- [ ] 技術アーキテクチャ 基本方針 確定
- [ ] 最初の3顧客候補 接点ありで特定
- [ ] Path A/B/C 選択確定(D の場合は記録のみして終了)
- [ ] 6-9 ヶ月の Phase 1 実行計画 ドラフト

---

## 8. 変更履歴

| 日付 | 変更内容 |
|------|----------|
| 2026-05-08 | 初版作成(Phase 0 開始) |
| 2026-05-20 | AWS Bedrock AgentCore Payments(2026-05-07 GA preview)を受けて戦略再フレーム。§0 Executive Summary 暫定追加(Multi-cloud KYA Layer ポジション)、§3 にレイヤー構造図、§5 暫定ポジション = Path C(Hybrid)、§6 に AWS 後出しリスク・マルチクラウド非対称性リスク追加。根拠: `inbox/2026-05-20-aws-bedrock-agentcore-payments.md`、`tracks/A-competitors/aws-bedrock-agentcore-payments.md` |
