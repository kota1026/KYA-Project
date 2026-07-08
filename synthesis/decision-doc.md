# 戦略意思決定文書(Phase 0 最終出力)

> **Status**: Draft / Phase 0 進行中(**W3** 暫定確定)
> **Last Updated**: 2026-06-01
> **目標確定日**: 2026-08-初(W12)

このドキュメントは Phase 0 終了時点で確定する戦略判断をまとめる。
W1-W11 の間は仮置き → 暫定 → 確定の段階を経る。

## 0. Executive Summary(W3 暫定確定)

**ポジショニング**: KYA Project = **AWS x402 ecosystem 専用の KYA 実装 + 規制 attestation packaging specialist**(W2 確定、W3 維持)。

**法的根拠(W3 で確定)**:
- **AMLR Article 79** が "self-hosted wallet manufacturers/providers, **insofar as they do not possess access to or control over these crypto-asset wallets**" を **明示除外** → KYA Layer の "infrastructure provider" 位置取りに **条文レベルの根拠**
- **AMLR Article 22(1)** "any person purporting to act on behalf of the customer" → **CASP は agent の背後の人間 customer を CDD**、KYA の human ↔ agent binding attestation が技術根拠としてダイレクトに使える
- **EU EBW(European Business Wallet、COM 2025/838 final、2025-11-19 提案)** が Recital 28 で agentic AI を Implementing Acts 委任で明示
- **WE BUILD consortium 2026-03 non-paper**: 「mutual authentication between AI agents, verify the relationship between a human and their agent」を公式提唱 → **KYA Project の核ユースケースと完全一致**
- **US NIST AI Agent Standards Initiative**(2026-02-17 launch、Q4 2026 v1)が identity/authorization/monitoring/logging を扱う → KYA SDK = NIST IO Profile reference implementation という新ポジション

**配管 × KYA バンドル占有状況**(W2 確定、W3 維持):

| Payment Rails | KYA パートナー |
|---------------|----------------|
| Google AP2 | Trulioo |
| Visa Intelligent Commerce | Skyfire(KYAPay) |
| **AWS x402 / AgentCore Payments** | **空白 ★ 唯一の戦略的余白** |
| Stripe Agentic | 未確認 |

**Win Condition**:
1. AWS x402 ecosystem に対する **OSS Bridge SDK** を 2026-12 までに公開(re:Invent 2026 の AWS 後出しリスクを潰す)
2. 規制 attestation packaging(JP AI ガイドライン v1.2 + US 5 件セット + EU AMLR Art. 22/79 + EBW Implementing Acts)を「動く SDK」に
3. **WE BUILD consortium engagement + NIST AI Agent Standards 参加** で標準化議論に入り込む(W3 追加、Phase 1 最重要 stakeholder task)

**戦略 window**(W3 で拡大):
- **AWS 後出しリスク = 7 ヶ月**(2026-12 re:Invent まで)— 不変
- **EU 規制重層市場形成期間 = 12-24 ヶ月**(W2「12-18」→ W3「12-24」、EBW Recital 28 / WE BUILD non-paper / ARF v3.0 が 2027-Q2〜Q3 の発見による)
- **新 time pressure**: AMLA Article 28(1) RTS lockdown **2026-Q4 〜 2027-Q1** = KYA SDK design lockdown deadline

**Primary integration target**(W3 で明確化):
- **Coinbase CDP / Privy / Stripe = CASP として AMLR 直接適用** → KYA primary integration target(義務側)
- **AWS AgentCore Payments = non-custodial protocol orchestrator**(CASP 非該当寄り) → Bridge を AgentCore SDK 経由で接続

**技術 feasibility**: Medium-High(スコープ限定なら High)。**4 ヶ月 PoC が可能**。技術スタック(W2 暫定 + W3 補強): did:web + SD-JWT VC + mdoc + SP1 + ML-DSA dual-sig + spruceid/ssi + **HAIP + OpenID Federation + mdoc remote(ISO 18013-7)+ Cloudflare Web Bot Auth(IETF RFC 9421)+ AMLR module**。

**Path**: W1-W2 暫定 **Path C(Hybrid)** を **W3 で強く支持**。日本最有力法人候補、PayPay = 最初の paying customer(案 A: 内部処理ツール設計)、US 子会社は 2027-Q3 以降、EU 子会社は 2028-Q1 以降(France or Italy)。

