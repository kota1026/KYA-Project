---
topic: AMLR 2027 で CASP が agent 経由 transaction の CDD を満たす技術要件と KYA Layer の技術解
slug: amlr-2027-casp-agent-cdd
last_updated: 2026-06-01
jurisdictions: [EU]
related: [eu-ai-act-agent-identity-mandate, eidas-2-eudi-wallet-agent-delegation]
relevance_to_kya: very_high
status: draft
disclaimer: これは法律意見ではない。リサーチドキュメント。最終判断は弁護士確認必須。
---

# 論点: AMLR(Regulation (EU) 2024/1624)2027-07-10 施行で CASP が agent 経由 transaction の CDD を満たす技術要件 / KYA Layer の役割

## TL;DR(結論先出し)

| 設問 | 答え | 根拠 |
|------|------|------|
| AMLR は CASP に **agent 経由 transaction の独立 CDD** を要求するか? | **No(独立 CDD なし、人間 customer の CDD で吸収)** | Art. 22(1): 顧客 + "any person purporting to act on behalf of the customer" + beneficial owner を identify。**agent = "person purporting to act on behalf of"** に該当する解釈が有力(推定、確度: 中-高) |
| Agent autonomy(自律性)で人間 CDD が免除されるか? | **No** | Art. 21: CDD 不能なら取引拒否 + 関係終了。Art. 18(2): outsourcing しても obliged entity full liability。Taylor Wessing 2026-02 分析: "agent autonomy does not shift compliance to vendor" |
| KYA Layer は **AMLR obliged entity** になるか? | **No(構造的に回避可能)** | Art. 79: 自己ホスト wallet 製造者・SW 提供者は AMLR 適用除外。KYA = "infrastructure provider that does not have access to or control over crypto-assets" として位置取り可 |
| AWS AgentCore + Coinbase CDP + Privy は CASP として AMLR を負うか? | **Yes(Coinbase CDP / Privy = CASP)、AWS AgentCore = グレー** | Coinbase CDP / Privy は wallet custody → MiCA CASP → AMLR obliged entity 確定。AWS AgentCore Payments(x402 protocol operator)は custody なしならグレー(推定、確度: 中) |
| KYA Layer は **AMLR CDD を「動く SDK」にできる**か? | **Yes(条件付き)** | Art. 22(6)(b) eIDAS substantial/high + QES、Art. 18 outsourcing、Art. 25 third-party reliance、Art. 28 RTS の枠組み内に KYA Layer の VC + DID + audit trail が **技術的にマップ可能** |
| AMLA RTS が agent identity を **eIDAS QTSP 必須化** する確度は? | **W2「低」→ W3「中-高」へ上方修正** | AMLA Article 28(1) RTS Draft(2026-02-09 公表、2026-05-08 公開協議終了)が "attributes which electronic identification means must feature" を直接対象に。**自然人 KYC の verification source としては QTSP 必須化シナリオが現実的に**(推定、確度: 中-高) |

**1 行で**: AMLR 2027 は agent を **直接の規制対象としていない** が、CASP が顧客(人間)の CDD を遂行するための **唯一の合規的な手段** として KYA Layer の human↔agent binding attestation + delegation chain 証明が事実上の必須技術になる(推定、確度: 中-高)。**最大のリスクは AMLA RTS の eIDAS QTSP 強要シナリオで、これは W2 評価より上方修正が必要**。

---

## 1. 論点の定義

**問い**: AI Agent が CASP のサービス(Coinbase CDP wallet、Privy embedded wallet、Stripe Connect crypto rails 等)を介して transaction を実行する時、CASP は AMLR(Regulation (EU) 2024/1624)2027-07-10 施行下で **どの条文** に基づき、**どのような技術的手段** で CDD を満たすべきか。KYA Project がこの技術解を「動く SDK」として提供できるか。

**なぜ KYA に最重要か**:

- W2 EU AI Act 深掘り([eu-ai-act-agent-identity-mandate.md §2.3 サブ論点 6](/home/user/KYA-Project/tracks/B-regulations/eu-ai-act-agent-identity-mandate.md))で、**AMLR 2027 が AI Act より agent identity の事実上の必要性を強く生成する** と仮置きした
- decision-doc.md §0「規制 attestation packaging」は **AMLR を中核ユースケース** として想定
- AWS AgentCore Payments(2026-05-07 GA preview)= Coinbase CDP wallet + x402 = **EU 内 CASP として AMLR 直接適用** → KYA Bridge SDK の AMLR モジュールが売り物の核

**今回のスコープ**: EU 単独深掘り。**AMLR(2024/1624)が主。AMLA(2024/1620)、Travel Rule(2023/1113)、MiCA(2023/1114)、eIDAS 2.0(2024/1183)との接合点を 1 章ずつ整理**。日本犯収法・FATF Recommendation 16 は §5 で cross-border 観点のみ。

---

## 2. EU AMLR の構造マッピング(2026-06-01 時点)

### 2.1 適用法体系と 2027-07-10 タイムライン

| 規制 | 略称 | 公布 / 発効 / 適用 | KYA 影響度 |
|------|------|----------------------|-----------|
| Regulation (EU) 2024/1624 | **AMLR**(AML Regulation) | 公布 2024-06-19、発効 2024-07-09、**全面適用 2027-07-10** | **極大** |
| Regulation (EU) 2024/1620 | **AMLA Regulation** | 発効 2024-06-26、適用 2025-07-01、直接監督開始 2028-01-01 | 大(RTS / Guidelines 発行体) |
| Directive (EU) 2024/1640 | **AMLD6** | transposition 2027-07-10 まで | 中(国内法移行) |
| Regulation (EU) 2023/1113 | **TFR / Travel Rule**(EU Funds Transfer Regulation 改正) | 適用 **2024-12-30**(既に施行済) | 大(現行運用中) |
| Regulation (EU) 2023/1114 | **MiCA** | CASP 規定 2024-12-30 適用、移行期 2026-07-01 まで | 大(CASP 定義の前提) |
| Regulation (EU) 2024/1183 | **eIDAS 2.0** | 発効 2024-05-20、EUDI Wallet 2026-12 までに全加盟国提供、SCA for financial 2027-12 まで | **極大**(Art. 22 経由で AMLR と直結) |

