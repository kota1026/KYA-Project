# 戦略意思決定文書(Phase 0 最終出力)

> **Status**: Draft / Phase 0 進行中(**W2** 暫定確定)
> **Last Updated**: 2026-05-20
> **目標確定日**: 2026-08-初(W12)

このドキュメントは Phase 0 終了時点で確定する戦略判断をまとめる。
W1-W11 の間は仮置き → 暫定 → 確定の段階を経る。

## 0. Executive Summary(W2 暫定)

**ポジショニング**: KYA Project = **AWS x402 ecosystem 専用の KYA 実装 + 規制 attestation packaging specialist**。

W1 で「Multi-cloud KYA Layer」と暫定したポジションを W2 で **修正**:

- **L3 KYA Layer は空いていない** — 6 社が GA、累計 $5B+ の既存ベンダー(Trulioo / Sumsub / Persona / Vouched / Skyfire / ATXP)+ 3 つのオープン標準が並行進行(DIF KYA-OS / IETF KYAPay / AgentFacts)
- **「KYA framework 提唱者」path は不可能** — Skyfire が既にオリジネーター(KYAPay protocol、IETF draft、Visa PoC)
- **配管 × KYA バンドル占有状況**:

| Payment Rails | KYA パートナー |
|---------------|----------------|
| Google AP2 | Trulioo |
| Visa Intelligent Commerce | Skyfire(KYAPay) |
| **AWS x402 / AgentCore Payments** | **空白 ★ 唯一の戦略的余白** |
| Stripe Agentic | 未確認 |

**Win Condition**:
1. AWS x402 ecosystem に対する **OSS Bridge SDK** を 2026-12 までに公開(re:Invent 2026 の AWS 後出しリスクを潰す)
2. 規制 attestation packaging(EU AI Act + AMLR + PSD3 + eIDAS 2.0 を「動く SDK」に)で差別化
3. W3C CCG / DIF / IETF SCITT への参加で標準化議論の中に立つ

**戦略 window**: AWS 後出しリスク **7 ヶ月**(2026-12 re:Invent まで)が最も切迫。EU 規制重層の市場形成期間は **12-18 ヶ月**(2026-Q4 〜 2027-Q4)に拡大可能性(AI Act 高リスク義務 2027-12 延期、Omnibus 2026-05-07 暫定合意)。

**技術 feasibility**: Medium-High(スコープ限定なら High)。**4 ヶ月 PoC が可能**(AWS-first、testnet、ZK 抜き、PQC 配線のみ)。技術スタック: did:web + SD-JWT VC + SP1 + ML-DSA dual-sig + spruceid/ssi。

**Path**: W1 暫定 **Path C(Hybrid)** を W2 で **継続支持**。PayPay = 最初の paying customer + 仮説検証パートナー。

---

## 1. 法人設立国

**現状**: W2 暫定方向性あり

**候補**:
- [ ] 日本法人(金融庁監督下、PayPay との共存しやすい、初期スタート候補)
- [ ] 米国デラウェア(MTL対応負荷大、シードラウンドのアクセス良)
- [ ] 英国(FCA Sandbox 利用可)
- [ ] シンガポール(MAS、アジア統括、初期スタート候補)
- [ ] UAE(VARA、Agent特化の枠組み有無を確認、初期スタート候補)
- [ ] **EU 法人(慎重要検討)** — AI Act provider 義務 / AMLR obliged entity / eIDAS QTSP が EU 法人に降りやすい

**判断材料(Track B から)**:
- 各法域でのノンカストディWallet開発者の地位
- 5年スパンの規制リスクシナリオ
- 法人運営コスト・税負担
- 投資家アクセス(米国法人だと米VCが入りやすい)

**暫定方向性(W2)**: **EU 域外スタート + EUDI Wallet 統合フェーズで EU 子会社検討**

根拠: `tracks/B-regulations/eu-ai-act-agent-identity-mandate.md`
- AI Act / AMLR / eIDAS 2.0 の義務は EU 法人に降りやすい
- 初期は EU 域外法人(**日本 / シンガポール / UAE**)から EU 顧客にサービス提供
- EUDI Wallet ARF v2.8.0 は delegation を未定義のため、ARF v2.9+(2027 想定)で agent representation が確定したフェーズで EU 子会社設立
- Phase 1 で弁護士確認必須(EU 顧客向け provider 義務の発生条件、AMLR obliged entity 該当性)

**W11 で確定すべき項目**: 初期法人 1 つ + EU 子会社の設立時期判断

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

**暫定選択(W2)**: **1(SDK ライセンス)+ 5(Hybrid: OSS Bridge SDK + 商用 規制 attestation packaging)** が最有力

根拠: `tracks/A-competitors/kya-layer-density-survey-2026-w2.md` の新ポジショニング 4 案のうち **案 C(規制 attestation packaging 特化)が最有力**

具体構造案:
- **OSS Bridge SDK**(GitHub 公開、AWS AgentCore × ERC-8004 glue)→ Apache 2.0 / MIT
- **商用 SaaS / SDK**: EU AI Act / AMLR / PSD3 / eIDAS 2.0 / 日本 AI 推進法に対応する **規制 attestation packaging** モジュール
- ノンカストディ前提と整合(L3 のみ提供、L2 wallet には触れない)