---

## 1. 法人設立国

**現状**: W3 で **日本最有力候補に強く収束**

### 候補と W3 後の評価

| 候補 | W3 評価 | 主要根拠 |
|------|--------|---------|
| **日本法人** ★ | **最有力** | (1) Agent Identity 明示義務ゼロ(2026-06)= 規制負担最軽量、(2) PayPay 同居 = Path C の paying customer 直接アクセス、(3) AI 事業者ガイドライン v1.2(2026-03-31)が事実上 KYA 機能要件カタログ → 準拠ツールとして売れる、(4) 標準化議論参加可能(JPKI 系) |
| シンガポール法人 | 比較継続 | 税負担・国際投資家アクセスで日本より有利。ただし PayPay 連携の物理距離 |
| UAE 法人 | 比較継続 | VARA Agent 特化の枠組みを W4 で確認。多くの戦略投資家不在 |
| 米国デラウェア | **W3 段階で除外** | Tornado Cash 起訴リスク(18 USC §1960、SDNY 管轄、確度: 低-中 / 影響: 極大)+ MTL 50 州負荷 + DOJ AI Litigation Task Force ターゲット化 |
| 英国 | 低 | FCA Sandbox は魅力的だが PayPay 連携・標準化議論で日本に劣後 |
| **EU 法人** | **2028-Q1 以降に延期** | AI Act provider 義務 / AMLR obliged entity / eIDAS QTSP 認定が降りる。**設立地候補 = France または Italy**(WE BUILD 所在地・EUDI Wallet 先行加盟国)。AMLA 直接監督対象(2028-01 開始)を避けるため初期は EU 域外、QTSP 必須化シナリオ確定(2027-Q2)後に判断 |
| **US 子会社** | **2027-Q3 以降に延期** | NIST AI Agent IO Profile v1 安定 + Tornado Cash retrial 結果 + GENIUS Act 規則確定後に再評価 |

### 暫定方向性(W3 確定方向)

**初期: 日本法人(東京)** → ★ 最有力

根拠:
- `tracks/B-regulations/jp-ai-promotion-act-agent-identity.md` — 規制負担最軽量、PayPay 同居、AI ガイドライン v1.2 準拠ツール市場
- `tracks/B-regulations/us-ai-act-agent-identity-mandate.md` — US 法人を Phase 0 段階で避ける強い根拠
- `tracks/B-regulations/eidas-2-eudi-wallet-agent-delegation.md` — EU 子会社 2028-Q1 以降 France/Italy
- `tracks/B-regulations/amlr-2027-casp-agent-cdd.md` — AMLA 直接監督(2028-01)を避けるため初期 EU 域外

**多国展開ロードマップ(W3 暫定)**:
- 2026-Q3: 日本法人設立
- 2027-Q3 以降: 米国子会社(LLC or C-corp)
- 2028-Q1 以降: EU 子会社(France または Italy)、EBW pilot ベンダー化、QTSP 検討

### Phase 1 弁護士確認 must-have(JP 視点で W3 追加、Track B JP より)

1. SDK ライセンス契約の「業務委託」認定回避文言(犯収法施行規則 32 条、資金移動業者監督指針 II-3)
2. KYA SDK の判定 / 確認業務を直接実行しない設計(KYA は attestation packaging / 検証のみ)
3. PayPay の AI サービス利用規約と KYA SDK の整合性確認
4. JPKI 一本化(2027-04)対応の技術設計(did:jpki または JPKI を VC issuer として組み込む)
5. 為替取引(銀行法 4 条 1 項)該当性の整理
6. 個人情報保護法上の取扱い(2025 改正検討中の動向追跡)

**W11 で確定すべき項目**: 初期法人 1 つ + 米国子会社 + EU 子会社の設立時期判断

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

**暫定選択(W2 → W3 維持)**: **1(SDK ライセンス)+ 5(Hybrid: OSS Bridge SDK + 商用 規制 attestation packaging)** が最有力

根拠: `tracks/A-competitors/kya-layer-density-survey-2026-w2.md` の新ポジショニング 4 案のうち **案 C(規制 attestation packaging 特化)が最有力**

### W3 で精緻化した規制 attestation packaging メニュー

法域別の packaging セット:

**日本向け** — `tracks/B-regulations/jp-ai-promotion-act-agent-identity.md` 根拠
- AI 事業者ガイドライン v1.2(2026-03-31 経産省+総務省)準拠ツール packaging
- Human-in-the-Loop / 最小権限原則 / トレーサビリティ機能を attestation 化
- 金融庁 AIDP 1.1 対応(2026-03-03 規制ギャップ宣言 → 2027-2028 規制リスク発火点に備える)

**US 向け** — `tracks/B-regulations/us-ai-act-agent-identity-mandate.md` 根拠
1. FTC Section 5 deceptive 防御 packaging
2. FinCEN BSA ノンカスト宣言 packaging
3. **NIST AI Agent IO Profile compliant**(2026-02-17 launch、Q4 2026 v1)reference implementation
4. TX TRAIGA Safe Harbor packaging(NIST AI RMF Safe Harbor 採用)
5. GENIUS Act non-issuer 明示 + issuer-facing API(2027-01-18 施行)

**EU 向け** — `tracks/B-regulations/eu-ai-act-agent-identity-mandate.md`、`amlr-2027-casp-agent-cdd.md`、`eidas-2-eudi-wallet-agent-delegation.md` 根拠
- AI Act Art. 50 transparency disclosure packaging(2026-08 施行)
- AMLR Art. 22(1) "purporting to act" CDD attestation
- AMLR Art. 79 "no access/control" 明文化 packaging(KYA 自体の AMLR 適用除外根拠)
- AMLR Art. 18 outsourcing 契約構造テンプレート
- EBW Implementing Acts 準拠 packaging(2027 Implementing Acts 公表後)
- TFR(Travel Rule)originator info 添付 SDK

### 具体構造案

- **OSS Bridge SDK**(GitHub 公開、AWS AgentCore × ERC-8004 glue)→ Apache 2.0 / MIT
- **商用 SaaS / SDK**: 上記法域別 packaging モジュール
- ノンカストディ前提と整合(L3 のみ提供、L2 wallet には触れない)
- **AMLR Art. 79 ベースで KYA Project 自体は非 obliged entity 化**

**棄却した選択**:
- モデル 2(Hosted Audit/Dispute Backend 単独)→ データ預かり責任発生 → ノンカスト原則と矛盾
- モデル 4 単独(Insurance 代理店)→ 競合との差別化が弱い

W4 で深掘りすべき項目:
- 価格設定(SDK ライセンス 200-1,000 万円/社/年は競合 Trulioo / Sumsub の単価比較で再評価)
- OSS と商用の境界線(どの機能を OSS、どの機能を商用に振り分けるか)
- 法域別 packaging のうち Phase 1 出荷の優先順位(JP + AMLR Art. 79 が最優先候補)

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

### 技術スタック(W2 暫定確定 → W3 で ARF 必須仕様と完全整合を確証)

根拠: `tracks/C-tech-trends/domains/erc-8004-agentcore-glue.md`、`tracks/B-regulations/eidas-2-eudi-wallet-agent-delegation.md`

| Layer | 選択 | ステータス |
|-------|------|-----------|
| **DID method** | **did:web** primary + **did:erc8004** experimental + **did:jpki**(将来、JP 2027-04 対応) | W2 暫定 + W3 補強 |
| **VC format** | **SD-JWT VC**(IETF draft-16、RFC 化目前)+ EU 向け **mdoc**(ISO 18013-5/7) | W2 暫定 → W3 で ARF 必須整合確証 |
| **ZK** | **SP1**(Succinct、Hypercube、Rust 親和性) | W2 暫定 |
| **PQC** | **ML-DSA-44 + Ed25519 dual-sig**(crypto-agility)。実署名は v2(2027) | W2 暫定 |
| **SSI library** | **`spruceid/ssi`**(OSS 最成熟) | W2 暫定 |
| **AgentCore 連携** | **3 層 Bridge**(Workload Access Token → did:web → SD-JWT VC → ERC-8004 agentURI → x402) | W2 暫定 |
| **HAIP**(High Assurance Interoperability Profile) | OID4VCI / OID4VP の Profile | **W3 追加 — Phase 1 必須** |
| **OpenID Federation** | EU ARF が要求する trust framework | **W3 追加 — Phase 1 必須** |
| **mdoc remote**(ISO 18013-7) | EU 向け remote presentation | **W3 追加 — Phase 1 必須** |
| **Cloudflare Web Bot Auth**(IETF RFC 9421) | AWS 顧客 + web bot 標準互換 | **W3 追加 — Phase 1 必須** |
| **AMLR module** | Art. 22(1) + Art. 20(1)(c) + Art. 21 + Art. 79 positioning | **W3 追加 — Phase 1 必須** |

