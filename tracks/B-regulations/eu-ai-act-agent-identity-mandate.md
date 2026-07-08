---
topic: EU AI Act が Agent Identity / KYA 相当の義務を課すか(2026-08 施行)
slug: eu-ai-act-agent-identity-mandate
last_updated: 2026-05-20
jurisdictions: [EU]
relevance_to_kya: high
status: draft
disclaimer: これは法律意見ではない。リサーチドキュメント。最終判断は弁護士確認必須。
---

# 論点: EU AI Act(Regulation (EU) 2024/1689)が Agent Identity / KYA を規制必須化するか

## TL;DR(結論先出し)

| 設問 | 答え | 根拠条文 |
|------|------|----------|
| AI Act は **agent identity を明示的に義務化** するか? | **No(明示義務なし)** | Recital / 113 articles のいずれにも "agentic AI" "agent identity" の定義語なし(外部分析、後述) |
| **間接的に同等の義務** を課すか? | **Yes(グレー寄り Yes)** | Article 50(1)(transparency)、Article 14(human oversight)、Article 26(deployer logs 6ヶ月)、Article 55(GPAI systemic risk) |
| KYA Layer は **そのまま compliance solution として位置取れる** か? | **Yes(条件付き)** | Article 50 + 14 + 26 の同時充足ツールとして売れる。eIDAS 2.0 EUDI Wallet との glue 設計が前提 |
| 2026-08-02 施行は予定通りか? | **部分的に No** | Article 50(transparency)= 2026-08-02 据え置き。**高リスク AI 義務(Art. 6-29)= 2027-12-02 へ延期(暫定合意)** |

**1 行で**: AI Act 単独では agent identity 義務化は弱い。**しかし AI Act × eIDAS 2.0 × PSD3/PSR × AMLR 2027 の重層効果** で、2027-2028 までに事実上の KYA 必須化が形成される(推定、確度: 中-高)。

---

## 1. 論点の定義

**問い**: AI Agent が API・他 Agent・人間に対して自律的に支払いを行う時、EU AI Act は agent の身元(identity)、人間との binding、capability attestation、audit trail を **明示的に義務化** しているか?

**なぜ KYA に関係するか**: KYA Project は L3(Multi-cloud Agent Identity & Compliance Layer)を狙う(`synthesis/decision-doc.md` §0)。AI Act が agent identity を義務化すれば KYA Layer は **EU 市場で事実上の必須インフラ** になる。逆に義務化が弱ければ KYA は "ベストプラクティス" 止まり(=売り込みが難しくなる)。

**今回のスコープ**: EU 単一法域に絞った深掘り。US / JP は別ファイルで後日。

---

## 2. EU 法域マッピング(時系列で「現状 → 2026-08 → 2027-12 → 2027 AMLR」)

### 2.1 適用法体系

| 規制 | 略称 | 適用日 | KYA への関係 |
|------|------|--------|--------------|
| Regulation (EU) 2024/1689 | **AI Act** | 段階施行(下記) | Agent transparency / human oversight / GPAI systemic risk |
| Regulation (EU) 2024/1183 | **eIDAS 2.0** | 2024-05-20 発効、EUDI Wallet 2026-12 までに全加盟国提供義務 | Agent identity attestation の技術基盤 |
| Regulation (EU) 2024/1624 | **AMLR** | 2027-07-10 適用開始 | Agent transact 時の CDD / KYC 義務 |
| PSD3 / PSR(2025-11-27 暫定合意) | **PSD3/PSR** | 2026 Q2-Q3 OJ 公表、+18-21 ヶ月後適用(=2028 中) | Agent payment の SCA、delegation 外注ルール |

### 2.2 AI Act の段階施行スケジュール(Article 113)