**棄却した選択**:
- モデル 2(Hosted Audit/Dispute Backend 単独)→ データ預かり責任発生 → ノンカスト原則と矛盾
- モデル 4 単独(Insurance 代理店)→ 競合との差別化が弱い

W3-W4 で深掘りすべき項目:
- 価格設定(SDK ライセンス 200-1,000 万円/社/年は競合 Trulioo / Sumsub の単価比較で再評価)
- OSS と商用の境界線(どの機能を OSS、どの機能を商用に振り分けるか)

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

### W2 暫定確定 技術スタック

根拠: `tracks/C-tech-trends/domains/erc-8004-agentcore-glue.md`(feasibility Medium、限定スコープなら High、4 ヶ月 PoC 可能)

| Layer | 選択 | ステータス |
|-------|------|-----------|
| **DID method** | **did:web** primary + **did:erc8004** experimental | W2 暫定 |
| **VC format** | **SD-JWT VC**(IETF draft-16、RFC 化目前)+ EU 向け **mdoc** | W2 暫定 |
| **ZK** | **SP1**(Succinct、Hypercube、Rust 親和性) | W2 暫定 |
| **PQC** | **ML-DSA-44 + Ed25519 dual-sig**(crypto-agility)。実署名は v2(2027) | W2 暫定 |
| **SSI library** | **`spruceid/ssi`**(OSS 最成熟) | W2 暫定 |
| **AgentCore 連携** | **3 層 Bridge**(Workload Access Token → did:web → SD-JWT VC → ERC-8004 agentURI → x402) | W2 暫定 |

### Bridge 3 層アーキテクチャ

```
AgentCore Workload Access Token
  └→ did:web(KYA Bridge SDK が発行)
      └→ SD-JWT VC で human↔agent binding を attest
          └→ ERC-8004 agentURI に登録 → x402 で支払い
```

**設計の基本方針**: 「ERC-8004 を採用するが **human binding は VC で外付け**」
理由: ERC-8004 NFT の譲渡可能性リスクを VC で吸収(NFT に縛らず、human↔agent binding に縛る)

### 4 ヶ月 PoC スコープ(Phase 1 Sprint 1)

- AWS-first、testnet、ZK 抜き、PQC は配線のみ
- AgentCore → did:web → SD-JWT VC → ERC-8004 agentURI → x402 のチェーンが動く

### 残課題(W3-W4 で潰す)

- **AgentCore Workload Access Token format 一次資料精査**(WebFetch 403 中、コタさんが docs を貼る予定)
- **`did:erc8004` method standardization 参加**(W3C CCG / DIF)— 戦略的に重要
- AP2 / Stripe Agentic とのプロトコル互換層は v2 以降に後回し
- 署名長期保存(チャージバック 7 年要件)の具体設計

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
- **AWS launch を踏まえた時間圧力(W2 更新)**: 二段構成の window
  - **AWS 後出しリスク = 7 ヶ月**(2026-12 re:Invent まで) — OSS Bridge 公開と標準化議論への参加が時間圧力
  - **EU 規制重層市場形成期間 = 12-18 ヶ月**(2026-Q4 〜 2027-Q4) — AI Act 高リスク義務 2027-12 延期(Omnibus 2026-05-07 暫定合意)

**暫定ポジション**(W2 継続): **Path C(Hybrid)が最有力**。理由:
1. AWS の 7 ヶ月時間圧力に PayPay 単独プロセスでは間に合わない可能性が高い
2. KYA Layer は multi-cloud / multi-customer 前提 → PayPay 専用にする意味が薄い
3. PayPay は最初の paying customer + 仮説検証パートナーとして最強
4. 個人開発で IP を保持しつつ PayPay にライセンス供与 → 後から Path A への切替も可能
5. **EU 法人設立を 18 ヶ月後に延期できる** → Path C のフットワーク維持と整合

---

## 6. リスク・前提条件

(随時追記)