### Bridge 3 層アーキテクチャ + AMLR module(W3 拡張)

```
AgentCore Workload Access Token
  └→ did:web(KYA Bridge SDK が発行)
      └→ SD-JWT VC で human↔agent binding を attest
          ├→ ERC-8004 agentURI に登録 → x402 で支払い
          ├→ AMLR Art. 22(1) "purporting to act" CDD 充足
          ├→ Art. 20(1)(c) delegation mandate VC(scope/limit/duration)
          ├→ Art. 21 verify 失敗時の block hook
          └→ Art. 79 "no access/control" 明文化(SDK 契約 + 技術 spec)
```

**設計の基本方針**: 「ERC-8004 を採用するが **human binding は VC で外付け**」
理由: ERC-8004 NFT の譲渡可能性リスクを VC で吸収(NFT に縛らず、human↔agent binding に縛る)

### 4 ヶ月 PoC スコープ(Phase 1 Sprint 1)

- AWS-first、testnet、ZK 抜き、PQC は配線のみ
- AgentCore → did:web → SD-JWT VC → ERC-8004 agentURI → x402 のチェーンが動く
- **W3 追加スコープ**: AMLR Art. 22(1)/20(1)(c)/21/79 module、HAIP、OpenID Federation、Cloudflare Web Bot Auth 互換

### 残課題(W4 で潰す)

- **AgentCore Workload Access Token format 一次資料精査**(WebFetch 403 中、コタさんが docs を貼る予定)— **Bridge 設計の中核未確定**
- **`did:erc8004` method standardization 参加**(W3C CCG / DIF)— 戦略的に重要
- **WE BUILD consortium engagement**(non-paper 精読 + メンバー連携経路) — W3 で発見した最重要 stakeholder task
- **NIST AI Agent Standards Initiative 参加**(Q4 2026 v1 release 前にコメント提出)
- **AMLA Article 28(1) RTS Draft 業界 response 分析**(2026-05-08 終了済 → eIDAS QTSP 必須化リスクの確度確定材料)
- AP2 / Stripe Agentic とのプロトコル互換層は v2 以降に後回し
- 署名長期保存(チャージバック 7 年要件)の具体設計
- **JPKI 一本化(2027-04)対応の技術設計**(did:jpki 仮称または JPKI VC issuer 組み込み)

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
- **時間圧力(W3 更新)**: 三段構成の window
  - **AWS 後出しリスク = 7 ヶ月**(2026-12 re:Invent まで)— OSS Bridge 公開と標準化議論への参加が時間圧力
  - **AMLA RTS lockdown = 6-10 ヶ月**(2026-Q4 〜 2027-Q1) — KYA SDK design lockdown の deadline(eIDAS QTSP 必須化リスク確定タイミング)
  - **EU 規制重層市場形成期間 = 12-24 ヶ月**(W2「12-18」→ W3「12-24」、EBW Implementing Acts 2028-2029 想定)

**暫定ポジション**(W3 強支持): **Path C(Hybrid)が最有力**。理由:
1. AWS の 7 ヶ月時間圧力に PayPay 単独プロセスでは間に合わない可能性が高い
2. KYA Layer は multi-cloud / multi-customer 前提 → PayPay 専用にする意味が薄い
3. PayPay は最初の paying customer + 仮説検証パートナーとして最強(JP 法的に **案 A: 内部処理ツール設計** で実現可能)
4. 個人開発で IP を保持しつつ PayPay にライセンス供与 → 後から Path A への切替も可能
5. **EU 法人設立を 2028-Q1 まで延期できる** → Path C のフットワーク維持と整合

### PayPay 連携の Path C 成立前提(W3 で確定、Track B JP より)

PayPay = 第二種資金移動業者(関東財務局長第 00068 号、PayPay 銀行は別法人)。SDK 連携の 3 分岐のうち **案 A(内部処理ツール)** を採用 = 追加届出なし。