出典: [Article 113: Entry into Force and Application](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-113)、[Implementation Timeline](https://artificialintelligenceact.eu/implementation-timeline/)、アクセス 2026-05-20

| 日付 | 適用範囲 |
|------|----------|
| 2024-08-01 | Regulation 発効(Art. 113 first sentence) |
| 2025-02-02 | Chapter I(総則)+ Chapter II(禁止 AI、Article 5) |
| 2025-08-02 | GPAI モデル義務(Art. 51-55)発効。**ただし enforcement / 罰金は 2026-08-02 から** |
| **2026-08-02** | **Article 50 transparency(agentic AI 含む)**、Article 99(罰則)、AI Office 執行権限 |
| **2027-12-02** | **(暫定合意)Article 6-29 高リスク AI 義務**。**当初 2026-08-02 → Omnibus で延期** |
| 2028-08-02 | 製品組み込み型高リスク AI(暫定合意で 2027-08-02 → 延期) |

**重要な変更**: 2025-11-19 欧州委員会が "Digital Omnibus on AI" を公表、2026-05-07 に Council/Parliament で暫定合意 → **高リスク義務を 2027-12-02 へ延期**。ただし **Official Journal 未公表のため正式法ではない**。2026-08-02 までに正式採択予定([Council press release 2026-05-07](https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/)、アクセス 2026-05-20、403 のため WebSearch snippet 経由)。

→ **2026-08-02 施行で本当に動くのは Article 50(transparency)と GPAI 罰則**。高リスク部分(Art. 6-29)は **2027-12-02 まで猶予** の見込み。

### 2.3 サブ論点別の条文マッピング

#### サブ論点 1: Annex III + Article 6 で agentic / autonomous payment agent が高リスクか

**条文(一次資料からの引用)**:

- **Article 6(2)**: "AI systems referred to in Annex III shall be considered to be high-risk." 出典: [Article 6 Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-6)、アクセス 2026-05-20
- **Article 6(3)**: Annex III に該当しても "does not pose a significant risk of harm to the health, safety or fundamental rights of natural persons, including by not materially influencing the outcome of decision making" の場合は高リスクから外れる(carve-out)
- **Annex III, point 5(b)**: "AI systems intended to be used to evaluate the creditworthiness of natural persons or establish their credit score, **with the exception of AI systems used for the purpose of detecting financial fraud**" 出典: [Annex III via Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/annex-3)、アクセス 2026-05-20
- **Annex III, point 5(c)**: "AI systems intended to be used for risk assessment and pricing in relation to natural persons in the case of life and health insurance"

**Agentic AI / autonomous payment agent への当てはめ**:

| Agent ユースケース | Annex III 該当性 | 判定 |
|---------------------|------------------|------|
| 個人の与信判断を行う agent | 5(b) creditworthiness | **高リスク** |
| AML/fraud 検知のみの agent | 5(b) 例外 | 高リスクでない |
| 個人の生命保険・健康保険プライシング agent | 5(c) | **高リスク** |
| API/MCP server に x402 で支払うだけの payment agent | **どの Annex III カテゴリにも明示的に該当せず** | **グレー(原則 = 非高リスク、ただし carve-out の逆を取られるリスク)** |
| 個人の決済を代行する家計簿 agent | Annex III 上は明示なし | **グレー** |

**重要**: Edgar Dunn / Hogan Lovells / Knowlee 各社の整理によれば、**「個人の財務判断に重大な影響を与える agentic AI」は Annex III 5(b) 経由で高リスク化する解釈が有力**。ただし AML/fraud 例外があるため、純粋な **自律支払い executor(意思決定はユーザーが事前承認、agent は execution のみ)** は **非高リスク** の解釈が成り立つ(推定、確度: 中)。

出典:
- [EU AI Act: What It Means for Agentic Commerce - Edgar Dunn](https://www.edgardunn.com/articles/the-new-rules-for-ai-inside-the-eus-bold-legislation)、アクセス 2026-05-20
- [Knowlee: Annex III Obligations for Banks, Fintechs, Insurers](https://www.knowlee.ai/blog/ai-act-financial-services-compliance)、アクセス 2026-05-20
- [Hogan Lovells: AI regulation in financial services](https://www.hoganlovells.com/en/publications/ai-regulation-in-financial-services-navigating-the-eu-ai-act-in-a-layered-regulatory-landscape)、アクセス 2026-05-20(WebFetch 403 のため概要のみ)
- [European Commission Draft Guidelines on High-Risk AI Classification (2026-05-19)](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai) パブコメ 2026-06-23 まで

#### サブ論点 2: Article 16-29 で agent identity / traceability / human oversight がどう規定されているか

**該当条文(高リスク AI 系のみ。2026-08 → 2027-12 へ延期見込み)**:

- **Article 14(1)**: "High-risk AI systems shall be designed and developed in such a way, including with appropriate human-machine interface tools, that they can be effectively overseen by natural persons during the period in which they are in use."
- **Article 14(3)**: "The oversight measures shall be commensurate with the risks, level of autonomy and context of use of the high-risk AI system" — **"level of autonomy" を明示** → autonomous agent ほど厳しい oversight が要求される
- **Article 14(4)**: 出力を解釈・無視・上書きできる人間オペレータ要求
- **Article 16**: 高リスク AI の provider 義務統合(QMS / Tech Doc / Logs / Conformity Assessment / CE marking / Registration)
- **Article 26(6)**: "Deployers of high-risk AI systems shall keep the logs automatically generated by that high-risk AI system **for a period appropriate to the intended purpose of the high-risk AI system, of at least six months**, unless provided otherwise in applicable Union or national law"

出典: [Article 14: Human Oversight - Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-14)、[Article 16 - Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-16)、[Article 26 - Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-26)、アクセス 2026-05-20

**Agent identity への含意**:
- **明示的な "agent identity" 義務はない**(条文に該当語なし)
- ただし Article 14 "level of autonomy" 文言 + Article 26 6ヶ月ログ保管 = **事実上 audit trail に agent 識別子を含めないと監査に応えられない**(推定)
- 弁護士見解(Bird & Bird、Clifford Chance、Hogan Lovells)は概ね「**delegation chain audit + agent identifier 保持**は事実上の compliance ベストプラクティス」と整理 — ただし条文上の明示義務ではない

#### サブ論点 3: Article 50(transparency)— agentic AI への適用

**これが 2026-08-02 施行で本当に動く条文**(高リスク部分は延期されたが、Article 50 は予定通り)。

**条文(一次資料の verbatim 引用、WebSearch 経由スニペット)**:

- **Article 50(1)**: "Providers shall ensure that AI systems intended to interact directly with natural persons are designed and developed in such a way that the natural persons concerned are informed that they are interacting with an AI system, unless this is obvious from the point of view of a natural person who is reasonably well-informed, observant and circumspect, taking into account the circumstances and the context of use."
- **Article 50(2)**: "Providers of AI systems, including general-purpose AI systems, generating synthetic audio, image, video or text content, shall ensure that the outputs of the AI system are marked in a machine-readable format and detectable as artificially generated or manipulated."
- **Article 50(4)**: "Deployers of an AI system that generates or manipulates text which is published with the purpose of informing the public on matters of public interest shall disclose that the text has been artificially generated or manipulated." + deepfake 画像/音声/動画開示
- **Article 50(5)**: 情報提供は "in a clear and distinguishable manner at the latest at the time of the first interaction or exposure"

出典: [Article 50 - Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-50)、[Inside Global Tech: 10 Takeaways on Draft Guidelines (2026-05-12)](https://www.insideglobaltech.com/2026/05/12/10-takeaways-european-commission-draft-guidelines-on-ai-transparency-under-the-eu-ai-act/)、アクセス 2026-05-20

**2026-05-08 公表の Commission Draft Article 50 Guidelines(パブコメ 2026-06-03 まで)— agentic AI 関連の最重要パラグラフ**:

> "Agentic AI systems fall within the scope of Article 50(1) where they are designed to interact with the persons instructing them or with other natural persons, and where the provider cannot reliably determine whether the AI agent will interact with a natural person, **the agent should be instructed to disclose itself as an AI system in every situation where such interaction is likely**."

出典: [Bird & Bird: Reading the Commission's Draft Article 50 Guidelines (2026)](https://www.twobirds.com/en/insights/2026/taking-the-eu-ai-act-to-practice-reading-the-commissions-draft-article-50-guidelines)(WebFetch 403、WebSearch snippet 経由)、[Inside Global Tech 10 Takeaways](https://www.insideglobaltech.com/2026/05/12/10-takeaways-european-commission-draft-guidelines-on-ai-transparency-under-the-eu-ai-act/)、アクセス 2026-05-20

**弁護士見解(Bird & Bird)**: "shift from 'disclose where interaction is certain' to **'disclose where interaction is plausible'**, which is a meaningful expansion for autonomous browsing, scheduling and outreach agents"。これは agentic AI への規制 surface の **静かな拡大**。

**KYA Project への含意**: Article 50(1) は **agent が自分の AI 性を開示する** ことを義務化するが、**「どの agent か(unique identity)」「誰の delegation で動いているか」は要求していない**。ここに **KYA Layer の戦略的余白** がある。逆に Article 50 が "machine-readable disclosure" を要求(Art. 50(2) は audio/image/video/text の machine-readable mark を明示)→ **KYA Layer の agent attestation は Article 50(2) compliance の自然な拡張として売れる**。

#### サブ論点 4: Article 51-55(GPAI systemic risk)— autonomous capability への言及

**条文**:

- **Article 51(1)(a)**: GPAI モデルが systemic risk に分類される閾値 = **10^25 FLOP** で訓練された "high-impact capabilities"
- **Article 51(1)(b)**: AI Office が "equivalent capabilities or impact" と認定した場合も該当
- **Article 55**: systemic risk GPAI provider の追加義務(モデル評価、systemic risk 評価・軽減、重大事故報告、サイバーセキュリティ)

出典: [Article 51 - Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-51)、[Article 55 - Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-55)、アクセス 2026-05-20

**EU AI Office 公式見解(2025-2026)**:

> "Factors like the level of autonomy or tool use of the model can be decisive in the designation of the model as a model with systemic risk, and providers of GPAI models with systemic risk are subject to risk management obligations regarding the **model's autonomous capabilities and its agentic use**."

出典: [European Commission - General-Purpose AI Models Q&A](https://digital-strategy.ec.europa.eu/en/faqs/general-purpose-ai-models-ai-act-questions-answers)、アクセス 2026-05-20

→ **AI Office は "agentic use" を systemic risk 判定要因として明示的に組み込み済み**。これは GPT-4 / Claude 4 級の foundation model provider への義務であり、KYA Project が直接 provider になる訳ではないが、**KYA Layer は GPAI provider が Art. 55 systemic risk 軽減義務を満たすためのツールとして売れる**(推定、確度: 中)。

#### サブ論点 5: EU AI Office Code of Practice for GPAI(2025-07-10 final)

**公表日**: 2025-07-10、3 章構成(Transparency / Copyright / Safety and Security)。Safety and Security 章は Art. 55 systemic risk GPAI のみ対象。

出典: [General-Purpose AI Code of Practice](https://digital-strategy.ec.europa.eu/en/policies/contents-code-gpai)、[Code of Practice Press Release 2025-07-10](https://ec.europa.eu/commission/presscorner/detail/en/ip_25_1787)、[Latham & Watkins: EU AI Act GPAI Model Obligations](https://www.lw.com/en/insights/eu-ai-act-gpai-model-obligations-in-force-and-final-gpai-code-of-practice-in-place)、アクセス 2026-05-20

**Agent identity への直接言及**: 検索結果からは **直接的な "agent identity" 言及は確認できず**(WebFetch 403 のため Safety chapter の全文 verbatim 確認は未完。W3 で要再確認)。ただし Safety chapter は "model's autonomous capabilities and its agentic use" を risk management 対象として扱う。

#### サブ論点 6: AMLR(Regulation (EU) 2024/1624)— Agent transact 時の AML/CFT

**適用日**: 2027-07-10。直接適用 Regulation(国内法化不要)。

出典: [EUR-Lex AMLR 2024/1624](https://eur-lex.europa.eu/eli/reg/2024/1624/oj/eng)、[DLA Piper: New EU AML Rules](https://www.dlapiper.com/en/insights/publications/2024/12/the-new-anti-money-laundering-rules-what-you-need-to-know)、アクセス 2026-05-20

**重要ポイント**:
- 全 **crypto-asset service provider(CASP、MiCA 認可下)** が "obliged entity" 化
- **CDD 閾値**: 通常 €10,000 / **CASP は €1,000 / €1,000 未満でも顧客識別と verification 必須**
- AMLA(新設)が RTS(regulatory technical standards)を整備

**Agent への当てはめ(これが KYA Project にとって極めて重要)**:
- 法文上の "agent autonomous identification" 明示なし(WebSearch で確認)
- しかし agent が CASP のサービスを使って transact する場合、**CASP は agent ではなく実質的支配者(beneficial owner)= 人間ユーザーの KYC を実施する義務**
- → **agent の delegation chain を技術的に証明できないと、CASP は agent 経由の transaction を拒否せざるを得なくなる**(推定)
- → **KYA Layer = AMLR compliance を可能にする技術的前提**

弁護士見解(Deloitte Legal、DLA Piper)は agent 個別の KYC 義務までは踏み込んでおらず、現時点では beneficial owner = 人間 を identify する従来枠組みで処理する解釈が主流(推定、確度: 中)。AMLA が 2027 RTS で agent 特化ルールを出す可能性は高い(推定、確度: 中)。

#### サブ論点 7: PSD3 / PSR — Agent payments の SCA / delegation

**ステータス(2026-05-20 時点)**: 2025-11-27 暫定政治合意、2026 Q2-Q3 Official Journal 公表予定、+18-21 ヶ月後適用 = **2027 Q4 - 2028 Q3 適用見込み**

出典: [Norton Rose Fulbright: PSD3 and PSR 2026 readiness](https://www.nortonrosefulbright.com/en/knowledge/publications/cedd39c6/psd3-and-psr-from-provisional-agreement-to-2026-readiness)、[DLA Piper: PSD3 and PSR Proposed Reforms](https://www.dlapiper.com/en/insights/publications/2026/03/psd3-and-psr)、アクセス 2026-05-20

**Agent payments への含意**:
- **SCA は mandate set-up 時に 1 回適用、その後の MIT(Merchant-Initiated Transactions)では不要** — これは agent commerce の基本パターン("人間が agent に上限・期間付き mandate を与える → agent が反復取引")と整合
- PSP が SCA を第三者(digital wallet / payment gateway)に **delegate** する場合は outsourcing 扱い、EBA outsourcing guidelines + DORA 適用、**delegating PSP は SCA failure の full liability を保持**、契約・監査権必須
- → **KYA Layer が "SCA delegation の third party" として位置取る** ことは技術的に可能だが、PSP との契約・監査権・liability 引き受け設計が必要(これは Hosted Backend モデルに寄る → ノンカストディ前提と緊張、`decision-doc.md` §2 の論点)

#### サブ論点 8: eIDAS 2.0 / EUDI Wallet — Agent identity attestation の準備

**法源**: [Regulation (EU) 2024/1183](https://eur-lex.europa.eu/eli/reg/2024/1183/oj/eng)、2024-05-20 発効、EUDI Wallet 全加盟国提供義務 2026-12 まで、SCA acceptance for financial 2027-12 まで(Article 5f(2))

**Agent / delegation 関連**:
- **Article 5a(5)(f)**: eID が "natural person representing the natural or legal person" を attestation できる可能性に言及。**しかし現行 ARF(Architecture Reference Framework)は delegation 要件を未定義** — "no cross-border legal framework for mutual recognition of powers and mandates" として後送り([eIDAS implementing acts](https://www.entrust.com/resources/learn/eidas-implementing-acts)、アクセス 2026-05-20)
- **ARF v2.8.0(2026 iteration)**: 15 トピック中、representation and delegation は **「次バージョンで検討」扱いの未確定領域**

出典: [EUDI ARF docs](https://eudi.dev/1.4.0/annexes/annex-2/annex-2-high-level-requirements/)、[EU Digital Identity Wallet ARF GitHub](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework)、アクセス 2026-05-20

**KYA Project への戦略的含意(最重要)**:
- **EUDI Wallet は 2026-12 までに「人間用」が出る**。**「agent 用 / delegation 用」は 2027-2028 に持ち越し**
- → **2026-Q4 から 2027-Q4 までの「EUDI Wallet では agent delegation を解けない期間」が KYA Layer の独占可能期間**(推定、確度: 中-高)
- → KYA Layer が ARF の "next version" に技術的入力(reference implementation、IETF/W3C 標準提案)を行えば、**eIDAS 2.0 delegation spec の事実標準を取りに行ける**

### 2.4 EU AI Act の構造的ギャップ(KYA に決定的に有利)

**TechPolicy.Press / arXiv / European Law Blog の共通結論**:

> "The EU AI Act contains **no definition of 'agentic systems'**, and neither the 113 articles nor the recitals address autonomous tool usage by AI systems."

出典: [TechPolicy.Press: The EU AI Act is Not Ready for Agents](https://www.techpolicy.press/the-eu-ai-act-is-not-ready-for-agents/)、[Agentic Tool Sovereignty - European Law Blog](https://www.europeanlawblog.eu/pub/dq249o3c)、[arXiv: AI Agents Under EU Law (2604.04604)](https://arxiv.org/abs/2604.04604)、アクセス 2026-05-20

**具体的なギャップ**:

1. **Provider / Deployer の二分法が壊れる**: agent が runtime で tool を選ぶと、provider・deployer・tool supplier の責任分界が曖昧化
2. **Recital 88 は tool supplier の協力を encourage するのみで binding obligation を作らない**
3. **Article 25(4)** は pre-established な provider-supplier 関係のみ contractual 要求 → **ephemeral な runtime tool selection には対応せず**
4. **delegation chain の audit を強制する条文がない**

**TechPolicy.Press の結論引用**:
> "Web Bot Auth tells you which company operates a bot; x402 identifies which specific user authorized that bot to act on their behalf. The wallet signature demonstrates **explicit delegation – a clear chain of authorization that matters for legal accountability**."

→ **これが KYA Project が埋める正にその空隙**。AI Act がカバーしない部分を KYA Layer が技術標準化する。

---

## 3. 比較表(EU 単一法域、時系列マトリクス)

| 時期 | 適用される義務 | Agent identity 義務化度 | KYA への影響 |
|------|----------------|------------------------|--------------|
| **現状(2026-05)** | AI Act Art. 5 禁止行為 + Art. 51-55 GPAI(罰則は 2026-08 から) | ほぼ無 | 市場形成期、KYA は voluntary best practice として売り込み可 |
| **2026-08-02 施行後** | + Art. 50 transparency(agentic AI 含む)、Art. 99 罰則、AI Office 執行権 | 弱(transparency のみ) | KYA は Art. 50(2) machine-readable disclosure の自然な拡張 |
| **2027-07-10 AMLR 施行後** | + 全 CASP の CDD €1,000 義務 | 中(間接、delegation 証明の事実上の必要) | KYA Layer が AMLR compliance の技術的前提に。 **追い風加速** |
| **2027-12-02 高リスク AI 義務(暫定)** | + Art. 14 human oversight、Art. 26 logs 6ヶ月、Art. 16 provider QMS | 中-強(autonomy proportional oversight + audit log) | 金融 / 保険 / 与信 agent は KYA Layer 必須化に近づく |
| **2027-12 / 2028 PSD3/PSR 施行** | + SCA mandate set-up、PSR delegation rules | 中-強(payment 領域) | KYA = SCA delegation の third party trust layer として位置取り可 |
| **2028-08-02 製品組込 AI(暫定)** | + 規制製品組込型高リスク AI 全義務 | 強 | KYA Layer は規制 product への組込 SDK として展開 |

---

## 4. 「抜け道」分析(KYA Project の視点)

### 4.1 KYA が直面する規制負荷の見積

KYA Project 自体は **L3 = Identity / Compliance Layer の SDK / トラスト基盤** 提供者。

| KYA Project の役割解釈 | AI Act 上の地位 | 義務負荷 |
|------------------------|------------------|----------|
| (A) AI Act の "provider"(AI system を market に出す) | Art. 16 provider 義務全部 | **重い**(QMS、CE marking、conformity assessment) |
| (B) AI Act の "deployer" | Art. 26 deployer 義務 | 中(logs、human oversight、FRIA) |
| (C) 規制対象外(infrastructure / attribute attestation provider) | 直接適用なし | **ほぼ無** |
| (D) eIDAS 2.0 の Qualified Trust Service Provider | eIDAS QTSP 認証取得義務 | 重(取得すれば法的高信頼) |

**推奨スタンス(暫定)**: **(C) を主軸 + (D) を将来オプション**。
- KYA は AI system 本体ではなく "identity attestation infrastructure" として設計 → AI Act 6 章の provider 義務を直接負わない
- 顧客(provider / deployer)が AI Act compliance を満たすための **道具** を提供
- eIDAS QTSP 取得は段階的(Phase 2 以降)

これは Track B README §1 の仮説「ノンカストディ型の自己責任ニュアンスで潜る」と整合([tracks/B-regulations/README.md](/home/user/KYA-Project/tracks/B-regulations/README.md))。

### 4.2 リスク要因

1. **AI Act provider 認定リスク**: KYA SDK が "AI system" の一部として再解釈されると Art. 16 義務が降ってくる(確度: 低-中、影響: 大)。対策: SDK の機能境界を明確化、AI 機能を一切持たない identity layer として設計
2. **AMLR の "obliged entity" 拡大リスク**: 2027 AMLA RTS で agent identity provider が obliged entity 化される可能性(確度: 低、影響: 大)。対策: 監視継続、業界団体ロビー
3. **eIDAS QTSP 強制リスク**: agent attestation が "qualified" 必須になると非 QTSP は市場から排除(確度: 低、影響: 中)。対策: ARF 議論に技術的入力で早期コミット
4. **2026-08 施行延期が再延期される / 巻き戻されるリスク**: 高リスク AI 義務の正式延期がまだ Official Journal 未公表。2026-08 までに採択されないと混乱(確度: 中、影響: 中)。対策: 両シナリオで戦略不変なよう設計
5. **延期で時間圧力が緩むリスク**: 顧客が "義務化までまだ 1 年半ある" と購買を遅らせる(確度: 高、影響: 中)。対策: voluntary best practice + AMLR 2027 強制を売り込みの中心に

### 4.3 推奨スタンス(KYA Project として)

- **核となる主張**: "KYA Layer は AI system ではない identity attestation infrastructure。AI Act の provider 義務は負わない。顧客の AI Act compliance を可能にする"
- **法的根拠の固め方**: Art. 3 "AI system" 定義の精読 + 弁護士確認(Phase 1)
- **明確な outside 範囲**: KYA Layer は agent の意思決定を行わない、推論を行わない、機械学習モデルを動かさない、attestation の発行と検証のみ

---

## 5. 戦略的含意(KYA Project への影響)

### 5.1 結論: AI Act は agent identity を **間接的かつ重層的** に必須化する

**KYA Project の核仮説(L3 = Multi-cloud Agent Identity & Compliance Layer)に対する影響**: **強い追い風**(条件付き)。

理由:
1. AI Act 単独では agent identity の明示義務はないが、**Art. 50(1) + Art. 14 + Art. 26 + Art. 55** の重層効果で **delegation chain audit + agent identifier は事実上の compliance ベストプラクティス**
2. **2027-07 AMLR 施行で CASP の CDD €1,000 義務が降ってくる** → agent 経由 transaction の trace 必要性が技術的に必須化
3. **EUDI Wallet は agent / delegation 領域が 2027-2028 まで空白** → **2026-Q4 から 2027-Q4 までの 1 年が KYA Layer の独占的市場形成期間**(推定、確度: 中-高)
4. **AI Act の構造的ギャップ(agentic / delegation を想定していない)** が KYA Project の市場機会の **法的・技術的根拠**

### 5.2 法人設立国(decision-doc.md §1)への含意

EU 法人設立は **慎重要検討**。理由:

- AI Act provider 義務(Art. 16)/ AMLR obliged entity / eIDAS QTSP が EU 法人に降りやすい
- 一方、EU 法人なら EU 単一市場・EUDI Wallet エコシステムへの早期参画可能
- **暫定推奨**: 初期は **EU 域外法人(日本 / シンガポール / UAE)から EU 顧客にサービス提供する形** で AI Act の地理的射程(Art. 2 を W3 で精査要)を慎重に取り扱う。EUDI Wallet 統合フェーズで初めて EU 子会社設立を検討
- 確度: 暫定見立て、Phase 1 で弁護士確認必須

### 5.3 ビジネスモデル(decision-doc.md §2)への含意

- **Model 1(SDK ライセンス)+ Model 3(Conformance Test / Certification)が AI Act 2026-08 施行と最も親和的**
- Model 2(Hosted Backend)は PSD3/PSR の SCA delegation outsourcing 規制で **liability 引き受けと audit 権** の組み込みが必要 → コスト増・ノンカストディ前提と緊張
- Model 4(Insurance Layer 代理店)は Annex III 5(c) 該当(保険)で高リスク AI 化 → 重い義務、要回避または特化

### 5.4 技術アーキテクチャ(decision-doc.md §3)への含意

- **eIDAS 2.0 互換の VC + SD-JWT / mDoc 形式** で attestation を発行することで EU 市場で標準準拠を主張可
- **W3C VC + EUDI ARF mDoc の dual format** を Phase 1 から組み込む(現行 ARF v2.8.0 への適合性確認)
- **Art. 50(2) machine-readable disclosure と KYA agent identifier の統合**: agent が自己開示する時に同時に attestation hash も提示できる設計

### 5.5 時間圧力(decision-doc.md §5、Path 選択)への含意

- AI Act 高リスク義務の **2027-12-02 延期(暫定)** で時間圧力が **約 16 ヶ月緩む**
- しかし **AMLR 2027-07-10、PSD3/PSR 2027-Q4-2028、EUDI Wallet 2026-12** は変わらない → **複合的な「2026-Q4 → 2027-Q4 の 1 年」が KYA 市場形成の決定期間**
- **6-12 ヶ月の戦略 window**(decision-doc.md §0)は **延期で 12-18 ヶ月に拡大** という解釈が成り立つ(推定、確度: 中)
- → Path C(Hybrid)で動ける余裕が出る可能性、ただし AWS 後出しリスクは変わらず

### 5.6 新規追加リスク(decision-doc.md §6)

- **AI Act 構造的ギャップ閉鎖リスク**: EU が agentic AI 専用の AI Act 修正案 / 追加 Regulation を出すと "KYA Layer が技術標準を取りに行く" 戦略が無効化(確度: 低-中、影響: 大)。Watch: Commission の "Targeted Amendments on Agentic AI" 公表動向、AI Office speeches
- **AMLA RTS で agent identity が QTSP 必須化されるリスク**: 2027 RTS 整備で eIDAS QTSP 取得が事実上の必須要件化(確度: 低、影響: 大)
- **施行延期再延期 / 巻き戻しリスク**: Omnibus 暫定合意が 2026-08 までに正式採択されないと混乱、再延期や巻き戻し(確度: 中、影響: 中)

---

## 6. 主要発見(エグゼクティブ向けサマリ)

1. **AI Act 単独では agent identity 明示義務なし** — 113 articles + recitals に "agentic AI" 定義語自体が存在しない(TechPolicy.Press、European Law Blog の共通結論)
2. **2026-08-02 で本当に動くのは Article 50 transparency のみ** — 高リスク義務(Art. 6-29)は **2027-12-02 へ延期**(Omnibus 暫定合意 2026-05-07、Official Journal 未公表)
3. **Art. 50 Draft Guidelines(2026-05-08)で agentic AI に "plausible interaction" 開示義務を拡大** — autonomous browsing / scheduling / outreach agent への規制 surface が静かに拡大(Bird & Bird 指摘)
4. **EUDI Wallet は agent / delegation 領域を 2026-12 時点で未定義のまま** — ARF v2.8.0 で "next version" 送り。**2026-Q4 から 2027-Q4 までの 1 年が KYA Layer の独占的市場形成期間**(推定)
5. **重層効果(AI Act + AMLR 2027 + PSD3/PSR + eIDAS 2.0)で 2027-2028 までに事実上の KYA 必須化**(推定、確度: 中-高)

---

## 7. ソース

### 一次資料(EU 法・条文)

- [Regulation (EU) 2024/1689 (AI Act) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/1689/oj/eng) — WebFetch 403、条文 verbatim は AI Act Service Desk 経由
- [Article 50: Transparency obligations - AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-50)
- [Article 14: Human oversight - AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-14)
- [Article 16: Obligations of providers - AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-16)
- [Article 26: Obligations of deployers - AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-26)
- [Article 51: GPAI systemic risk classification - AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-51)
- [Article 55: Obligations for GPAI with systemic risk - AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-55)
- [Article 113: Entry into force and application - AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-113)
- [Annex III - AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/annex-3)
- [Regulation (EU) 2024/1183 (eIDAS 2.0) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/1183/oj/eng)
- [Regulation (EU) 2024/1624 (AMLR) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/1624/oj/eng)

### Commission / AI Office ガイダンス・声明

- [General-Purpose AI Code of Practice - Final 2025-07-10](https://digital-strategy.ec.europa.eu/en/policies/contents-code-gpai)
- [Code of Practice Press Release 2025-07-10](https://ec.europa.eu/commission/presscorner/detail/en/ip_25_1787)
- [Draft Guidelines on Article 50 (consultation 2026-05-08 to 2026-06-03)](https://digital-strategy.ec.europa.eu/en/faqs/guidelines-and-code-practice-transparent-ai-systems)
- [Council and Parliament agree to simplify and streamline AI Act rules (2026-05-07)](https://www.consilium.europa.eu/en/press/press-releases/2026/05/07/artificial-intelligence-council-and-parliament-agree-to-simplify-and-streamline-rules/)
- [Joint Statement by EVP Virkkunen and Commissioner Šefčovič](https://ec.europa.eu/commission/presscorner/detail/en/statement_25_255)
- [General-Purpose AI Models in the AI Act – Q&A](https://digital-strategy.ec.europa.eu/en/faqs/general-purpose-ai-models-ai-act-questions-answers)

### eIDAS 2.0 / EUDI Wallet 技術資料

- [EUDI Wallet Architecture and Reference Framework](https://eudi.dev/1.4.0/annexes/annex-2/annex-2-high-level-requirements/)
- [EUDI Wallet ARF GitHub repository](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework)
- [eIDAS Implementing Acts - Entrust](https://www.entrust.com/resources/learn/eidas-implementing-acts)

### 二次資料(法律事務所クライアントアラート)

- [Bird & Bird: Reading the Commission's Draft Article 50 Guidelines (2026)](https://www.twobirds.com/en/insights/2026/taking-the-eu-ai-act-to-practice-reading-the-commissions-draft-article-50-guidelines) — WebFetch 403、WebSearch snippet 経由
- [Bird & Bird: Draft High-Risk AI Guidelines First Read (2026)](https://www.twobirds.com/en/insights/2026/the-commission's-draft-high-risk-ai-guidelines-under-the-eu-ai-act-a-first-read)
- [Bird & Bird: Draft Transparency Code of Practice (2026)](https://www.twobirds.com/en/insights/2026/taking-the-eu-ai-act-to-practice-understanding-the-draft-transparency-code-of-practice)
- [Hogan Lovells: AI regulation in financial services - layered regulatory landscape](https://www.hoganlovells.com/en/publications/ai-regulation-in-financial-services-navigating-the-eu-ai-act-in-a-layered-regulatory-landscape) — WebFetch 403、WebSearch snippet 経由
- [Clifford Chance: The EU AI Act Overview of Key Rules and Requirements](https://www.cliffordchance.com/content/dam/cliffordchance/PDFDocuments/the-eu-ai-act-overview.pdf)
- [Latham & Watkins: EU AI Act GPAI Model Obligations](https://www.lw.com/en/insights/eu-ai-act-gpai-model-obligations-in-force-and-final-gpai-code-of-practice-in-place)
- [DLA Piper: New EU AML Rules](https://www.dlapiper.com/en/insights/publications/2024/12/the-new-anti-money-laundering-rules-what-you-need-to-know)
- [DLA Piper: PSD3 and PSR Proposed Reforms (2026-03)](https://www.dlapiper.com/en/insights/publications/2026/03/psd3-and-psr)
- [DLA Piper: The Digital AI Omnibus Proposed Deferral](https://knowledge.dlapiper.com/dlapiperknowledge/globalemploymentlatestdevelopments/2026/The-Digital-AI-Omnibus-Proposed-deferral-of-high-risk-AI-obligations-under-the-AI-Act)
- [Jones Day: EU AI Act GPAI Code of Practice](https://www.jonesday.com/en/insights/2025/08/eu-ai-act-european-commission-publishes-generalpurpose-ai-code-of-practice)
- [Norton Rose Fulbright: PSD3 and PSR 2026 readiness](https://www.nortonrosefulbright.com/en/knowledge/publications/cedd39c6/psd3-and-psr-from-provisional-agreement-to-2026-readiness)
- [Travers Smith: EU agrees to delay key AI Act compliance deadlines](https://www.traverssmith.com/knowledge/knowledge-container/eu-agrees-to-delay-key-ai-act-compliance-deadlines/)
- [Pinsent Masons: Rules on high-risk AI to be delayed under EU omnibus deal](https://www.pinsentmasons.com/out-law/news/rules-high-risk-ai-delayed-under-eu-omnibus-deal)
- [Holland & Knight: US Companies Face EU AI Act Possible August 2026 Compliance Deadline](https://www.hklaw.com/en/insights/publications/2026/04/us-companies-face-eu-ai-acts-possible-august-2026-compliance-deadline)
- [Inside Global Tech: 10 Takeaways on Draft Article 50 Guidelines (2026-05-12)](https://www.insideglobaltech.com/2026/05/12/10-takeaways-european-commission-draft-guidelines-on-ai-transparency-under-the-eu-ai-act/)
- [Pearl Cohen: New Guidance under EU AI Act Ahead of Next Enforcement Date](https://www.pearlcohen.com/new-guidance-under-the-eu-ai-act-ahead-of-its-next-enforcement-date/)
- [Hunton: Commission Releases Draft Guidelines on High-Risk AI](https://www.hunton.com/privacy-and-cybersecurity-law-blog/european-commission-releases-draft-guidelines-on-high-risk-ai-under-the-eu-ai-act)

### 業界・研究レポート

- [TechPolicy.Press: The EU AI Act is Not Ready for Agents](https://www.techpolicy.press/the-eu-ai-act-is-not-ready-for-agents/)
- [TechPolicy.Press: EU AI Act Delays Let High-Risk Systems Dodge Oversight](https://www.techpolicy.press/eus-ai-act-delays-let-highrisk-systems-dodge-oversight/)
- [TechPolicy.Press: What the EU AI Omnibus Deal Changes](https://www.techpolicy.press/what-the-eu-ai-omnibus-deal-changes-for-the-ai-act-and-what-lies-ahead/)
- [European Law Blog: Agentic Tool Sovereignty](https://www.europeanlawblog.eu/pub/dq249o3c)
- [arXiv 2604.04604: AI Agents Under EU Law](https://arxiv.org/abs/2604.04604)
- [arXiv 2603.26983: Transparency as Architecture - Structural Gaps in Article 50](https://arxiv.org/pdf/2603.26983)
- [Edgar Dunn: EU AI Act and Agentic Commerce](https://www.edgardunn.com/articles/the-new-rules-for-ai-inside-the-eus-bold-legislation)
- [Knowlee: EU AI Act for Financial Services Annex III Obligations](https://www.knowlee.ai/blog/ai-act-financial-services-compliance)
- [Alchemy Crew: Europe's Agentic Future - Directive Blueprint for AI-Powered Payments](https://www.alchemycrew.ventures/blog/europe-s-agentic-future-a-directive-blueprint-for-ai-powered-payments-and-commerce) — WebFetch 403
- [Finextra: EU AI Act's August 2026 Deadline for Financial Services](https://www.finextra.com/blogposting/31653/the-eu-ai-acts-august-2026-deadline-what-financial-services-firms-must-do-now)
- [IAPP: EU AI Act deployer evidence gaps SMEs will miss before 2 Aug 2026](https://iapp.org/news/a/eu-ai-act-deployer-evidence-gaps-smes-will-miss-before-2-aug-2026)

---

## 8. W3 以降の深掘り項目

- [ ] AI Act Service Desk 経由で Art. 3 "AI system" 定義 / Art. 2 territorial scope を verbatim 確認
- [ ] AI Act Service Desk 経由で Annex III 8 カテゴリ全てを verbatim 確認(現状 5(b)、5(c) のみ確認済)
- [ ] GPAI Code of Practice "Safety and Security" chapter で agent identity / autonomous capability 関連を full text 確認(現状 WebFetch 403 で外部要約のみ)
- [ ] EUDI Wallet ARF GitHub の discussion-topics(2026 iteration 15 トピック)で representation/delegation トピックの議事録精読
- [ ] AMLA(AML Authority)の 2027 RTS ドラフトが出た時点で agent identity 関連を再評価
- [ ] PSD3/PSR の Official Journal 公表(2026-Q2-Q3 予定)で SCA delegation 条文を verbatim 確認
- [ ] 弁護士確認: KYA SDK が Art. 3 "AI system" 定義に該当しないか、Art. 25 "downstream provider" にならないか(Phase 1 で実施)
- [ ] US(FinCEN / NIST AI RMF / SEC AI Act 等)、JP(AI 推進法、金融庁 AI ガバナンス検討会)で同様の整理を別ファイルで作成

---

## 9. 注意・免責

- 本ドキュメントは **法律意見ではない**。リサーチドキュメント。最終判断は弁護士確認必須。
- EUR-Lex / artificialintelligenceact.eu / Council / Bird&Bird / Hogan Lovells など主要一次・二次資料サイトが WebFetch では 403 で取得できず、WebSearch スニペット経由で確認。条文 verbatim 引用は AI Act Service Desk 経由のスニペットによる。条文番号と paragraph 構造は AI Act Service Desk と複数 secondary source でクロスチェック済だが、**critical な決定の前にコタさんが EUR-Lex で原文確認すること推奨**。
- "暫定合意" "推定" "確度: 中" 等の表記は意図的に使用。確定情報と推定を区別している。
- Omnibus 暫定合意(2026-05-07)の正式採択・OJ 公表前であり、**高リスク AI 義務の 2026-08 施行 / 2027-12 延期 の両シナリオ** で戦略不変なように decision-doc.md を組むこと推奨。