出典: [EUR-Lex AMLR 2024/1624](https://eur-lex.europa.eu/eli/reg/2024/1624/oj/eng)、[EUR-Lex AMLA 2024/1620](https://eur-lex.europa.eu/eli/reg/2024/1620/oj/eng)、[EUR-Lex TFR 2023/1113](https://eur-lex.europa.eu/eli/reg/2023/1113/oj/eng)、[EUR-Lex MiCA 2023/1114](https://eur-lex.europa.eu/eli/reg/2023/1114/oj/eng)、アクセス 2026-06-01

### 2.2 AMLR / AMLA タイムライン詳細(KYA 監視対象)

| 日付 | イベント | KYA 対応 |
|------|----------|----------|
| 2024-07-09 | AMLR / AMLA 発効 | 監視開始 |
| 2024-12-30 | **TFR 2023/1113 施行**(CASP の Travel Rule 義務開始) | 既存技術ベンダー(Notabene、Sumsub、Chainalysis)動向把握 |
| 2025-07-01 | AMLA 業務開始(Frankfurt) | RTS Draft 公表追跡開始 |
| 2025-07-31 | EBA Travel Rule Guidelines(EBA/GL/2024/11)transitional 期限 | 業界実装事例の収集完了 |
| **2026-02-09** | **AMLA Article 28(1) AMLR RTS Draft 公表**(CDD RTS) | **★ KYA W3 アクション**: response 分析、業界団体ロビー検討 |
| 2026-03-24 | AMLA Article 28(1) RTS 公開ヒアリング(オンライン) | 議事録回顧 |
| **2026-05-08** | **AMLA Article 28(1) RTS 公開協議終了** | **★ KYA W3-W4 アクション**: 主要 response 公表追跡(Hogan Lovells、ESBG、Invest Europe 等) |
| 2026-07-10 | AMLA RTS 提出期限(Art. 28(1) RTS を Commission に提出) | 確定版での再評価 |
| 2027-07-10 | **AMLR 全面適用 / AMLD6 transposition 期限** | **KYA SDK 商用化 / OSS Bridge 完成済前提** |
| 2028-01-01 | AMLA 直接監督開始(40 個の高リスク obliged entities) | 監督対象 CASP 監視 |

出典: [AMLA Consultation on Draft RTS on Customer Due Diligence](https://www.amla.europa.eu/policy/public-consultations/consultation-draft-rts-customer-due-diligence_en)、[Hogan Lovells: AMLA consults on draft RTS on CDD and harmonized supervision](https://www.hoganlovells.com/en/publications/amla-consults-on-draft-rts-on-customer-due-diligence-and-harmonized-supervision)、[A&L Goodbody: AMLA consults on draft RTS' on CDD measures](https://www.algoodbody.com/insights-publications/amla-consults-on-draft-rts-on-cdd-measures-and-triggers-and-confirms-its-priorities-for-2026-to-2028)、アクセス 2026-06-01

→ **タイミング**: AMLA Article 28(1) RTS の協議は **既に終了済(2026-05-08)**。W3-W4 で response 分析を急ぐ必要あり。これが eIDAS QTSP 強要 risk の評価決定材料。

### 2.3 主要条文の verbatim 引用と構造

#### 2.3.1 Article 19 — CDD 適用トリガー(CASP 特例 €1,000)

**条文(verbatim、WebSearch 経由 snippet)**:

> "Obliged entities shall apply at least customer due diligence measures referred to in Article 20(1), point (a), when carrying out an occasional transaction in cash amounting to a value of at least EUR 3 000, or the equivalent in national currency, whether the transaction is carried out in a single operation or through linked transactions."

> "For crypto-asset service providers (CASPs), CDD measures apply when carrying out an occasional transaction of a value of at least EUR 1,000, while they must at least identify the customer and verify its identity when carrying out an occasional transaction where the value is below EUR 1,000."

出典: [Article 19 Application of Customer Due Diligence Measures - AMLR](https://amlr.eu/article-19-application-of-customer-due-diligence-measures/)(WebFetch 403)、[Freshfields: The European AML package – what's in it for the crypto industry?](https://www.freshfields.com/en/our-thinking/blogs/risk-and-compliance/the-european-aml-package-whats-in-it-for-the-crypto-industry-102j9mn)、[Anti-Money-Laundering.eu: Business Relationships, Occasional and Linked Transactions under Art. 19(9)](https://anti-money-laundering.eu/business-relationships-occasional-transactions-and-linked-transactions-under-art-199-amlr/)、アクセス 2026-06-01

**閾値マトリクス(2026-06 確定情報)**:

| 義務主体 | 取引種別 | 閾値 | 義務 |
|---------|---------|------|------|
| 一般 obliged entity | 通常取引 | €10,000 以上(linked transactions 含む) | Art. 20(1) フル CDD |
| 一般 obliged entity | 現金取引 | €3,000 以上 | Art. 20(1)(a) のみ(identification) |
| **CASP** | **occasional transaction** | **€1,000 以上** | **Art. 20(1) フル CDD** |
| **CASP** | **occasional transaction** | **€1,000 未満** | **identification + verification(Art. 20(1)(a)のみ、ただし obligatorily 必須)** |
| 一般 obliged entity | business relationship | 閾値なし(全件) | Art. 20(1) フル CDD |

→ **CASP は €1,000 未満でも identification 必須** = "all-transaction KYC"。AWS x402 で agent が $0.01 マイクロ決済を 100 回行う場合でも、agent の背後の人間 customer の identification は必須。

#### 2.3.2 Article 20 — CDD 措置の中身

**条文(verbatim、WebSearch 経由 snippet)**:

> "For the purpose of conducting customer due diligence, obliged entities shall apply all of the following measures:
> (a) identifying the customer and verifying the customer's identity;
> (b) identifying the beneficial owners and taking reasonable measures to verify their identity so that the obliged entity is satisfied that it knows who the beneficial owner is and that it understands the ownership and control structure of the customer;
> (c) assessing and, as appropriate, obtaining information on and understanding the purpose and intended nature of the business relationship or the occasional transactions;
> (d) verifying whether the customer or the beneficial owners are subject to targeted financial sanctions, and, in the case of a customer or party to a legal arrangement who is a legal entity, whether natural or legal persons subject to targeted financial sanctions control the legal entity or have more than 50 % of the proprietary rights of that legal entity or majority interest in it;
> (e) conducting ongoing monitoring of the business relationship..."

出典: [Article 20 Customer Due Diligence Measures - AMLR](https://amlr.eu/article-20-customer-due-diligence-measures/)、[Anti-Money-Laundering.eu: New CDD Data Points under AMLR](https://anti-money-laundering.eu/new-customer-due-diligence-cdd-data-points-under-amlr/)、アクセス 2026-06-01

**agent 経由 transaction への当てはめ**:

- **(a) customer identification**: customer = **agent を稼働させる人間ユーザー / 法人**(W2 結論と整合)
- **(b) beneficial owner**: 法人顧客の場合は UBO(25% 閾値、Art. 52 で 15% への引下げ余地)
- **(c) purpose / intended nature**: agent が実行する取引パターン(取引種別、上限、期間)を customer 自身が事前申告 → **これが KYA delegation mandate と完全対応**
- **(d) sanctions screening**: agent 経由でも対象は customer / UBO(agent 自身は対象外)
- **(e) ongoing monitoring**: agent 経由 transaction も継続監視対象 → **KYA audit trail が監視データソースになる**

→ AMLR は agent を独立 CDD 対象としていない。**しかし agent transaction を customer の活動として帰属させる技術** が必要 = KYA の役割。

#### 2.3.3 Article 21 — CDD 不能時の取引拒否

**条文(verbatim、WebSearch 経由 snippet)**:

> "Where an obliged entity is unable to comply with the requirement to apply customer due diligence measures laid down in Article 20(1), it shall refrain from carrying out a transaction or establishing a business relationship, and shall terminate the business relationship and consider reporting a suspicious transaction to the FIU in relation to the customer in accordance with Article 69."

出典: [Article 21 Inability to Comply - AMLR](https://amlr.eu/article-21-inability-to-comply-with-the-requirement-to-apply-customer-due-diligence-measures/)、[Morlings: AMLR Article 21](https://morlings.se/en/blog/amlr-art-21-inability-meet-requirements-customer-due-diligence/)、アクセス 2026-06-01

→ **agent transaction で customer の正確な identification ができない場合、CASP は取引拒否 + 顧客関係終了 + SAR 検討を義務付けられる**。これは **「agent が誰の delegation で動いているか証明できない CASP は agent 関連取引を全拒否せざるを得ない」** ことを意味する。KYA Layer の delegation chain proof がない世界では、CASP が agent 経由 transaction を一律拒否する未来が現実的に発生する(推定、確度: 中-高)。

#### 2.3.4 Article 22 — Identification & verification(★ 最重要)

**条文(verbatim、複数 source の合成スニペット)**:

> "Article 22(1): With the exception of cases of lower risk to which measures under Section 3 apply and irrespective of the application of additional measures in cases of higher risk under Section 4, obliged entities shall obtain at least the following information in order to identify the customer, **any person purporting to act on behalf of the customer**, and the natural persons on whose behalf or for the benefit of whom a transaction or activity is being conducted..."

> "Article 22(6)(b): For the purposes of verification of the customer's and the beneficial owner's identity referred to in paragraphs 1 and 4 of this Article, obliged entities may use **electronic identification means** which meet the requirements of Regulation (EU) No 910/2014 [eIDAS] **with regard to the assurance levels 'substantial' or 'high', as well as relevant qualified trust services as set out in that Regulation**."

> "Article 22(7): AMLA shall develop draft regulatory technical standards to specify reliable and independent sources of information for verifying the identification data of natural and legal persons..."

出典: [Article 22 Identification and Verification - AMLR](https://amlr.eu/article-22-identification-and-verification-of-the-identity-of-customers-and-beneficial-owners/)、[WebID: eIDAS 2.0 in the Context of EU-AMLR](https://webid-solutions.com/en/resources/blog/eidas-regulation-2-0-eu-amlr-context/)、[IDnow: Future of AML identification - Are you ready for 2027?](https://idnow.io/future-of-amlr-identification-2027/)、[Signicat: EU AMLR 2027 Requirements](https://www.signicat.com/blog/amlr-explained-what-changes-in-2027)、[Veridas: AMLR 2027 Get Ready](https://veridas.com/en/amlr-2027-compliance/)、[Namirial: From AMLR to eIDAS 2.0 - Compliance in KYC and Onboarding](https://www.namirial.com/en/blog/inspiration/amlr-eidas-2-financial-services/)、アクセス 2026-06-01

**Agent への当てはめ — 最重要パラグラフ Art. 22(1) "any person purporting to act on behalf of the customer"**:

- "person purporting to act on behalf of the customer" は **代理人 / 代表者 / 委任を受けた者** を指す既存解釈(AMLD5 から継承)
- **AI Agent はこの文言の "person" に該当するか?** → **法的には No(person = 自然人 / 法人 = legal person)**。ただし agent **背後の人間 / 法人**(delegation の delegating party)が "purporting to act" 主体として識別される必要
- → **CASP は agent transaction で agent 自体を identify するのではなく、agent の背後の delegation 元 = 自然人 / 法人 customer を identify する義務**
- → **KYA Layer の "human↔agent binding attestation" が CASP の Article 22(1) 充足の技術的根拠** になる(decision-doc.md §3 の 3 層 Bridge と完全に対応)

**Art. 22(6)(b) eIDAS リンク — ★ W2 から最重要アップデート**:

- AMLR は明示的に **eIDAS substantial/high の electronic identification means** と **qualified trust services(QES 等)** を verification の手段として規定
- これは **任意の(may)** 規定であり、紙の ID + 対面確認も引き続き可能。**しかし AMLA RTS(Art. 22(7))が "reliable and independent sources" として eIDAS のみを authoritative source 化する可能性が高い**
- → **W2 で "eIDAS QTSP 必須化リスク = 確度: 低" としたが、W3 では "確度: 中-高" に上方修正が必要**

#### 2.3.5 Article 79 — 自己ホスト wallet / SW 提供者の **明示的除外** (★ KYA に決定的に有利)

**条文(verbatim、WebSearch 経由 snippet)**:

> "Article 79: This Regulation does not apply to users, nor to manufacturers of hardware or software wallets or providers of self-hosted wallets, **insofar as they do not possess access to or control over these crypto-asset wallets**."

出典: [Article 79 Anonymous Accounts and Bearer Shares - AMLR](https://amlr.eu/article-79-anonymous-accounts-and-bearer-shares-and-bearer-share-warrants/)、[Patrick Hansen (Circle) Twitter post 2024-03-26](https://x.com/paddi_hansen/status/1771929865257689257)、[Yannakas: Self-Hosted Wallets Under EU Law (2026-01)](https://blog.yannakas.me/2026/01/self-hosted-wallets-eu-law/)、[BeInCrypto: Circle's Patrick Hansen Clarifies EU AMLR 2027 Rules](https://beincrypto.com/eu-amlr-crypto-self-custody-exemptions-2027/)、アクセス 2026-06-01

**KYA Project への含意**:

- KYA Layer が **agent identity attestation infrastructure として "control over crypto-assets" を一切持たない設計** にすれば、Article 79 の明示的除外が KYA に適用される
- これは decision-doc.md §0 / §3 の **ノンカストディ前提と完全整合**
- → **「KYA Layer は AMLR obliged entity ではない、infrastructure provider である」** という法的立場が **AMLR 自体に明示根拠** がある(これは W2 EU AI Act 分析の "AI Act 構造的ギャップ" と並ぶ最強の構造的有利)

#### 2.3.6 Article 18 — 外部委託(Outsourcing)

**条文(verbatim、WebSearch 経由 snippet)**:

> "Article 18(1): Obliged entities may outsource tasks resulting from this Regulation to service providers. The obliged entity shall notify the supervisor of the outsourcing before the service provider starts to carry out the outsourced task."

> "Article 18(2): When performing tasks under this Article, service providers shall be regarded as part of the obliged entity, including for purposes of carrying out customer due diligence on behalf of the obliged entity. **The obliged entity shall remain fully liable for any action, whether an act of commission or omission, connected to the outsourced tasks** that are carried out by service providers."

出典: [Article 18 Outsourcing - AMLR](https://amlr.eu/article-18-outsourcing/)、[Anti-Money-Laundering.eu: New Outsourcing Requirements under Art. 18 AMLR](https://anti-money-laundering.eu/new-outsourcing-requirements-under-art-18-amlr/)、[Morlings: AMLR Art. 18](https://morlings.se/en/blog/amlr-art-18-outsourcing/)、アクセス 2026-06-01

**KYA Layer の位置取り**:

- KYA Layer は CASP の **outsourced service provider として Art. 18 経由で組み込み可能**
- 顧客 CASP は KYA Bridge SDK の CDD 機能を outsource → supervisor へ届出 → KYA SDK は "service provider" として扱われる
- **liability**: CASP が full liability を保持(Art. 18(2))。KYA Layer は liability を負わない設計が可能 = **ノンカストディ前提と整合**

#### 2.3.7 Article 25 — 第三者リライアンス(Third-party reliance)

**条文(verbatim、WebSearch 経由 snippet)**:

> "Article 25(1): Obliged entities may rely on other obliged entities, whether located in a Member State or in a third country, to fulfil the customer due diligence requirements laid down in Article 20(1), points (a), (b) and (c), provided that:
> (a) the obliged entities relied upon apply customer due diligence and record-keeping requirements laid down in this Regulation or equivalent in the case of third countries, and their compliance with anti-money laundering and counter-terrorism financing requirements is supervised in a manner consistent with Section 2 of Chapter IV of Directive (EU) 2024/1640..."

> "Article 25(2): **The ultimate responsibility for meeting customer due diligence requirements shall remain with the obliged entity that relies on another obliged entity.**"

出典: [Article 25 - AMLR](https://amlr.eu/) (一覧)、[Hogan Lovells: AMLA in the Payments Space](https://www.hoganlovells.com/en/publications/amla-in-the-payments-space)、[Anti-Money-Laundering.eu: Reliance on Third Parties](https://anti-money-laundering.eu/)、アクセス 2026-06-01

**Outsourcing(Art. 18)vs Reliance(Art. 25)の違い**(KYA SDK の法的位置取りに決定的):

| 区分 | Art. 18 Outsourcing | Art. 25 Reliance |
|------|---------------------|------------------|
| 委託先の地位 | obliged entity の **一部** として扱われる | 独立した **別 obliged entity** に依拠する |
| 委託先の AML/CFT 規制下適格性 | **不要**(SDK / SaaS ベンダーで可) | **必要**(委託先自体が EU/equivalent 第三国の obliged entity) |
| 監督届出 | 必要(事前) | 不要(契約のみ) |
| 委託先の責任 | 一部負う可能性 | ほぼなし |
| 委託元 obliged entity の liability | 全部保持 | 全部保持 |

→ **KYA Layer は Art. 18 outsourcing が最適**(KYA 自体は obliged entity になる必要なし)。**Art. 25 reliance は KYA が "obliged entity" 化する場合のみ意味があり、それは KYA 戦略上回避すべき**(decision-doc.md §0「KYA = infrastructure」と整合)

#### 2.3.8 Article 28 — RTS on CDD information(★ 2026 公開協議終了済)

**条文(verbatim、WebSearch 経由 snippet)**:

> "Article 28(1): AMLA shall develop draft regulatory technical standards and submit them to the Commission for adoption. Those draft regulatory technical standards shall specify:
> (a) the requirements and information to be collected for the purposes of standard, simplified and enhanced customer due diligence pursuant to Articles 20, 22, 25, 33 and 34, including the minimum information to be obtained for the identification of the customer's beneficial owner;
> (b) **the type of simplified due diligence measures that obliged entities may apply in the case of lower-risk situations**;
> (c) the risk factors that supervisors should take into account when determining the extent to which certain electronic money instruments may be exempted from certain customer due diligence measures;
> (d) **reliable and independent sources of information for verifying the identification data of natural and legal persons**, as referred to in Article 22(6) and (7)..."

出典: [Article 28 RTS on CDD Information - AMLR](https://amlr.eu/article-28-regulatory-technical-standards-on-the-information-necessary-for-the-performance-of-customer-due-diligence/)、[AMLA Consultation on Draft RTS on CDD](https://www.amla.europa.eu/policy/public-consultations/consultation-draft-rts-customer-due-diligence_en)、[AMLA Consultation Paper Draft RTS under Article 28(1) (PDF, 2026-02-09)](https://www.amla.europa.eu/document/download/3d430294-5171-455c-b565-a86fc5f3cb1c_en?filename=Consultation+Paper+Draft+RTS+under+Article+28%281%29.pdf)、[Hogan Lovells: AMLA consults on draft RTS](https://www.hoganlovells.com/en/publications/amla-consults-on-draft-rts-on-customer-due-diligence-and-harmonized-supervision)、[Herbert Smith Freehills Kramer: 2026 AML/CFT Consultations - Unpacking AMLA's New Draft RTS](https://www.hsfkramer.com/notes/fsrandcorpcrime/2026-posts/2026-aml-cft-consultations)、[A&L Goodbody: AMLA consults on draft RTS on CDD measures](https://www.algoodbody.com/insights-publications/amla-consults-on-draft-rts-on-cdd-measures-and-triggers-and-confirms-its-priorities-for-2026-to-2028)、[Lexology: AMLA consults on draft RTS on customer due diligence](https://www.lexology.com/library/detail.aspx?g=7f0fe44b-5afe-4a57-af56-08fa2f460875)、[Loyens & Loeff: AMLR ahead - AMLA holds first public hearings](https://www.loyensloeff.com/insights/news--events/news/amlr-is-approaching-amla-holds-first-public-hearings-on-draft-rts--for-business-relationships-and-cdd--time-for-obliged-entities-to-prepare/)、[CSSF: Consultation by AMLA on the draft RTS on CDD](https://www.cssf.lu/en/Document/consultation-by-amla-on-the-darft-rts-on-customer-due-diligence/)、[Blockchain Working Group: AMLA publication of CDD RTS consultation paper](https://www.blockchainwg.eu/amla-publication-of-its-consultation-paper-on-its-draft-rts-on-customer-due-diligence-under-amlr-9-february-2026/)、[Invest Europe: Response to AMLA Public Consultation on Draft RTS on CDD](https://www.investeurope.eu/publications-policy/publications/2026/response-to-amla-public-consultation-on-the-draft-rts-on-customer-due-diligence-under-article-28-1-amlr/)、[AMF: AMF invites financial market participants to AMLA consultations](https://www.amf-france.org/en/news-publications/news/amf-invites-financial-market-participants-amlas-consultations-three-draft-amlcft-implementing)、アクセス 2026-06-01

**Draft RTS の重要な内容(AMLA 公表分の要約)**:

- "Attributes which electronic identification means must feature to fulfill the requirements of the AMLR in the case of standard, simplified, and enhanced due diligence"(=eIDAS substantial/high の具体的 attributes を RTS で規定)
- "Risk factors that supervisors must consider when determining the extent to which certain electronic money instruments may be exempted"
- "Reliable and independent sources of information that obliged entities may use to verify the identity of natural or legal persons for the purposes of Article 22(6) and (7) AMLR"

**スケジュール(2026-06-01 時点)**:

- 2026-02-09 Draft RTS 公表
- 2026-03-24 公開ヒアリング(オンライン)
- 2026-05-08 公開協議終了 — **★ KYA W3 で response 公表分析必須**
- 2026-07-10 AMLA → Commission RTS 提出期限
- 2026-Q4 Commission による delegated act 採択(推定)
- 2027-07-10 全面適用

→ **KYA Project の重要アクション**: ESBG、Invest Europe、Blockchain Working Group、業界団体の response analyses を 2026-06 中に追跡完了。CASP / agent identity 関連で **「reliable and independent sources」の定義が QTSP のみに絞られたか否か** が最重要監視ポイント。

#### 2.3.9 Article 37 — CASP cross-border correspondent 関係の Enhanced CDD

**注**: §1 で当初 "Article 38(CASP 特例条項)" と想定したが、AMLR 内に CASP 専用の Art. 38 は存在せず、**CASP 特化条文は Article 37(cross-border correspondent crypto-asset relationships)が主軸**。Article 38 は third-country respondent institutions 一般。

**Article 37 の要点**:

- CASP-to-CASP の cross-border correspondent 関係に Enhanced Due Diligence(EDD)を義務化
- 相手 CASP の AML/CFT controls 評価、senior management 承認、責任の明確化
- 相手 CASP の AML / CFT regime が EU と equivalent でない場合は追加措置

出典: [Article 37 AMLR: Enhanced Customer Due Diligence in Crypto (Morlings)](https://morlings.se/en/blog/amlr-art-37-enhanced-cdd-requirements-crypto-sector/)、[Jones Day: Crypto Assets, CASPs, and AML/CFT Compliance under MiCA and AMLR](https://www.jonesday.com/en/insights/2025/07/crypto-assets-casps-and-amlcft-compliance-the-new-european-regulatory-landscape-under-mica-and-amlr)、アクセス 2026-06-01

**Agent commerce への含意**: AWS AgentCore × Coinbase CDP(US CASP)→ EU 顧客の agent transaction = cross-border correspondent 関係に近い構造 → **EU 内 CASP が US CASP との correspondent 関係に Art. 37 EDD を発動する可能性。KYA Layer は EDD のための agent provenance データを提供できる**(推定、確度: 中)。

### 2.4 Travel Rule(Regulation (EU) 2023/1113)— 既施行の現実

#### 2.4.1 概要

**適用日**: 2024-12-30 既施行(transitional 期間 2025-07-31 まで)
**根拠**: Regulation (EU) 2023/1113(2015/847 改正)
**実装ガイダンス**: EBA/GL/2024/11(2024-07-04 final)

**主要義務**:

- **全ての CASP-to-CASP crypto-asset transfer に originator / beneficiary 情報を添付**(閾値なし、つまり €1 でも対象)
- **EUR 1,000 以上 self-hosted wallet との transfer は ownership / control の追加検証**(技術的な wallet 所有証明 / Satoshi test 等)
- Originator information: 氏名、wallet/account number、住所 or ID 番号 or 生年月日 + 出生地
- Beneficiary information: 氏名、wallet/account number

出典: [Regulation (EU) 2023/1113 - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2023/1113/oj/eng)、[EBA Travel Rule Guidelines EBA/GL/2024/11 (PDF)](https://www.eba.europa.eu/sites/default/files/2024-07/6de6e9b9-0ed9-49cd-985d-c0834b5b4356/Travel%20Rule%20Guidelines.pdf)、[EBA Press Release on Travel Rule Guidance](https://www.eba.europa.eu/publications-and-media/press-releases/eba-issues-travel-rule-guidance-tackle-money-laundering-and-terrorist-financing-transfers-funds-and)、[VASPnet: How EU's Travel Rule goes above and beyond FATF](https://vaspnet.com/articles/how-the-eus-travel-rule-goes-above-and-beyond-fatf-requirements)、[Apog Poland: EU Regulation 2023/1113 & Crypto Asset Transfers](https://apogpoland.com/blog/eu-regulation-2023-1113-crypto-transfers)、[Notabene EU Travel Rule Compliance Guide (PDF)](https://7222759.fs1.hubspotusercontent-na1.net/hubfs/7222759/Reports/Travel%20Rule%20Compliance%20Guide%20The%20European%20Union%20%7C%20Notabene.pdf)、[21 Analytics: EU Travel Rule TFR | AML Requirements 2026](https://www.21analytics.co/travel-rule-regulations/european-union-eu-travel-rule-regulation/)、アクセス 2026-06-01

#### 2.4.2 Agent commerce への当てはめ

**シナリオ A: Agent が CASP 経由で API/MCP server に x402 マイクロ決済**

- 送金元 CASP = Coinbase CDP(US) or Privy(US/EU)
- 受取側 = API server の wallet(self-hosted)
- **Travel Rule の閾値**: €1 から適用 → 全 transaction で originator 情報必須
- **送金元 CASP の義務**: customer(agent 背後の人間 / 法人)の氏名・wallet・住所/ID を beneficiary 側に添付
- → **KYA Layer の agent ↔ human delegation attestation を originator information に lossless にマップする技術** が需要

**シナリオ B: Agent が self-hosted wallet と transact(EUR 1,000 以上)**

- TFR は self-hosted wallet との transfer で ownership/control の追加検証義務(EBA Guidelines § 4.5)
- → **KYA Bridge SDK の "agent address ↔ human delegation" attestation が self-hosted ownership proof として認められるか** が論点。現状の EBA Guidelines は Satoshi test / blockchain signature を想定 → KYA VC ベース attestation が認められるかは **AMLA 追加 Guidelines 待ち**(推定)

**業界実装の現状**(2026-06-01):

- **Notabene** + Chainalysis 提携: Travel Rule オートメーション + wallet ホスティング判定
- **TRM Labs** + Eventus + Notabene "Project TEN": 統合 compliance suite
- **Sumsub, Chainalysis KYT**: pre-settlement authorization の自動化

→ **KYA Layer は Travel Rule そのものは Notabene 等に任せ、agent ↔ human delegation の上位レイヤーに特化** が現実的(decision-doc.md §3 の L3 ポジションと整合)

出典: [Chainalysis Notabene Partnership](https://www.chainalysis.com/blog/chainalysis-notabene-travel-rule-integration/)、[Eventus + TRM Labs + Notabene Project TEN](https://www.eventus.com/cat-press-and-news/trm-labs-eventus-notabene-form-partnership-to-deliver-one-stop-compliance-solution-for-digital-asset-ecosystem/)、アクセス 2026-06-01

### 2.5 MiCA(Regulation (EU) 2023/1114)— CASP 定義の前提

#### 2.5.1 CASP / Custody の定義

**Article 3(15) MiCA**: "Custody and administration of crypto-assets on behalf of clients" =
> "safekeeping or controlling, on behalf of clients, of crypto-assets or of the means of access to such crypto-assets, where applicable in the form of private cryptographic keys."

出典: [Regulation (EU) 2023/1114 (MiCA) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2023/1114/oj/eng)、[Lexology: Custody under MiCA - Who's Really in Control?](https://www.lexology.com/library/detail.aspx?g=65ec0c23-248c-456c-a364-1942a5a85c21)、[Lexology: MiCA and CASPs - Authorisation, Governance and Liability](https://www.lexology.com/library/detail.aspx?g=3ea83e34-3b46-43a2-9ec8-55810c59a810)、[Dechert: Application of Second Part of MiCA - Regulation of CASPs](https://www.dechert.com/knowledge/onpoint/2025/1/application-of-second-part-of-mica---regulation-of-casps-and-oth.html)、[ESMA MiCA page](https://www.esma.europa.eu/esmas-activities/digital-finance-and-innovation/markets-crypto-assets-regulation-mica)、[KPMG Cyprus: MiCA August 2025 Overview](https://assets.kpmg.com/content/dam/kpmg/cy/pdf/2025/markets-in-crypto-assets-regulation-mica.pdf)、[Squire Patton Boggs: How To Comply With EU's Crypto-asset Rules](https://www.squirepattonboggs.com/media/yvspymyt/mica-legal-framework-how-to-comply-with-the-eus-crypto-asset-rules.pdf)、アクセス 2026-06-01

**重要な解釈**: "Custody under MiCA is not just about who holds the private keys. The definition covers both the **safekeeping and control** over crypto-assets. Custody is defined by **control, safeguarding, and liability**, not technology alone."(Lexology)

#### 2.5.2 主要 wallet provider の CASP 該当性判定

| Provider | サービス内容 | Custody 判定 | CASP 該当性 |
|----------|--------------|-------------|-------------|
| **Coinbase CDP**(Wallet-as-a-Service) | private key の MPC 管理、ユーザー署名は Coinbase インフラ経由 | **Custody 該当**(control over means of access) | **CASP 該当(MiCA 認可必須)** |
| **Privy embedded wallet** | private key は ユーザー端末の secure enclave、Privy は recovery share のみ保持 | **グレー**(技術的には ユーザー control、recovery を持つ) | **論争中**。Privy 主張 = non-custodial。一部規制者見解 = control 保持で CASP 該当(推定、確度: 中) |
| **Stripe Connect crypto rails** | カストディアル wallet + on/off-ramp | **Custody 該当** | **CASP 該当** |
| **MetaMask / Ledger / Trezor** | private key は 100% ユーザー端末、SW 提供者は無関与 | Non-custodial 確定 | **CASP 該当せず(Art. 79 明示除外)** |
| **AWS AgentCore Payments** | x402 protocol orchestration、wallet は外部(Coinbase CDP / Privy 等)、AWS は private key 触らず | **グレー → 非該当寄り**(推定) | **CASP 非該当寄り、ただし agent identity orchestrator として別カテゴリで規制される可能性**(推定、確度: 中) |
| **KYA Layer**(本プロジェクト) | identity attestation のみ、crypto-asset の access / control を一切持たない | **Non-custodial 確定** | **CASP 非該当 + Art. 79 明示除外適用** |

→ **AWS x402 ecosystem の CASP 判定**: Coinbase CDP / Privy / Stripe Connect は全て CASP として AMLR 直接適用。AWS AgentCore そのものは CASP 非該当寄り。**KYA Layer は CASP の outsourcing service provider(Art. 18)または infrastructure provider(Art. 79)として位置取り**。

#### 2.5.3 MiCA × AMLR の重複・調整

**Jones Day 分析(2025-07)**:

> "Under MiCA (Title V), CASPs face authorization, prudential, conduct of business, and governance requirements. Under AMLR (Chapter II), the same CASPs face AML/CFT requirements as obliged entities. The two frameworks **complement, not overlap**: MiCA = prudential and conduct, AMLR = AML/CFT."

出典: [Jones Day: Crypto Assets, CASPs, and AML/CFT Compliance - The New European Regulatory Landscape Under MiCA and AMLR](https://www.jonesday.com/en/insights/2025/07/crypto-assets-casps-and-amlcft-compliance-the-new-european-regulatory-landscape-under-mica-and-amlr)、[Lexology Jones Day Mirror](https://www.lexology.com/library/detail.aspx?g=512161d0-0489-4c52-8645-573bae381d2e)、[Norton Rose Fulbright: The new EU AML/CFT regime has arrived](https://www.nortonrosefulbright.com/en/knowledge/publications/644c5392/the-new-eu-amlcft-regime-has-arrived-are-you-ready)、[CSSF: The new AML/CFT Regulation, AMLD6 and future AMLA supervisor](https://www.cssf.lu/en/2024/06/the-new-aml-cft-regulation-the-sixth-aml-cft-directive-and-the-future-eu-aml-cft-supervisor/)、アクセス 2026-06-01

→ MiCA 認可済 CASP は AMLR 義務を **追加で** 負う。KYA SDK は MiCA(prudential)ではなく AMLR(AML/CFT)に sweet spot を持つ。

### 2.6 eIDAS 2.0 × AMLR の接合点(★ AMLA RTS QTSP risk の核)

**W2 EU AI Act 分析(eu-ai-act-agent-identity-mandate.md §2.3 サブ論点 8)**で eIDAS 2.0 の delegation 未定義を確認済。**W3 AMLR 分析で追加発見**:

- **AMLR Art. 22(6)(b)** = eIDAS 2.0 の electronic identification means(substantial/high)+ QES を AMLR CDD の verification 手段として **明示参照**
- これは AI Act より直接的 = **eIDAS 2.0 = AMLR Art. 22 の技術的前提**
- AMLA Art. 28(1) RTS Draft が **"reliable and independent sources" を eIDAS QTSP に絞る** 解釈を採れば、**非 QTSP の identity attestation は AMLR CDD の合規手段として認められなくなる**
- → **これが W2 で「確度: 低」とした QTSP 必須化リスクを「確度: 中-高」に上方修正する根拠**

**KYA Layer の戦略的対応**:

1. **短期(2026-Q3)**: AMLA Article 28(1) RTS Draft への response 分析。**業界 response が QTSP-only 解釈に反対しているか**を確認
2. **中期(2026-Q4 - 2027-Q2)**: KYA Bridge SDK を **QTSP 取得不要の "supplementary attestation" として位置取り**(QES の補完であり代替ではない、と明確化)
3. **長期(2027-2028)**: 必要なら EU 子会社 + QTSP 取得を検討。これは decision-doc.md §1「EU 法人設立慎重要検討」と整合

出典: 上記 §2.3.4 + §2.3.8 + [WebID: eIDAS 2.0 in the Context of EU-AMLR](https://webid-solutions.com/en/resources/blog/eidas-regulation-2-0-eu-amlr-context/)、[IDnow: Future of AML identification](https://idnow.io/future-of-amlr-identification-2027/)、[Signaturit: AMLR & AMLD6 - New EU AML Rules for Digital Identity](https://www.signaturit.com/blog/amlr-amld6-new-aml-rules/)

---

## 3. Agent Commerce への CDD 当てはめ(設問 1 への直接回答)

### 3.1 設問 1: AMLR 2027 で CASP は agent 経由 transaction の CDD をどう満たすべきか(条文ベース)

**結論**: CASP は agent transaction を **agent 背後の人間 / 法人 customer の活動として帰属させて CDD を実施**。agent 自体への独立 CDD は不要だが、**agent ↔ human binding を技術的に証明する手段** が必要。

**条文ベースの具体的手順**:

```
[A] customer onboarding 時(Art. 19, 20, 22):
  1. Art. 22(1) — customer identification:
     - 自然人: 氏名、住所、生年月日、ID 番号、国籍
     - 法人: 名称、住所、登録番号、UBO(Art. 22(4) + Chapter IV)
     - "person purporting to act on behalf of the customer": 代理人(KYA delegation 元)
  2. Art. 22(6)(b) — verification:
     - eIDAS substantial/high の electronic ID(EUDI Wallet、加盟国 eID)
     - or QES(Qualified Electronic Signature)
     - or 紙ベース ID + 対面確認(伝統的手段、許容される)
  3. Art. 20(1)(c) — purpose & intended nature:
     - "I will use agents to make API micropayments up to EUR X per month for Y purposes"
     - → KYA delegation mandate の事前申告に対応

[B] agent によるその後の transaction 時(Art. 20(1)(e), Art. 22, TFR):
  4. Art. 20(1)(e) — ongoing monitoring:
     - CASP は agent 経由 transaction を customer の活動として継続監視
     - 異常パターン検知(取引額の急変、対象国の変化、頻度の急増)
  5. Art. 22(1) — "purporting to act on behalf of":
     - agent が transaction を initiate する時、CASP は agent ↔ customer の binding を確認
     - これは事前の delegation mandate に対する verification
  6. TFR 2023/1113 — originator information:
     - 全 crypto-asset transfer に customer の name + wallet + ID を添付
     - €1,000 以上 self-hosted wallet 宛は ownership/control 追加検証

[C] CDD 不能時(Art. 21):
  7. agent ↔ customer の binding が証明できない → CASP は取引拒否 + 関係終了 + SAR 検討
```

**ここで KYA Layer が解決する技術問題**(★ 核心):

1. **Step 3 (purpose)**: customer の delegation mandate(scope、上限、期間、許可カテゴリ)を **machine-readable VC** として CASP に提示
2. **Step 5 (purporting to act)**: agent transaction 時に **delegation chain proof**(human DID → delegation VC → agent DID → signed transaction)を CASP に提示
3. **Step 4 (ongoing monitoring)**: KYA audit trail(7年保管、PQC migratable)を CASP の continuous monitoring の証拠データとして提供
4. **Step 6 (TFR originator)**: KYA attestation hash を originator information に **selectively disclosed** に埋め込み(SD-JWT で privacy preserving)
5. **Step 7 (CDD 不能)**: KYA Layer が delegation chain を verify できない場合は agent transaction を block(KYA SDK が CASP の Art. 21 リスクを技術的に低減)

→ **AMLR の条文要求と KYA SDK の技術機能が 1-on-1 にマップ**。これが decision-doc.md §0「規制 attestation packaging」の中核ユースケース。

### 3.2 設問 2: AWS AgentCore + Coinbase CDP + Privy は CASP として AMLR を負うか

**個別判定**:

| Stack 構成要素 | CASP 該当 | AMLR 直接適用 | KYA に対する役割 |
|---------------|----------|--------------|------------------|
| **Coinbase CDP**(US) | **Yes** | EU 顧客向けサービス提供時 + Travel Rule(域外 CASP との correspondent 関係) | **顧客 1**(AMLR 義務を KYA SDK で吸収する) |
| **Privy embedded wallet** | **Likely Yes**(custody control の論争中) | EU 顧客向け + Privy が EU 内で CASP 認可取得時に確定 | **顧客 2**(Privy 内製 KYC を KYA delegation attestation で拡張) |
| **Stripe Connect crypto rails** | **Yes** | Stripe Connect の MiCA CASP 認可下 | **顧客 3** |
| **AWS AgentCore Payments**(x402 orchestrator) | **No(non-custodial)**、ただしグレー | AMLR 直接適用なし(custody なし)。AI Act provider 義務 / GPAI systemic risk(Art. 51-55)は別途検討 | **インフラ顧客**(KYA Bridge SDK の標準実装先) |
| **MCP server / API service provider** | **No**(crypto-asset を扱うが受領者でカストディアンではない) | AMLR 直接適用なし。**ただし高額・継続性で Art. 19 occasional → business relationship 判定の場合あり** | **間接受益者**(KYA attestation を verify する側) |

**重要な解釈論点**:

- **Coinbase CDP / Privy / Stripe = 既存の MiCA CASP 認可保持者**。**AMLR 2027 で自動的に obliged entity 化**(MiCA CASP がそのまま AMLR obliged entity)
- AMLR 全面適用前(現在 2026-06)も、TFR 2023/1113 で **既に Travel Rule 義務を負っている**
- AWS AgentCore Payments は **CASP には該当しない可能性が高い**(non-custodial protocol orchestrator)が、agent 経由 transaction の orchestrator として **AI Act provider / deployer 義務、潜在的に AMLR Art. 18 outsourcing 受託者** の地位はある
- → **KYA Layer の primary integration target = Coinbase CDP / Privy / Stripe(CASP として AMLR 義務を負う側)**

出典: §2.5 と同じ + [Osborne Clarke: Agentic Payments - a new challenge for Europe's payments ecosystem](https://www.osborneclarke.com/insights/agentic-payments-new-challenge-europes-payments-ecosystem)、[Taylor Wessing: Agentic AI in payments - Key regulatory considerations](https://www.taylorwessing.com/en/insights-and-events/insights/2026/02/agentic-ai-in-payments)、アクセス 2026-06-01

### 3.3 設問 3: KYA Project の規制 attestation packaging で AMLR CDD を「動く SDK」にできるか(技術-法的マッピング)

**結論: Yes、条件付き**。

**技術-法的マッピング表(★ Phase 1 Sprint 1 PoC スコープに直接落とせる)**:

| AMLR 条項 | 法的要求 | KYA SDK 技術機能 | Phase 1 PoC 範囲 |
|----------|---------|----------------|------------------|
| Art. 22(1) customer identification | 自然人/法人の identify、purporting to act 代理人含む | did:web → SD-JWT VC で human DID + delegation chain attestation | **In** |
| Art. 22(6)(b) eIDAS-based verification | substantial/high eID、QES | EUDI Wallet integration(ARF v2.8+)、QES 代替には外部 QTSP 連携 | **Out**(Phase 2、EUDI ARF delegation が固まってから) |
| Art. 20(1)(c) purpose & intended nature | 取引目的の事前申告 | Delegation mandate VC(scope、limit、duration、categories)を customer 申告として記録 | **In** |
| Art. 20(1)(e) ongoing monitoring | 継続的取引監視 | KYA audit trail(7年保管、PQC migratable、ML-DSA + Ed25519 dual-sig) | **In(配線のみ、本格運用は Phase 2)** |
| Art. 21 inability to comply | CDD 不能時の拒否 | Delegation chain verify 失敗時の transaction block hook | **In** |
| Art. 18 outsourcing | obliged entity の一部として扱う | SDK ライセンス契約 + 監督届出サポート + audit cooperation | **In(契約テンプレ整備)** |
| Art. 25 reliance(代替) | 他 obliged entity への依拠 | KYA が obliged entity 化する必要なし → 使用しない | **N/A** |
| Art. 22(7) RTS reliable sources | AMLA RTS で指定される verification sources | AMLA RTS 確定後に対応(2026-Q4 確定見込み) | **Out(Phase 2 で再評価)** |
| Art. 28 RTS data points | 収集すべき CDD data の RTS | 同上 | **Out(Phase 2 で再評価)** |
| TFR 2023/1113 originator info | 送金者情報の transfer 添付 | Notabene 等の Travel Rule 製品と integration(KYA attestation hash を機械可読フィールドに) | **In(integration 設計)** |
| TFR self-hosted ownership proof | EUR 1,000 以上 self-hosted との transfer | KYA delegation attestation + Satoshi test 互換 | **Out(Phase 2)** |
| Art. 79 self-hosted carve-out | KYA Layer 自体の AMLR 適用除外 | "no access/control over crypto-assets" 設計の明文化(SDK 契約、技術 spec、white paper) | **In(法的設計の最重要)** |

**Phase 1 Sprint 1(4 ヶ月 PoC)へのフィードバック**:

- decision-doc.md §3 / §7 の **AgentCore → did:web → SD-JWT VC → ERC-8004 agentURI → x402** のチェーンに **Art. 22(1) customer identification + Art. 20(1)(c) delegation mandate** を組み込む
- ZK 抜き、PQC 配線のみ、testnet という制約下で**4 ヶ月 PoC スコープに収まる**(C-tech-trends/erc-8004-agentcore-glue.md の feasibility "Medium、限定スコープなら High" と整合)

### 3.4 設問 4: AMLA RTS が agent identity を eIDAS QTSP 必須化する確度(W2「低」からの再評価)

**W2 評価**: 確度 低 / 影響 大
**W3 再評価**: 確度 **中-高** / 影響 大

**上方修正の根拠**:

1. **AMLR Art. 22(6)(b)が eIDAS substantial/high + QES を明示**(W2 では一般的な eIDAS リンクと捉えていた)
2. **AMLA Article 28(1) RTS Draft(2026-02-09)が "attributes which electronic identification means must feature" を直接 RTS スコープに**(W2 では RTS の具体的内容を未確認だった)
3. **EUDI Wallet 全加盟国提供義務 = 2026-12 まで**。これで AMLA は "eIDAS / EUDI Wallet が広く利用可能" を前提に RTS を書ける
4. **AMLA は "harmonized supervision" を最重要原則とする**(同時公表の harmonized supervision RTS で明確) → 加盟国別の verification 手段の差を縮小する方向

**ただし「中-高」止まりの理由**:

1. **業界 response(2026-05-08 終了)が QTSP-only 解釈に強く反対している可能性** → 最終 RTS で緩和される
2. AMLR Art. 22(6) は **"may use"(任意)** 表現。RTS で "shall use" に格上げするのは法的に困難
3. 紙ベース ID + 対面確認は伝統的に許容され続ける(高齢層、デジタル弱者保護)
4. **AMLA は 2025-07 業務開始の新組織**、RTS 初版で大胆な解釈は政治的に困難

**KYA への対応戦略**:

- **2026-06-30 まで**: AMLA Article 28(1) RTS Draft への業界 response 完全分析(Hogan Lovells、ESBG、Invest Europe、Blockchain Working Group、Notabene、Sumsub など)
- **2026-09-30 まで**: AMLA 最終 RTS Draft(Commission 提出版)の精査
- **2026-12-31 まで**: Commission delegated act 採択ステータス確認
- **KYA SDK 設計**: QTSP **必須化シナリオでも QTSP 任意シナリオでも動く dual-mode** で設計。QTSP 必須化なら外部 QTSP(Namirial、WebID、IDnow、Signicat 等)と integration 契約

**最大の懸念点**: AMLA RTS で **"reliable and independent sources" が QTSP のみに限定された場合、KYA Bridge SDK 単独では AMLR Art. 22(7) を満たせず、QTSP 連携が必須に**。これは KYA SDK の **EU 市場での価値が "QTSP の delegation 拡張" に縮小** することを意味する。逆に言えば **KYA Layer は QTSP との補完関係を明確にすればポジション維持可能**(QTSP は人間 identity を保証、KYA は agent ↔ human binding を保証、両者で agent identity が完成)。

### 3.5 設問 5: PayPay が日本から EU 向けに agent payments を提供する時の AML 影響(規制 chain)

**規制チェーン**:

```
日本: 犯収法(犯罪収益移転防止法、2008-03-01 施行、2025-03 最終改正)
  + 金融庁 AML/CFT ガイドライン(2026-03-31 更新)
  + Travel Rule(日本版、2023-06-01 施行、改正資金決済法)
  ↓
日本 → EU cross-border transfer
  ↓
EU: TFR 2023/1113(originating side が日本 → EU の "intermediary CASP" or "beneficiary CASP" 経由)
  + AMLR 2024/1624(EU 内 CASP との correspondent 関係 → Art. 37 EDD)
  + MiCA 2023/1114(EU 内 CASP 認可必須)
  + eIDAS 2.0(EU 顧客の identification 手段)
```

**PayPay 固有の論点**:

- **PayPay は現在 MiCA CASP 認可を保持しない**(2026-06 時点、日本特化)
- EU 向け agent payments 提供には:
  - **Option A**: EU 子会社 + MiCA CASP 認可取得 → AMLR obliged entity 直接適用
  - **Option B**: EU 内 CASP との correspondent 契約 → AMLR Art. 37 EDD で EU 側が PayPay を AML 評価
  - **Option C**: agent payments は EU 内では提供せず、EU 顧客が日本サービスを利用する形のみ → 日本側で犯収法対応(域外適用は限定的)

**FATF Recommendation 16(Travel Rule)の equivalence**:

- 日本は FATF Recommendation 16 を Crypto に拡張(2023-06-01)
- EBA Travel Rule Guidelines § 4.6: 第三国 CASP が Recommendation 16 同等規制下にある場合、EU 内 CASP は **risk-based に** 取り扱う(自動的に "equivalent" 認定ではない)
- 日本 FSA は 2026-05 に "equivalent travel-rule jurisdictions" リスト更新([Japan FSA AML/CFT Guidelines (PDF)](https://www.fsa.go.jp/common/law/amlcft/211122_en_amlcft_guidelines.pdf)、[Japan Ministry of Finance: AML/CFT/CPF](https://www.mof.go.jp/english/policy/international_policy/amlcftcpf/3.efforts.html)、[FATF: Japan country page](https://www.fatf-gafi.org/en/countries/detail/Japan.html))

**KYA + PayPay への含意**:

- decision-doc.md §5 で **PayPay = 最初の paying customer + 仮説検証パートナー** と整理。**Path C(Hybrid)**
- PayPay の EU 進出は **長期戦略の一部であり Phase 0 / Phase 1 でのスコープ外**
- ただし KYA SDK が **AMLR Art. 37 EDD 対応モジュール** を持てば、EU 内 CASP との correspondent 関係構築時に PayPay の "AML readiness" を技術的に証明できる → 将来の EU 進出オプション維持
- 日本側でも犯収法上 **agent 経由 transaction の取扱い指針が未確定**(金融庁 AI ガバナンス検討会、2026 議題)→ KYA Project は日本でも先行者利位置取り可能

出典: [Japan FSA Guidelines for AML/CFT (PDF)](https://www.fsa.go.jp/common/law/amlcft/211122_en_amlcft_guidelines.pdf)、[Japan Ministry of Finance AML/CFT/CPF Page](https://www.mof.go.jp/english/policy/international_policy/amlcftcpf/3.efforts.html)、[FATF Japan Country Page](https://www.fatf-gafi.org/en/countries/detail/Japan.html)、[Global Law Experts: Japan Payment Services Act 2026 Guide](https://globallawexperts.com/japan-payment-services-act-2026-guide/)、[ZIGRAM: Japan AML Guidelines 2026](https://www.zigram.tech/resources/japan-aml-guidelines-2026)、[Fincrime Central: FSA Japan AML Guidelines Update March 2026](https://fincrimecentral.com/fsa-japan-aml-guidelines-update-march-2026/)、[NPA JAFIC AML Measures](https://www.npa.go.jp/sosikihanzai/jafic/en/maneron_e/manetop_e.htm)、[NameScan: AML Regulations in Japan](https://namescan.io/insights/aml-regulations-japan-2025/)、アクセス 2026-06-01

**この設問は別ファイル `tracks/B-regulations/cross-border-payment-flow.md`(Track B README 未着手項目)で深掘り推奨**。

---

## 4. 「抜け道」分析(KYA Project の視点)

### 4.1 KYA Layer の AMLR 上の最適ポジション

**3 つの可能性**:

| ポジション | AMLR 上の地位 | 義務 | KYA への適合 |
|-----------|--------------|------|-------------|
| **(A) Art. 79 infrastructure provider** | AMLR 適用 **除外**(明示) | なし | **★ 最有力** |
| **(B) Art. 18 outsourcing service provider** | obliged entity の一部として扱われる、liability は CASP が full retain | SDK ベンダーとしての通常義務、監督届出は CASP 側 | **★ 顧客との関係上は必須** |
| **(C) Art. 25 reliance による別 obliged entity** | KYA 自体が AMLR obliged entity 化 | 自社で AML プログラム、SAR 報告、MLRO 任命、独立 AML 監督 | **回避すべき**(コスト・規制負担増大) |

**推奨スタンス(暫定)**: **(A) を主軸 + (B) を顧客契約レベルで併用**。

- **(A) 主張根拠**: KYA Layer は agent identity attestation のみを発行・検証し、crypto-asset の access / control を一切持たない → Art. 79 の **"providers of self-hosted wallets, insofar as they do not possess access to or control over these crypto-asset wallets"** の類推適用が可能(self-hosted wallet provider と並ぶ infrastructure provider)
- **(B) 補完**: 顧客 CASP との契約上は Art. 18 outsourcing 関係(KYA = service provider、CASP = obliged entity)→ supervisor 届出は CASP 側
- **(C) 回避**: KYA 自体は obliged entity 化しない(decision-doc.md §0 と整合)

### 4.2 リスク評価(W2 からの更新)

| リスク項目 | W2 評価 | **W3 評価** | 変動理由 | 対策 |
|-----------|--------|------------|----------|------|
| AMLA RTS で eIDAS QTSP 必須化 | 確度 低 / 影響 大 | **確度 中-高 / 影響 大** | AMLR Art. 22(6)(b) + Art. 22(7) + AMLA Article 28(1) RTS Draft 公表確認 | (1) RTS response 分析、(2) QTSP 連携契約準備、(3) dual-mode SDK 設計 |
| KYA Layer が AMLR obliged entity 化 | 確度 低 / 影響 大 | **確度 低 / 影響 大 維持** | Art. 79 明示除外を発見、根拠強化 | (1) infrastructure positioning 明文化、(2) Phase 1 で弁護士確認 |
| CASP が agent transaction を一律拒否 | 未識別 | **確度 中 / 影響 大 新設** | Art. 21(CDD 不能時の取引拒否)から導出 | (1) KYA delegation chain proof を CASP に integration、(2) 既存 CASP との PoC で実証 |
| AWS AgentCore Payments 自体の規制カテゴリ未確定 | 未識別 | **確度 中 / 影響 中 新設** | non-custodial protocol orchestrator として AMLR 非該当寄りだが AI Act provider 義務リスク | (1) AI Act × AMLR 重層で位置取り、(2) AWS との dialogue |
| Travel Rule(TFR)が agent ↔ human binding を originator info に要求 | 未識別 | **確度 中 / 影響 中 新設** | TFR 2023/1113 + EBA Guidelines。AMLA が agent transaction 専用 guideline 出す可能性 | (1) Notabene 等との integration 設計、(2) SD-JWT で privacy preserving |
| 加盟国 transposition / 国別 supervisor 差 | 未識別 | **確度 中 / 影響 中 新設** | AMLD6 transposition 期限 2027-07-10、加盟国 supervisor(BaFin、AMF、CNMV、FCA-EU、CSSF、CONSOB 等)で実装差 | (1) BaFin / CSSF / AMF の Guidelines を W4 で個別確認、(2) 主要法人設立国は AMLA 直接監督対象国を選ぶ |

### 4.3 推奨ポジション(KYA Project として)

**核となる主張(法的に固める部分)**:

> "KYA Layer は agent identity attestation infrastructure であり、AMLR Article 79 が明示する self-hosted wallet provider と同様、crypto-asset の access または control を一切持たない。したがって AMLR の obliged entity 義務を直接負わない。KYA Layer は CASP の AMLR Art. 22(1) customer identification および Art. 22(6)(b) verification を技術的に支援する outsourcing service provider(Art. 18)として位置取る。"

**法的根拠固めの優先順位**:

1. **Phase 1 で弁護士確認必須**: Art. 79 類推適用が認められるか、Art. 18 outsourcing 構造が適切か
2. **EU 弁護士事務所選定**: Bird & Bird、Hogan Lovells、Allen & Overy、Linklaters、Clifford Chance のいずれか(W2 EU AI Act 分析で同じ事務所群を使用、規制重層対応で同一事務所継続が efficient)
3. **AMLA 公開協議への業界団体経由参画**: Blockchain Working Group、EU Crypto Initiative 経由で KYA stance を policy paper に反映

---

## 5. 戦略的含意(decision-doc.md への反映候補)

### 5.1 §0 Executive Summary

**追記候補**:

> "AMLR 2027-07-10 適用で **CASP の CDD 義務が agent commerce に直接影響**。Coinbase CDP / Privy / Stripe Connect crypto rails = MiCA CASP として AMLR obliged entity 直接適用。KYA Bridge SDK の Art. 18 outsourcing 位置取り + Art. 79 infrastructure provider 除外で **KYA 自体は obliged entity 化を回避** しつつ、CASP の AMLR 充足を技術的に解決。"

### 5.2 §1 法人設立国

**W2 暫定方向「EU 域外スタート + EUDI Wallet 統合フェーズで EU 子会社検討」を維持**。AMLR 分析でこの方向が **更に強化される**:

- AMLA 直接監督対象 = 40 個の高リスク obliged entities(2028-01-01 開始)
- EU 法人で AMLR obliged entity になると AMLA 監督対象になりうる → 規制負担増
- **初期は日本 / シンガポール / UAE から EU 顧客にサービス提供する形が AMLR 観点でも合理的**
- AMLA RTS QTSP 必須化シナリオが現実化した場合、EU 子会社 + QTSP 取得が必要になる可能性 → **2027-Q2 まで EU 子会社設立判断を保留**

### 5.3 §2 ビジネスモデル

**SDK ライセンス + Hybrid OSS Bridge + 商用 規制 attestation packaging を強化**:

- 商用モジュールの中で **「AMLR Article 22 + Article 20 + Article 21 対応モジュール」** が個別 SKU として成立
- 価格設定: AMLR 対応モジュールは 500-2,000 万円/社/年(競合 Sumsub / Notabene の Travel Rule SaaS が月 50-300 万円 → 年 600-3,600 万円との対比)
- **Phase 1 Sprint 1 で AMLR module の MVP**(Art. 22(1) human ↔ agent binding + Art. 20(1)(c) delegation mandate VC + Art. 21 block hook)を OSS Bridge に組み込む

### 5.4 §3 技術アーキテクチャ

**Phase 1 Sprint 1(4 ヶ月 PoC)に AMLR module を追加**:

```
AgentCore Workload Access Token
  └→ did:web (KYA Bridge SDK が発行)
      └→ SD-JWT VC で human↔agent binding を attest(★ Art. 22(1) 充足)
          └→ Delegation mandate VC(scope、limit、duration、categories)(★ Art. 20(1)(c) 充足)
              └→ ERC-8004 agentURI に登録
                  └→ x402 で支払い
                      └→ KYA Audit Trail に記録(★ Art. 20(1)(e) ongoing monitoring 支援)
                      └→ Delegation verify 失敗時は block(★ Art. 21 CDD 不能時の取引拒否支援)
```

→ W2 確定の 3 層 Bridge アーキテクチャ + AMLR module で **EU CASP 向けに「動く SDK」が技術的に成立**

### 5.5 §5 PayPay との関係 / 時間圧力

**時間圧力の二段構成を AMLR で再評価**:

- **AWS 後出しリスク = 7 ヶ月**(2026-12 re:Invent まで)→ 変更なし
- **EU 規制重層市場形成期間 = 12-18 ヶ月**(2026-Q4 〜 2027-Q4)→ **AMLR 全面適用 2027-07-10 は変動なし、AI Act 高リスク義務延期(2027-12)とは別計算**
- **新たな時間圧力**: AMLA RTS 確定(2026-Q4 〜 2027-Q1 見込み)→ KYA SDK design lockdown の deadline

### 5.6 §6 リスク・前提条件

**W3 で更新が必要なリスク項目**:

- [ ] AMLA RTS で eIDAS QTSP 必須化リスク: **W2「確度 低 / 影響 大」→ W3「確度 中-高 / 影響 大」上方修正**
- [ ] CASP が agent transaction を一律拒否するリスク(Art. 21 由来): **NEW W3、確度 中 / 影響 大**
- [ ] AWS AgentCore Payments 自体の AMLR / AI Act 規制カテゴリ未確定: **NEW W3、確度 中 / 影響 中**
- [ ] Travel Rule(TFR)が agent ↔ human binding を originator info に要求するリスク: **NEW W3、確度 中 / 影響 中**
- [ ] 加盟国 transposition / 国別 supervisor 差: **NEW W3、確度 中 / 影響 中**

### 5.7 §7 Phase 1 ゲート判断

**Phase 1 Sprint 1(4 ヶ月 PoC)に AMLR module を組み込む**:

- 既存スコープ: AgentCore → did:web → SD-JWT VC → ERC-8004 → x402
- **追加**: Art. 22(1) human ↔ agent binding + Art. 20(1)(c) delegation mandate VC + Art. 21 block hook + Art. 79 positioning の明文化
- **OSS Bridge 公開時(2026-12 re:Invent 前)に "AMLR-ready" マーケティングが可能**

---

## 6. 主要発見(エグゼクティブ向けサマリ)

1. **AMLR は agent 自体を CDD 対象とせず**、agent 背後の人間 / 法人 customer の CDD で吸収する構造。**Art. 22(1) "any person purporting to act on behalf of the customer"** が KYA delegation の法的接点(条文上の明示根拠あり)

2. **Article 79 の self-hosted wallet 明示除外で KYA Layer の "infrastructure provider" 位置取りに法的根拠**。これは W2 EU AI Act 分析で言及した "ノンカストディで潜る" 戦略の AMLR 上の確固たる足場(decision-doc.md §0 と整合)

3. **AMLR Art. 22(6)(b) が eIDAS substantial/high + QES を verification 手段として明示** → AMLA Article 28(1) RTS Draft(2026-02-09 公表、2026-05-08 公開協議終了)が "reliable and independent sources" を QTSP-only に絞る可能性 → **W2 で「確度 低」とした eIDAS QTSP 必須化リスクを「確度 中-高」に上方修正**(★ 最重要更新)

4. **CASP の agent transaction CDD は条文 → KYA SDK 機能に 1-on-1 マップ可能**(§3.3 表)。Phase 1 Sprint 1 PoC スコープ(4 ヶ月、AWS-first、testnet)に AMLR module を組み込むことが技術的・時間的に可能

5. **AWS AgentCore + Coinbase CDP + Privy stack の CASP 判定**: Coinbase CDP / Privy / Stripe = CASP として AMLR 義務、AWS AgentCore 自体は non-custodial protocol orchestrator として CASP 非該当寄り → **KYA Layer の primary integration target = Coinbase CDP / Privy / Stripe(義務側)**

6. **AMLA Article 28(1) RTS Draft への業界 response 分析が 2026-06 中に必須**(公開協議 2026-05-08 終了済) → **W3-W4 アクション**

7. **PayPay 日本→EU agent payments は Phase 0 / Phase 1 スコープ外**。ただし KYA SDK の AMLR module が PayPay 将来 EU 進出時の technical readiness を提供 → cross-border 論点は別ファイルで深掘り推奨

---

## 7. ソース

### 一次資料(EU 法・条文)

- [Regulation (EU) 2024/1624 (AMLR) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/1624/oj/eng) — WebFetch 403、条文 verbatim は AMLR portal + Better Regulation + 複数 secondary source 経由
- [Regulation (EU) 2024/1620 (AMLA Regulation) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/1620/oj/eng)
- [Regulation (EU) 2023/1113 (TFR / Travel Rule) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2023/1113/oj/eng)
- [Regulation (EU) 2023/1114 (MiCA) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2023/1114/oj/eng)
- [Regulation (EU) 2024/1183 (eIDAS 2.0) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/1183/oj/eng)
- [Directive (EU) 2024/1640 (AMLD6) - EUR-Lex](https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=OJ:L_202401640)

### AMLR Article 単位リファレンス(amlr.eu portal、WebFetch 403、WebSearch snippet 経由)

- [AMLR Chapter III Customer Due Diligence](https://amlr.eu/chapter-iii-customer-due-diligence/)
- [Article 18 Outsourcing](https://amlr.eu/article-18-outsourcing/)
- [Article 19 Application of CDD Measures](https://amlr.eu/article-19-application-of-customer-due-diligence-measures/)
- [Article 20 Customer Due Diligence Measures](https://amlr.eu/article-20-customer-due-diligence-measures/)
- [Article 21 Inability to Comply](https://amlr.eu/article-21-inability-to-comply-with-the-requirement-to-apply-customer-due-diligence-measures/)
- [Article 22 Identification and Verification](https://amlr.eu/article-22-identification-and-verification-of-the-identity-of-customers-and-beneficial-owners/)
- [Article 25 Purpose and Intended Nature](https://amlr.eu/article-25-identification-of-the-purpose-and-intended-nature-of-a-business-relationship-or-occasional-transaction/)
- [Article 28 RTS on CDD Information](https://amlr.eu/article-28-regulatory-technical-standards-on-the-information-necessary-for-the-performance-of-customer-due-diligence/)
- [Article 79 Anonymous Accounts and Bearer Shares](https://amlr.eu/article-79-anonymous-accounts-and-bearer-shares-and-bearer-share-warrants/)
- [Crypto Recitals — EU Transfer of Funds Regulation](https://amlr.eu/crypto-recitals/)
- [FIAU Malta AMLR PDF (full text)](https://fiaumalta.org/app/uploads/2025/02/The-AMLCFT-Regulation-AMLR.pdf)

### AMLA 公式文書(WebFetch 403、複数 secondary source 経由)

- [AMLA Consultation on Draft RTS on Customer Due Diligence](https://www.amla.europa.eu/policy/public-consultations/consultation-draft-rts-customer-due-diligence_en)
- [AMLA Consultation Paper Draft RTS under Article 28(1) PDF (2026-02-09)](https://www.amla.europa.eu/document/download/3d430294-5171-455c-b565-a86fc5f3cb1c_en?filename=Consultation+Paper+Draft+RTS+under+Article+28%281%29.pdf)
- [AMLA Consultation Paper Draft RTS under Article 19(9) PDF (2026-02-09)](https://www.amla.europa.eu/document/download/ec0ece6c-f459-43ac-8a83-1a330412bb87_en?filename=Consultation+Paper+Draft+RTS+under+Article+19%289%29.pdf)
- [AMLA Work Programme 2025](https://anti-money-laundering.eu/amla-work-programme-2025/)
- [FIAU Malta news on AMLA Public Consultations](https://fiaumalta.org/news/amla-public-consultations-draft-rts-on-article-281-of-the-amlr-and-article-199-of-the-amlr-and-article-5310-of-the-amld6/)

### EBA / ESMA / Commission ガイダンス

- [EBA Travel Rule Guidelines EBA/GL/2024/11 PDF (2024-07-04)](https://www.eba.europa.eu/sites/default/files/2024-07/6de6e9b9-0ed9-49cd-985d-c0834b5b4356/Travel%20Rule%20Guidelines.pdf)
- [EBA Press Release on Travel Rule Guidance](https://www.eba.europa.eu/publications-and-media/press-releases/eba-issues-travel-rule-guidance-tackle-money-laundering-and-terrorist-financing-transfers-funds-and)
- [EBA Consultation Paper on Travel Rule Guidelines (2023-11)](https://www.eba.europa.eu/sites/default/files/2023-11/cc8eb1e9-df10-4517-81a1-de4a8c9d0360/Consultation%20paper%20on%20draft%20travel%20rule%20Guidelines%20under%20Regulation%20(EU)%202023_1113.pdf)
- [EBA Advises EU Commission on AML/CFT](https://www.eba.europa.eu/publications-and-media/press-releases/eba-advises-european-commission-foundations-new-anti-money-launderingcountering-financing-terrorism)
- [EBA Response on AMLA Mandates](https://www.eba.europa.eu/eba-response/92743?destination=/publications-and-media/events/consultation-proposed-rts-context-ebas-response-european-commissions-call-advice-new-amla-mandates)
- [ESMA MiCA page](https://www.esma.europa.eu/esmas-activities/digital-finance-and-innovation/markets-crypto-assets-regulation-mica)
- [ESMA MiCA Final Report on RTS on CoIs PDF](https://www.esma.europa.eu/sites/default/files/2024-05/ESMA35-1872330276-1670_MiCA_Final_report_on_RTS_on_CoIs.pdf)
- [European Commission Financial Crime AML page](https://finance.ec.europa.eu/financial-crime/anti-money-laundering-and-countering-financing-terrorism-eu-level_en)

### 法律事務所クライアントアラート

- [Jones Day: Crypto Assets, CASPs, and AML/CFT Compliance under MiCA and AMLR (2025-07)](https://www.jonesday.com/en/insights/2025/07/crypto-assets-casps-and-amlcft-compliance-the-new-european-regulatory-landscape-under-mica-and-amlr) (WebFetch 403、Lexology mirror 経由) / [Lexology mirror](https://www.lexology.com/library/detail.aspx?g=512161d0-0489-4c52-8645-573bae381d2e)
- [Hogan Lovells: AMLA consults on draft RTS on CDD and harmonized supervision](https://www.hoganlovells.com/en/publications/amla-consults-on-draft-rts-on-customer-due-diligence-and-harmonized-supervision) / [JD Supra mirror](https://www.jdsupra.com/legalnews/amla-consults-on-draft-rts-on-customer-2317413/)
- [Hogan Lovells: AMLA in the Payments Space](https://www.hoganlovells.com/en/publications/amla-in-the-payments-space)
- [Hogan Lovells: Changes in Beneficial Ownership rules under AMLR 2024/1624](https://www.hoganlovells.com/en/publications/changes-in-beneficial-ownership-rules-under-the-new-eu-antimoney-laundering-regulation-eu-20241624)
- [DLA Piper: New EU Anti-Money Laundering Rules](https://www.dlapiper.com/en/insights/publications/2024/12/the-new-anti-money-laundering-rules-what-you-need-to-know) / [Lexology mirror](https://www.lexology.com/library/detail.aspx?g=0963a545-12f5-4494-a637-82ef6de4d411)
- [DLA Piper US: New EU AML Rules - What to Know](https://www.dlapiper.com/en-us/insights/publications/global-anti-corruption-perspective/new-eu-anti-money-laundering-rules-what-to-know)
- [Norton Rose Fulbright: The new EU AML/CFT regime has arrived](https://www.nortonrosefulbright.com/en/knowledge/publications/644c5392/the-new-eu-amlcft-regime-has-arrived-are-you-ready)
- [Freshfields: The European AML package – what's in it for the crypto industry?](https://www.freshfields.com/en/our-thinking/blogs/risk-and-compliance/the-european-aml-package-whats-in-it-for-the-crypto-industry-102j9mn) / [Lexology mirror](https://www.lexology.com/library/detail.aspx?g=e5169b82-44a5-407b-918d-fb2999161fd9)
- [Freshfields: The EU's proposed AML law - impact on CASPs](https://www.freshfields.com/en/our-thinking/blogs/risk-and-compliance/the-eus-proposed-aml-law-the-impact-on-crypto-asset-service-providers-102h4xm)
- [Bird & Bird: EU AML Package – A New Adventure Begins (2024)](https://www.twobirds.com/en/insights/2024/global/eu-aml-package-%E2%80%93-a-new-adventure-begins)
- [Loyens & Loeff: AMLR ahead - AMLA holds first public hearings](https://www.loyensloeff.com/insights/news--events/news/amlr-is-approaching-amla-holds-first-public-hearings-on-draft-rts--for-business-relationships-and-cdd--time-for-obliged-entities-to-prepare/)
- [Herbert Smith Freehills Kramer: 2026 AML/CFT Consultations - Unpacking AMLA's New Draft RTS](https://www.hsfkramer.com/notes/fsrandcorpcrime/2026-posts/2026-aml-cft-consultations)
- [A&L Goodbody: AMLA consults on draft RTS on CDD measures and triggers](https://www.algoodbody.com/insights-publications/amla-consults-on-draft-rts-on-cdd-measures-and-triggers-and-confirms-its-priorities-for-2026-to-2028)
- [CSSF Luxembourg: New AML/CFT Regulation, AMLD6 and future AMLA supervisor](https://www.cssf.lu/en/2024/06/the-new-aml-cft-regulation-the-sixth-aml-cft-directive-and-the-future-eu-aml-cft-supervisor/)
- [CSSF Luxembourg: Consultation by AMLA on draft RTS on CDD](https://www.cssf.lu/en/Document/consultation-by-amla-on-the-draft-rts-on-customer-due-diligence/)
- [AMF France: AMF invites participants to AMLA consultations](https://www.amf-france.org/en/news-publications/news/amf-invites-financial-market-participants-amlas-consultations-three-draft-amlcft-implementing)
- [Deloitte Legal: The New EU AML Package](https://www.deloittelegal.de/dl/en/services/legal/perspectives/eu-aml-paket-wendepunkt-geldwaeschepraevention.html)
- [eucrim: The EU's New AML Single Rulebook Regulation](https://eucrim.eu/news/the-eu-new-aml-single-rulebook-regulation/)
- [eucrim: EBA New Guidelines on Travel Rule](https://eucrim.eu/news/eba-new-guidelines-on-travel-rule-to-tackle-money-laundering/)
- [Advant Beiten: New EU AML Package Implementation PDF](https://www.advant-beiten.com/fileadmin/beiten/Broschueren_2024/The_New_EU_Anti-Money_Laundering_Package_ADVANT_Beiten.pdf)
- [Arendt: Regulation on prevention of use of financial system for ML/TF](https://www.arendt.com/news-insights/ifm-regulatory-calendar/regulation-on-the-prevention-of-the-use-of-the-financial-system-for-the-purposes-of-ml-tf-amlr/)

### Agent commerce / AI x AMLR 専門分析

- [Osborne Clarke: Agentic Payments - a new challenge for Europe's payments ecosystem](https://www.osborneclarke.com/insights/agentic-payments-new-challenge-europes-payments-ecosystem)
- [Taylor Wessing: Agentic AI in payments - Key regulatory considerations (2026-02)](https://www.taylorwessing.com/en/insights-and-events/insights/2026/02/agentic-ai-in-payments)
- [ComplyAdvantage: Europe's regulatory roadmap 2026 - Centralization, digital identity, AI](https://complyadvantage.com/insights/europes-regulatory-roadmap-2026-2/)
- [ComplyAdvantage: Agentic AI in AML - transformative role](https://complyadvantage.com/insights/a-guide-to-the-transformative-role-of-agentic-ai-in-aml/)
- [Unit21: EU AI Act 2026 FAQs - What Fraud and AML Teams Need to Know](https://www.unit21.ai/blog/eu-ai-act-2026-faqs-what-fraud-and-aml-teams-need-to-know)
- [IMF: How Agentic AI Will Reshape Payments (IMF Notes Volume 2026 Issue 004)](https://www.elibrary.imf.org/view/journals/068/2026/004/article-A001-en.xml)

### 業界実装(Travel Rule / KYC ベンダー)

- [Notabene EU Travel Rule Compliance Guide PDF](https://7222759.fs1.hubspotusercontent-na1.net/hubfs/7222759/Reports/Travel%20Rule%20Compliance%20Guide%20The%20European%20Union%20%7C%20Notabene.pdf)
- [Notabene + Chainalysis Partnership](https://notabene.id/post/notabene-and-chainalysis-partner-to-bring-scalable-travel-rule-solution-to-cryptocurrency-businesses) / [Chainalysis mirror](https://www.chainalysis.com/blog/chainalysis-notabene-travel-rule-integration/)
- [Eventus + TRM Labs + Notabene "Project TEN"](https://www.eventus.com/cat-press-and-news/trm-labs-eventus-notabene-form-partnership-to-deliver-one-stop-compliance-solution-for-digital-asset-ecosystem/)
- [21 Analytics: EU Travel Rule TFR AML Requirements 2026](https://www.21analytics.co/travel-rule-regulations/european-union-eu-travel-rule-regulation/)
- [IDnow: Future of AML Identification - Are you ready for 2027?](https://idnow.io/future-of-amlr-identification-2027/)
- [Signaturit: AMLR & AMLD6 - New EU AML Rules for Digital Identity](https://www.signaturit.com/blog/amlr-amld6-new-aml-rules/)
- [Signicat: EU AMLR 2027 Requirements](https://www.signicat.com/blog/amlr-explained-what-changes-in-2027)
- [Namirial: From AMLR to eIDAS 2.0 - Compliance in KYC and Onboarding](https://www.namirial.com/en/blog/inspiration/amlr-eidas-2-financial-services/)
- [Namirial: AML-KYC - The Tsunami Arriving in 2026-2027](https://www.namirial.com/en/blog/ecosystem/aml-kyc/)
- [Veridas: AMLR 2027 Get Ready](https://veridas.com/en/amlr-2027-compliance/)
- [WebID: eIDAS 2.0 in the Context of EU-AMLR](https://webid-solutions.com/en/resources/blog/eidas-regulation-2-0-eu-amlr-context/)
- [Sumsub: Crypto Fraud and AML/CTF Compliance Guide 2026](https://sumsub.com/blog/crypto-aml-guide/)
- [Elliptic: What is crypto AML compliance?](https://www.elliptic.co/blockchain-basics/what-is-crypto-aml-compliance)
- [BankingHub: Travel Rule for Digital Asset Transfers](https://www.bankinghub.eu/topics/travel-rule-for-digital-asset-transfers)
- [Web3Firewall: MiCA Compliance Explained](https://www.web3firewall.xyz/mica-compliance-explained)

### MiCA / CASP / Self-hosted wallet 分析

- [Lexology: Custody under MiCA - Who's Really in Control?](https://www.lexology.com/library/detail.aspx?g=65ec0c23-248c-456c-a364-1942a5a85c21)
- [Lexology: MiCA and CASPs - Authorisation, Governance and Liability](https://www.lexology.com/library/detail.aspx?g=3ea83e34-3b46-43a2-9ec8-55810c59a810)
- [Dechert: Application of Second Part of MiCA - Regulation of CASPs](https://www.dechert.com/knowledge/onpoint/2025/1/application-of-second-part-of-mica---regulation-of-casps-and-oth.html)
- [KPMG Cyprus: MiCA August 2025 Overview PDF](https://assets.kpmg.com/content/dam/kpmg/cy/pdf/2025/markets-in-crypto-assets-regulation-mica.pdf)
- [Squire Patton Boggs: How To Comply With EU's Crypto-asset Rules PDF](https://www.squirepattonboggs.com/media/yvspymyt/mica-legal-framework-how-to-comply-with-the-eus-crypto-asset-rules.pdf)
- [Yannakas Blog: Self-Hosted Wallets Under EU Law (2026-01)](https://blog.yannakas.me/2026/01/self-hosted-wallets-eu-law/)
- [TLP Advisors: EU vs. Crypto Anonymity (2025-06)](https://techlawpolicy.com/2025/06/eu-vs-crypto-anonymity-what-you-need-to-know/)
- [DL News: Calm down - Why EU's AML regulation isn't scary for crypto](https://www.dlnews.com/articles/regulation/updated-eu-money-laundering-rules-do-not-ban-crypto-wallets/)
- [BeInCrypto: Circle's Patrick Hansen Clarifies EU AMLR 2027 Rules](https://beincrypto.com/eu-amlr-crypto-self-custody-exemptions-2027/)
- [Patrick Hansen (Circle) Twitter analysis 2024-03-26](https://x.com/paddi_hansen/status/1771929865257689257)
- [Decrypt: EU to Track Crypto Transfers Under New AML Rules](https://decrypt.co/318577/eu-to-track-crypto-transfers-under-new-aml-rules-eurogroup-president)
- [CoinGeek: EU law banning anonymous digital asset wallets by 2027 'final'](https://coingeek.com/eu-law-banning-anonymous-digital-asset-wallets-by-2027-final/)
- [VASPnet: How EU's Travel Rule goes above and beyond FATF requirements](https://vaspnet.com/articles/how-the-eus-travel-rule-goes-above-and-beyond-fatf-requirements)
- [Voveid Blog: The Travel Rule in Europe - How Stablecoin Corridors Break in Practice](https://blog.voveid.com/the-travel-rule-in-europe-how-stablecoin-corridors-break-in-practice/)
- [Rango Exchange: How AML Rules Apply to Crypto Wallets](https://rango.exchange/learn/web3-security/anti-money-laundering-rules)
- [BIS Papers No 166: From Cash to Crypto](https://www.bis.org/publ/bppdf/bispap166.pdf)
- [HyperVerge: Cryptocurrency AML Regulations Update EU](https://hyperverge.co/blog/cryptocurrency-aml/)
- [Citi Investor Services AML Evolution 2025 PDF](https://www.citigroup.com/rcs/citigpa/storage/public/Sec_Services_Anti-Money_Laundering_Article.pdf)

### CDD / Article 単位 secondary analysis

- [Anti-Money-Laundering.eu: New Customer Due Diligence (CDD) Data Points under AMLR](https://anti-money-laundering.eu/new-customer-due-diligence-cdd-data-points-under-amlr/)
- [Anti-Money-Laundering.eu: Business Relationships, Occasional and Linked Transactions under Art. 19(9)](https://anti-money-laundering.eu/business-relationships-occasional-transactions-and-linked-transactions-under-art-199-amlr/)
- [Anti-Money-Laundering.eu: New Outsourcing Requirements under Art. 18 AMLR](https://anti-money-laundering.eu/new-outsourcing-requirements-under-art-18-amlr/)
- [Anti-Money-Laundering.eu: New Reporting Obligations under Chapter V AMLR](https://anti-money-laundering.eu/new-reporting-obligations-under-chapter-v-amlr/)
- [Anti-Money-Laundering.eu: Purpose and Intended Nature of Business Relationship Art. 25](https://anti-money-laundering.eu/purpose-and-intended-nature-of-a-business-relationship-or-transaction-under-art-25-amlr/)
- [Anti-Money-Laundering.eu: Travel Rule overview](https://anti-money-laundering.eu/travel-rule/)
- [Anti-Money-Laundering.eu: Outsourcing is dead, long live outsourcing](https://anti-money-laundering.eu/outsourcing-is-dead-long-live-outsourcing/)
- [Morlings: AMLR Article 18 - Outsourcing, Control and Accountability](https://morlings.se/en/blog/amlr-art-18-outsourcing/)
- [Morlings: AMLR Article 21 - Managing Incomplete CDD](https://morlings.se/en/blog/amlr-art-21-inability-meet-requirements-customer-due-diligence/)
- [Morlings: AMLR Article 37 - Enhanced CDD Requirements for Crypto Sector](https://morlings.se/en/blog/amlr-art-37-enhanced-cdd-requirements-crypto-sector/)
- [Compliance360 Malta: New AMLR Rules on Outsourcing AML/CFT Tasks](http://compliance360.mt/new-amlr-rules-on-outsourcing-aml-cft-tasks-what-obliged-entities-need-to-know/)
- [Compliance360 Malta: Identification of Beneficial Owners under New AML Regulation](https://compliance360.mt/identification-of-beneficial-owners-of-corporate-entities-under-the-new-aml-regulation/)
- [AMLWatcher: AMLR 27 - What EU's New AML Regulation Means for CDD](https://amlwatcher.com/blog/amlr-27-eu-new-regulation/)
- [AMLWatcher: Key Changes in New EU AML/CFT Framework](https://amlwatcher.com/blog/key-changes-to-monitor-in-the-new-eu-aml-cft-framework/)
- [AMLBot: How EU AMLR Changes KYC Obligations for Crypto Businesses](https://blog.amlbot.com/how-eu-amlr-changes-kyc-obligations-for-crypto-businesses/)
- [AMLBot: EU Crypto Travel Rule for CASPs](https://blog.amlbot.com/eu-crypto-travel-rule-casp-requirements/)
- [Accountancy Europe: Navigating the EU Anti-Money Laundering PDF](https://accountancyeurope.eu/wp-content/uploads/2024/12/241218_AML_Regulation_Factsheet_AccountancyEurope.pdf)
- [Accountancy Europe: New EU AML Rules - Advice for Accountancy Practitioners](https://accountancyeurope.eu/publications/new-eu-aml-rules/)
- [Fluxforce: EU AMLR 2024 Requirements](https://www.fluxforce.ai/regulations/eu-eu-amlr-2024)
- [Advisense: AML Regulation (AMLR)](https://advisense.com/advisory/aml-financial-crime-prevention/aml-regulation-amlr/)
- [PwC Ireland: EU's new Anti-Money Laundering Authority](https://www.pwc.ie/services/audit-assurance/insights/eu-new-anti-money-laundering-authority.html)
- [DocuSign: AMLR - What changes in 2027?](https://www.docusign.com/en-gb/blog/amlr-what-changes-in-2027)
- [Lexology: AML Regulation 2024/1624 - Harmonizing Compliance Standards](https://www.lexology.com/library/detail.aspx?g=643fd9b7-fbc7-43e0-9e61-7ac10aae6026)
- [Moody's: Verifying Beneficial Owners in the EU](https://www.moodys.com/web/en/us/kyc/resources/insights/verifying-beneficial-owners-in-the-eu-a-multisource-path.html)
- [ESBG Response to AMLA Public Consultation on CDD](https://www.wsbi-esbg.org/esbg-response-to-the-amla-consultation-on-the-draft-rts-on-customer-due-diligence/)
- [Invest Europe: Response to AMLA Public Consultation on Draft RTS on CDD](https://www.investeurope.eu/publications-policy/publications/2026/response-to-amla-public-consultation-on-the-draft-rts-on-customer-due-diligence-under-article-28-1-amlr/)
- [Blockchain Working Group: AMLA publication of CDD RTS consultation paper](https://www.blockchainwg.eu/amla-publication-of-its-consultation-paper-on-its-draft-rts-on-customer-due-diligence-under-amlr-9-february-2026/)

### 日本 AML(cross-border 用、§3.5)

- [Japan FSA Guidelines for AML/CFT (PDF)](https://www.fsa.go.jp/common/law/amlcft/211122_en_amlcft_guidelines.pdf)
- [Japan Ministry of Finance AML/CFT/CPF Page](https://www.mof.go.jp/english/policy/international_policy/amlcftcpf/3.efforts.html)
- [Japan Ministry of Finance FATF Page](https://www.mof.go.jp/english/policy/international_policy/amlcftcpf/4.international.html)
- [Japan NPA JAFIC AML Measures](https://www.npa.go.jp/sosikihanzai/jafic/en/maneron_e/manetop_e.htm)
- [FATF Japan Country Page](https://www.fatf-gafi.org/en/countries/detail/Japan.html)
- [FATF Consolidated Assessment Ratings](https://www.fatf-gafi.org/en/publications/Mutualevaluations/Assessment-ratings.html)
- [Global Law Experts: Japan Payment Services Act 2026 Guide](https://globallawexperts.com/japan-payment-services-act-2026-guide/)
- [ZIGRAM: Japan AML Guidelines 2026](https://www.zigram.tech/resources/japan-aml-guidelines-2026)
- [Fincrime Central: FSA Japan AML Guidelines Update March 2026](https://fincrimecentral.com/fsa-japan-aml-guidelines-update-march-2026/)
- [NameScan: AML Regulations in Japan](https://namescan.io/insights/aml-regulations-japan-2025/)

---

## 8. W3-W4 以降の深掘り項目

- [ ] **2026-06 中**: AMLA Article 28(1) RTS Draft response 完全分析(ESBG / Invest Europe / Blockchain Working Group / Hogan Lovells / 主要 CASP の正式 response が公表されるタイミング)
- [ ] AMLR Art. 22(7) RTS の "reliable and independent sources" 定義が QTSP-only に絞られた場合のリスク評価
- [ ] AMLR Art. 22 verbatim full text を EUR-Lex で直接確認(現状 secondary source 経由)。コタさんが EUR-Lex で原文確認推奨
- [ ] AMLR Art. 37(CASP cross-border correspondent EDD)の具体的 EDD 措置を verbatim 確認
- [ ] AMLR Recitals 60-95(CDD / CASP 関連)を verbatim 確認
- [ ] EBA Travel Rule Guidelines EBA/GL/2024/11 § 4.5(self-hosted ownership proof)の具体的技術手段(Satoshi test 等)精査
- [ ] AMLA Article 19(9) RTS Draft(別建)の精査 — "business relationships, occasional and linked transactions" 定義の CASP 影響
- [ ] 加盟国 supervisor(BaFin、AMF、CSSF、CONSOB、CNMV 等)の AMLR 実装方針別個確認
- [ ] **cross-border-payment-flow.md**(Track B README 未着手)で 日本 → EU agent payments cross-border の詳細
- [ ] **Phase 1 で弁護士確認必須**: KYA Layer の Art. 79 類推適用、Art. 18 outsourcing 構造
- [ ] Coinbase / Privy / Stripe の MiCA CASP 認可ステータス + EU 内活動範囲確認(Track A 連携)
- [ ] AWS AgentCore Payments の規制カテゴリ自己定義 / 公的当局見解(W2 EU AI Act 分析の AgentCore Workload Access Token 仕様未公開と関連)

---

## 9. 注意・免責

- 本ドキュメントは **法律意見ではない**。リサーチドキュメント。最終判断は弁護士確認必須。
- AMLR、AMLA、Travel Rule、MiCA の verbatim 引用は **EUR-Lex 原文の WebFetch が 403** で取得できず、AMLR portal(amlr.eu)、Better Regulation、FIAU Malta PDF、anti-money-laundering.eu、複数の law firm client alert などの secondary source の verbatim snippet を合成。**critical な決定の前にコタさんが EUR-Lex で原文を直接確認すること推奨**。
- 「推定」「確度: 中-高」等の表記は意図的に使用。確定情報と推定を区別している。
- AMLA Article 28(1) RTS Draft(2026-02-09 公表)は **公開協議終了済(2026-05-08)** だが、AMLA → Commission 提出は 2026-07-10、Commission delegated act 採択は 2026-Q4 見込み(推定)。**最終 RTS で QTSP 必須化シナリオが緩和されれば、本ドキュメントの「確度 中-高」評価は再々下方修正の余地あり**。
- Article 79 の "self-hosted wallet provider" 類推を KYA Layer に適用する解釈は **AMLR の文言上は wallet provider に限定**。KYA Layer の identity attestation provider への類推適用は **弁護士確認まで暫定**(推定、確度: 中)。
- AWS AgentCore Payments の CASP 該当性判定は **AWS 公式立場が未公表**(2026-06-01 時点、AgentCore Workload Access Token 仕様も WebFetch 403)。本ドキュメントの "non-custodial protocol orchestrator として CASP 非該当寄り" は技術構造からの推定。
- Coinbase CDP / Privy の CASP 該当性は **既存運用ベース推定**。MiCA 認可ステータスの個別確認は Track A 連携で別途実施推奨。
- EUR-Lex / amlr.eu / amla.europa.eu / fiaumalta.org / Better Regulation / 主要 law firm サイトが WebFetch では 403 で取得できず、WebSearch snippet 経由で内容を確認。条文番号と段落構造は複数 secondary source でクロスチェック済だが、**critical な決定の前にコタさんが EUR-Lex / amla.europa.eu で原文確認すること推奨**。