**SDK ライセンス契約で「業務委託」認定回避が must-have**:
- KYA SDK = PayPay 内部の判定補助ツール
- KYA Project が確認業務を直接実行しない設計
- 犯収法施行規則 32 条、資金移動業者監督指針 II-3 に整合

Phase 1 弁護士確認 6 項目は §1 参照。

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
- [ ] **AMLA RTS で eIDAS QTSP 必須化リスク(W2「低」→ W3「中-高」上方修正)**: AMLA Article 28(1) RTS Draft 2026-02-09 公表 / 2026-05-08 業界 response 終了。AMLR Art. 22(6)(b) が eIDAS substantial/high + QES を明示参照 → "reliable and independent sources" を QTSP-only に絞る解釈シナリオが現実的。**「中-高」止まりの理由**: Art. 22(6) は "may use"(任意)、業界 response の QTSP-only 反対、紙ベース ID 伝統許容。**確度: 中-高 / 影響: 大**
- [ ] **施行延期再延期 / 巻き戻しリスク(W2)**: Omnibus 暫定合意(2026-05-07)の 2026-08 までの正式採択未達。確度: 中 / 影響: 中
- [ ] **ERC-8004 NFT 譲渡可能性リスク(W2)**: agent identity が転売可能で規制 attestation の "発行先" が変わる。確度: 中 / 影響: 中。**KYA VC は NFT に縛らず human↔agent binding に縛る設計で回避**
- [ ] **AgentCore Workload Access Token 仕様未公開リスク(W2)**: AWS docs 一次資料未取得(WebFetch 403)。外部 verifier の offline 検証可否が不明。W4 でコタさん本人による直接精査が必須。確度: 高(短期) / 影響: 中

### W3 で追加(US 法域、5 件)— `tracks/B-regulations/us-ai-act-agent-identity-mandate.md` 根拠

- [ ] **Tornado Cash 型刑事リスク直接降下リスク(NEW W3)**: DOJ が 2019 FinCEN Guidance を criminal case で非拘束と主張、Storm 有罪(2025-08-06)。KYA SDK が "agent が金を動かす" enable と認定されると 18 USC §1960 起訴リスク(SDNY 管轄)。**US 法人設立を Phase 0 段階で避ける強い根拠**。確度: 低-中 / 影響: 極大
- [ ] **DOJ AI Litigation Task Force 攻撃の二次波及リスク(NEW W3)**: 2026-01-10 launch。連邦個別執行リスクの中核。確度: 低 / 影響: 中
- [ ] **GENIUS Act stablecoin issuer 認定リスク(NEW W3)**: 2027-01-18 施行。KYA SDK が stablecoin issuer enabler 認定されると BSA/KYC 直接義務。確度: 低 / 影響: 大
- [ ] **NIST AI Agent IO Profile Q4 2026 v1 内容変更リスク(NEW W3)**: KYA SDK = reference implementation 戦略破綻の可能性。確度: 中 / 影響: 大
- [ ] **FTC AI Policy Statement の予測不能性リスク(NEW W3)**: Trump 政権下 6 ヶ月単位で変動。確度: 高 / 影響: 中

### W3 で追加(JP 法域、3 件)— `tracks/B-regulations/jp-ai-promotion-act-agent-identity.md` 根拠

- [ ] **JPKI 一本化リスク(NEW W3)**: 2027-04-01 改正犯収法施行規則で本人確認が JPKI(マイナンバーカード公的個人認証)に一本化。KYA DID 戦略が国家 ID 統合前提化、did:jpki 仮称または JPKI VC issuer 組み込みが必要。確度: 中 / 影響: 大
- [ ] **業務委託先認定リスク(NEW W3)**: SDK ライセンス契約で「業務委託」認定されると関東財務局届出 + 再委託管理が PayPay 側に発生。Path C(案 A: 内部処理ツール)成立の前提が崩れる。確度: 中 / 影響: 中
- [ ] **金融庁 AIDP 昇格リスク / 機会(NEW W3)**: 2026-03-03 AIDP 1.1 が "規制ギャップ" を明示 → 2027-2028 に法令対応の可能性。KYA Layer にとってはリスク + 機会の両面。確度: 中 / 影響: 中

### W3 で追加(EU eIDAS / EBW、4 件)— `tracks/B-regulations/eidas-2-eudi-wallet-agent-delegation.md` 根拠