- [ ] 規制リスク(US Tornado Cash 型刑事リスク、EU AMLR 2027施行影響)
- [ ] 競合先行リスク(Visa/PayPal 投資先の市場shareによる winner-takes-most)
- [ ] 技術陳腐化リスク(5年で Claude が定理証明アシスタント上級者水準到達 → 形式検証ノウハウのコモディティ化)
- [ ] 個人時間リスク(本業との両立、家庭との両立)
- [ ] **AWS 後出しリスク(W1、W2 更新)**: AWS が re:Invent 2026(12月)で "AgentCore Compliance" / "AgentCore Identity Federation with DID" を発表すれば KYA Layer を吸収される。**Tier 1-3 シグナル監視ルーティン定義済み**(`tracks/A-competitors/aws-kya-absorption-watch-list.md`)。確度: 中 / 影響: 大
- [ ] **マルチクラウド非対称性リスク(W1)**: Google AP2、Stripe Agentic が AWS と全く違う identity モデルを採用した場合、横断 KYA Layer の設計コストが膨らむ
- [ ] **L3 過密化リスク(NEW W2)**: 6 社 GA + $5B+ 累計調達 + 3 オープン標準並行進行(DIF KYA-OS / IETF KYAPay / AgentFacts)。Trulioo / Sumsub / Vouched の AWS 統合スピード次第で AWS x402 余白も狭まる。確度: 高 / 影響: 中-大
- [ ] **AI Act 構造的ギャップ閉鎖リスク(NEW W2)**: EU が agentic AI 専用の修正案 / 追加 Regulation を出すと「KYA Layer が技術標準を取りに行く」戦略が無効化。確度: 低-中 / 影響: 大
- [ ] **AMLA RTS で eIDAS QTSP 必須化リスク(NEW W2)**: 2027 RTS で agent identity が eIDAS QTSP "qualified" 義務化 → 個人 / 小規模事業者では参入不可能になる可能性。確度: 低 / 影響: 大
- [ ] **施行延期再延期 / 巻き戻しリスク(NEW W2)**: Omnibus 暫定合意(2026-05-07)の 2026-08 までの正式採択未達。確度: 中 / 影響: 中
- [ ] **ERC-8004 NFT 譲渡可能性リスク(NEW W2)**: agent identity が転売可能で規制 attestation の "発行先" が変わる。確度: 中 / 影響: 中。**KYA VC は NFT に縛らず human↔agent binding に縛る設計で回避**
- [ ] **AgentCore Workload Access Token 仕様未公開リスク(NEW W2)**: AWS docs 一次資料未取得(WebFetch 403)。外部 verifier の offline 検証可否が不明。W2-W3 でコタさん本人による直接精査が必須。確度: 高(短期) / 影響: 中

---

## 7. Phase 1 ゲート判断

Phase 0 終了時、以下を満たせば Phase 1 着手:

- [ ] 法人設立国 確定(初期 1 つ + EU 子会社の設立時期判断)
- [ ] ビジネスモデル 1-2 つに絞り込み(W2 暫定: SDK ライセンス + Hybrid OSS Bridge + 商用 規制 attestation packaging)
- [ ] 技術アーキテクチャ 基本方針 確定(W2 暫定: did:web + SD-JWT VC + SP1 + ML-DSA dual-sig + spruceid/ssi + 3 層 Bridge)
- [ ] 最初の3顧客候補 接点ありで特定
- [ ] Path A/B/C 選択確定(D の場合は記録のみして終了)
- [ ] 6-9 ヶ月の Phase 1 実行計画 ドラフト

### Phase 1 Sprint 1(4 ヶ月 PoC スコープ)— W2 暫定

- AgentCore → did:web → SD-JWT VC → ERC-8004 agentURI → x402 のチェーンが動く
- AWS-first、testnet、ZK 抜き、PQC は配線のみ
- OSS Bridge SDK を GitHub 公開(2026-12 re:Invent 前まで目標)
- 標準化参加: W3C CCG / DIF / IETF SCITT で `did:erc8004` method 議論

---

## 8. 変更履歴

| 日付 | 変更内容 |
|------|----------|
| 2026-05-08 | 初版作成(Phase 0 開始) |
| 2026-05-20 (W1) | AWS Bedrock AgentCore Payments(2026-05-07 GA preview)を受けて戦略再フレーム。§0 Executive Summary 暫定追加(Multi-cloud KYA Layer ポジション)、§3 にレイヤー構造図、§5 暫定ポジション = Path C(Hybrid)、§6 に AWS 後出しリスク・マルチクラウド非対称性リスク追加。根拠: `inbox/2026-05-20-aws-bedrock-agentcore-payments.md`、`tracks/A-competitors/aws-bedrock-agentcore-payments.md` |
| 2026-05-20 (W2) | W2 並列 3 subagent(Track A density / Track B EU AI Act / Track C ERC-8004 glue)の結果統合。**ポジション修正**: 「Multi-cloud KYA Layer」→「AWS x402 ecosystem 専用 KYA 実装 + 規制 attestation packaging specialist」。L3 が空でないこと(6 社 GA、$5B+)を認識、AWS x402 が唯一の戦略的余白であることを確定。§0 / §1(EU 域外スタート暫定方向)/ §2(SDK+Hybrid 暫定)/ §3(技術スタック did:web + SD-JWT VC + SP1 + ML-DSA dual-sig + spruceid/ssi、3 層 Bridge アーキテクチャ)/ §5(時間圧力 7 ヶ月 + 12-18 ヶ月の二段構成)/ §6(L3 過密、AI Act ギャップ閉鎖、AMLA RTS QTSP、施行延期再延期、ERC-8004 NFT 譲渡、AgentCore Workload Token 未公開の 6 リスク追加)/ §7(Phase 1 Sprint 1 4 ヶ月 PoC スコープ)を更新。根拠: `tracks/A-competitors/kya-layer-density-survey-2026-w2.md`、`tracks/B-regulations/eu-ai-act-agent-identity-mandate.md`、`tracks/C-tech-trends/domains/erc-8004-agentcore-glue.md`、`tracks/A-competitors/aws-kya-absorption-watch-list.md` |