- [ ] **EBW Implementing Acts 技術 spec 非互換リスク(NEW W3)**: EBW(2025-11-19 提案、2028-2029 Implementing Acts 想定)が KYA 技術スタックと非互換な spec を採択。確度: 中 / 影響: 大
- [ ] **WE BUILD non-paper Commission 不採用リスク(NEW W3)**: 2026-03 提出済の non-paper が Implementing Acts に反映されない。確度: 中 / 影響: 中-大
- [ ] **米国大手の WE BUILD 連携先行リスク(NEW W3)**: AWS / Google / Microsoft / Meta が WE BUILD に直接 commit し標準握る。確度: 中 / 影響: 大
- [ ] **加盟国 EUDI Wallet 提供遅延連鎖リスク(NEW W3)**: Germany 2027-01-02 遅延 / Netherlands 遅延 / Spain 課題 → EU 全域 KYA 普及が遅れる。確度: 高 / 影響: 中

### W3 で追加(EU AMLR、4 件)— `tracks/B-regulations/amlr-2027-casp-agent-cdd.md` 根拠

- [ ] **CASP 一律拒否リスク(NEW W3)**: AMLR 該当性 grey の AWS x402 で CASP 側(Coinbase CDP / Privy / Stripe)が agent 経由 transaction を一律拒否する保守的解釈を取る。確度: 中 / 影響: 大
- [ ] **AWS AgentCore 規制カテゴリ未確定リスク(NEW W3)**: AgentCore Payments が non-custodial protocol orchestrator か CASP か当局判断未確定。確度: 中 / 影響: 中
- [ ] **TFR agent binding 要求リスク(NEW W3)**: Travel Rule(Regulation (EU) 2023/1113)で agent ベースの originator info 添付に技術仕様確定が必要。確度: 中 / 影響: 中
- [ ] **加盟国 supervisor 差リスク(NEW W3)**: BaFin / AMF / AFM / CONSOB 等の AMLR 解釈差で KYA SDK の deployment コストが膨らむ。確度: 中 / 影響: 中

---

## 7. Phase 1 ゲート判断

Phase 0 終了時、以下を満たせば Phase 1 着手:

- [ ] 法人設立国 確定(初期 1 つ + EU 子会社の設立時期判断)
- [ ] ビジネスモデル 1-2 つに絞り込み(W2 暫定: SDK ライセンス + Hybrid OSS Bridge + 商用 規制 attestation packaging)
- [ ] 技術アーキテクチャ 基本方針 確定(W2 暫定: did:web + SD-JWT VC + SP1 + ML-DSA dual-sig + spruceid/ssi + 3 層 Bridge)
- [ ] 最初の3顧客候補 接点ありで特定
- [ ] Path A/B/C 選択確定(D の場合は記録のみして終了)
- [ ] 6-9 ヶ月の Phase 1 実行計画 ドラフト

### Phase 1 Sprint 1(4 ヶ月 PoC スコープ)— W2 暫定 + W3 拡張

#### 技術スコープ
- AgentCore → did:web → SD-JWT VC → ERC-8004 agentURI → x402 のチェーンが動く
- AWS-first、testnet、ZK 抜き、PQC は配線のみ
- OSS Bridge SDK を GitHub 公開(2026-12 re:Invent 前まで目標)
- **W3 追加**: HAIP / OpenID Federation / mdoc remote(ISO 18013-7)/ Cloudflare Web Bot Auth(IETF RFC 9421)互換
- **W3 追加**: AMLR module(Art. 22(1) + Art. 20(1)(c) + Art. 21 + Art. 79 positioning)

#### Stakeholder 参画タスク(W3 で重要度上昇)
- 標準化参加: W3C CCG / DIF / IETF SCITT で `did:erc8004` method 議論
- **W3 追加**: WE BUILD consortium engagement(non-paper メンバー連携)
- **W3 追加**: NIST AI Agent Standards Initiative(Q4 2026 v1 release 前にコメント提出)
- **W3 追加**: ARF GitHub Discussions 参加(EUDI Wallet)
- **W3 追加**: AMLA Article 28(1) RTS 業界 response 動向追跡

#### 法務スコープ(JP)
- SDK ライセンス契約テンプレート(「業務委託」認定回避文言)
- AMLR Art. 79 "no access/control" 明文化 spec(SDK 契約 + 技術 spec)
- JP Phase 1 弁護士確認 6 項目(§1 参照)

---

## 8. 変更履歴

| 日付 | 変更内容 |
|------|----------|
| 2026-05-08 | 初版作成(Phase 0 開始) |
| 2026-05-20 (W1) | AWS Bedrock AgentCore Payments(2026-05-07 GA preview)を受けて戦略再フレーム。§0 Executive Summary 暫定追加(Multi-cloud KYA Layer ポジション)、§3 にレイヤー構造図、§5 暫定ポジション = Path C(Hybrid)、§6 に AWS 後出しリスク・マルチクラウド非対称性リスク追加。根拠: `inbox/2026-05-20-aws-bedrock-agentcore-payments.md`、`tracks/A-competitors/aws-bedrock-agentcore-payments.md` |
| 2026-05-20 (W2) | W2 並列 3 subagent(Track A density / Track B EU AI Act / Track C ERC-8004 glue)の結果統合。**ポジション修正**: 「Multi-cloud KYA Layer」→「AWS x402 ecosystem 専用 KYA 実装 + 規制 attestation packaging specialist」。L3 が空でないこと(6 社 GA、$5B+)を認識、AWS x402 が唯一の戦略的余白であることを確定。§0 / §1(EU 域外スタート暫定方向)/ §2(SDK+Hybrid 暫定)/ §3(技術スタック did:web + SD-JWT VC + SP1 + ML-DSA dual-sig + spruceid/ssi、3 層 Bridge アーキテクチャ)/ §5(時間圧力 7 ヶ月 + 12-18 ヶ月の二段構成)/ §6(L3 過密、AI Act ギャップ閉鎖、AMLA RTS QTSP、施行延期再延期、ERC-8004 NFT 譲渡、AgentCore Workload Token 未公開の 6 リスク追加)/ §7(Phase 1 Sprint 1 4 ヶ月 PoC スコープ)を更新。根拠: `tracks/A-competitors/kya-layer-density-survey-2026-w2.md`、`tracks/B-regulations/eu-ai-act-agent-identity-mandate.md`、`tracks/C-tech-trends/domains/erc-8004-agentcore-glue.md`、`tracks/A-competitors/aws-kya-absorption-watch-list.md` |
| 2026-06-01 (W3) | W3 並列 4 regulation-mapper subagent(US AI Act / JP AI 推進法 / eIDAS 2.0 EUDI Wallet / AMLR 2027 CASP CDD)の結果統合。**強い収束**: 日本 = 最有力法人候補(規制負担最軽量 + PayPay 同居 + AI ガイドライン v1.2 準拠ツール市場)、US 法人は Tornado Cash 起訴リスクで Phase 0 段階除外、EU 子会社 2028-Q1 以降 France/Italy。**法的足場確定**: AMLR Art. 79(infrastructure provider 除外)+ Art. 22(1)(purporting to act CDD)で KYA Layer の "non-obliged entity" + "agent CDD 技術根拠" を条文レベルで獲得。**新発見**: EBW(COM 2025/838、2025-11-19 提案)Recital 28 で agentic AI 委任、WE BUILD non-paper(2026-03)が KYA 核ユースケースと完全一致。**新ポジション**: KYA SDK = NIST AI Agent IO Profile reference implementation(2026-02-17 launch、Q4 2026 v1)。**時間圧力 3 段化**: AWS 7ヶ月 + AMLA RTS lockdown 6-10ヶ月 + EU 規制重層 12-24ヶ月(W2 12-18→W3 12-24)。**技術スタック補強**: HAIP / OpenID Federation / mdoc remote(ISO 18013-7)/ Cloudflare Web Bot Auth(IETF RFC 9421)/ AMLR module を Phase 1 必須に追加。**リスク 16 件新規追加**: US 5件、JP 3件、EU eIDAS 4件、EU AMLR 4件、eIDAS QTSP 必須化リスクを W2「低」→ W3「中-高」上方修正。**Phase 1 弁護士確認 6 項目**(JP 視点)を §1 に追加。根拠: `tracks/B-regulations/us-ai-act-agent-identity-mandate.md`、`jp-ai-promotion-act-agent-identity.md`、`eidas-2-eudi-wallet-agent-delegation.md`、`amlr-2027-casp-agent-cdd.md`、`synthesis/weekly/2026-W2-phase0.md` |
