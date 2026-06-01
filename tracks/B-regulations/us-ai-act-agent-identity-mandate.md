---
topic: US 側の Agent Identity / KYA 相当義務 — 連邦(NIST/SEC/FTC/FinCEN/CFPB/OCC-Fed-FDIC)+ 州(CO/CA/TX/NY/NYC)二層構造マッピング
slug: us-ai-act-agent-identity-mandate
last_updated: 2026-06-01
jurisdictions: [US-Federal, US-CA, US-CO, US-TX, US-NY, US-NYC]
relevance_to_kya: high
status: draft
disclaimer: これは法律意見ではない。リサーチドキュメント。最終判断は弁護士確認必須。
---

# 論点: US で Agent Identity / KYA 相当の義務を課す規制はあるか

## TL;DR(結論先出し)

| 設問 | 答え | 根拠条文・出典 |
|------|------|----------------|
| US 連邦法で **agent identity を明示的に義務化** する規制はあるか? | **No(明示義務なし、2026-06 時点)** | NIST AI RMF / AI 600-1 は voluntary、SR 26-2 は agentic AI を **明示的にスコープ外**、SEC PDA Proposal は **撤回済**(Atkins SEC) |
| **間接的に同等の義務** を課す連邦規制はあるか? | **Yes(グレー寄り Yes、Section 5 + GENIUS Act + 金融セクター個別)** | FTC Section 5 + Operation AI Comply、GENIUS Act の BSA/KYC、FinCEN FIN-2019-G001 + Travel Rule(31 CFR 1010.410(f))、CFPB ECOA AI adverse action、SEC Marketing Rule |
| **州 AI 法で agent identity 義務化** はあるか? | **部分的 Yes(高リスク AI 枠で間接、ただし Trump EO が preemption 攻撃中)** | CO SB 26-189(2027-01-01)、CA SB 53 / AB 2013、TX TRAIGA HB 149(2026-01-01)、NY RAISE Act(2027-01-01)、NYC Local Law 144 |
| **2026-06 時点で本当に動いている規制** は? | **FTC Section 5 + CA AB 2013 + NYC Local Law 144 + TX TRAIGA + FinCEN MTL + GENIUS Act の段階施行** | 後述 §2.1 タイムライン |
| **2026 政権下の規制方向性** は? | **連邦 light-touch + state preemption 攻撃 + 個別執行(FTC Section 5)で押す** | 12/11/2025 Trump EO、3/11/2026 FTC AI Policy Statement、3/20/2026 National AI Legislative Framework |
| KYA Project が US 顧客向けに提供する場合、**必要な attestation** は? | **5 件**(後述 §5.4): (1) FTC Section 5 deceptive 回避(AI 性開示)、(2) FinCEN BSA 上のノンカスト宣言、(3) SEC Marketing Rule、(4) GENIUS Act 上の non-issuer 明示、(5) 州法横断 high-risk 非該当 declaration |

**1 行で**: US 連邦は AI agent identity を **明示的に義務化していない**。Trump 政権は preemption + light-touch で **意図的に州レベルの上書き** を狙う(2025-12 EO、2026-03 立法 framework)。しかし **個別執行(FTC Section 5)+ 金融セクター個別(GENIUS / BSA / SEC Marketing)+ Tornado Cash 判例(2025-08)による刑事リスク** が層として残り、**事実上の KYA 必要性は高い**(推定、確度: 中-高)。EU と異なり「義務化される条文」ではなく「**訴追・執行を避けるための事実上のベストプラクティス**」として KYA が必要。

---

## 1. 論点の定義

**問い**: AI Agent が API・他 Agent・人間に対して自律的に支払いを行う時、US 連邦・州法は agent の身元(identity)、人間との binding、capability attestation、audit trail を **明示的に義務化** しているか?

**なぜ KYA に関係するか**:
- W2 確定戦略「**AWS x402 ecosystem 専用 KYA 実装 + 規制 attestation packaging specialist**」(`synthesis/decision-doc.md` §0)で、**US は AWS 本拠地 + 最大顧客市場**
- 連邦法人設立(デラウェア)候補(`decision-doc.md` §1)の規制負荷判定
- EU 側完了文書 `eu-ai-act-agent-identity-mandate.md` との比較で、**KYA が両法域でカバーすべき attestation スコープ** を確定する

**今回のスコープ**: US 単一法域(連邦 + 主要 4-5 州 + 1 市)。JP / UK / SG / UAE は別ファイルで W4-W6。

---

## 2. US 連邦規制マッピング(時系列で「現状 → Trump 政権下 → 2027 以降」)

### 2.1 適用法体系・タイムライン(2026-06-01 時点)

| 規制 | 略称 | 適用日 | KYA への関係 |
|------|------|--------|--------------|
| NIST AI Risk Management Framework 1.0 | **NIST AI RMF** | 2023-01-26 公表(voluntary) | Govern/Map/Measure/Manage、agentic AI への明示適用は **未** |
| NIST AI 600-1 Generative AI Profile | **NIST AI 600-1** | 2024-07-26 公表(voluntary) | 12 risk areas、agentic 未明示 |
| NIST AI Agent Standards Initiative(CAISI) | **NIST AI Agent IO Profile** | **2026-02-17 launch、Q4 2026 v1 release 予定** | **identity / authorization / monitoring / logging を扱う** — KYA の核論点 |
| FTC Section 5(15 USC §45) + Operation AI Comply | **FTC §5** | 1914-(継続)、AI Comply 2024-09 launch | 欺瞞的 AI 利用への執行根拠 |
| **FTC AI Policy Statement(2026-03-11)** | **FTC AI 2026** | **2026-03-11 公表** | Section 5 を AI 全 lifecycle に適用、agent 特化 |
| FinCEN FIN-2019-G001 | **FinCEN CVC** | 2019-05-09 公表 | unhosted wallet = non-money-transmitter、software-only 例外 |
| BSA Travel Rule(31 CFR §1010.410(f)) | **Travel Rule** | 1995-、$3,000 閾値、$250 改正案進行中 | agent 経由 transaction の reporting |
| GENIUS Act(S.1582) | **GENIUS** | **2025-07-18 制定、施行 = 最早2027-01-18 or 規則制定後 120 日** | stablecoin issuer BSA / KYC、agent 経由送金 |
| OCC/Fed/FDIC SR 26-2 | **SR 26-2** | **2026-04-17 公表** | model risk management、**agentic AI を明示的にスコープ外**、RFI 予定 |
| SEC 2026 Examination Priorities | **SEC Exam 2026** | 2025-10 公表 | AI 監督 / fiduciary / marketing claims |
| CFPB AI Compliance Plan M-25-21 | **CFPB AI** | 2025-09 公表(機能停止中) | adverse action、credit denial、ECOA 上の AI 利用 |
| Trump EO 14318 "Ensuring National AI Policy Framework" | **Trump AI EO 2025** | **2025-12-11 署名** | state AI law preemption、DOJ AI Litigation Task Force(2026-01-10 launch) |
| Trump National AI Legislative Framework | **AI Framework 2026** | **2026-03-20 公表** | 連邦 light-touch / state preemption の立法提案 |

### 2.2 サブ論点別の条文・ガイダンスマッピング

#### サブ論点 1: NIST AI RMF / AI 600-1 / AI Agent Standards Initiative

**NIST AI RMF 1.0(2023-01-26)**

- **4 functions(Govern / Map / Measure / Manage)** で AI risk を扱う voluntary 標準
- **agentic AI の明示な扱いはなし**(2023 当時 agent commerce が未定義)
- 連邦調達(FAR / DFARS)で **NIST AI RMF 準拠を必須化する明文規定は 2026-06 時点で未確認**(推定: 連邦機関の AI 利用は OMB M-24-10 / M-25-21 で governance 求めるが、CSP / SaaS への外部義務化は未)

出典:
- [NIST AI Risk Management Framework 1.0 - NIST](https://www.nist.gov/itl/ai-risk-management-framework)、アクセス 2026-06-01
- [NIST AI RMF Implementation Guide 2026](https://aisecurityandsafety.org/en/guides/nist-ai-rmf-guide/)、アクセス 2026-06-01

**NIST AI 600-1 Generative AI Profile(2024-07-26)**

- AI RMF を **GenAI に拡張**、12 リスク領域(hallucination、data leakage、copyright、bias、cybersecurity 等)
- **agentic AI / agent identity は明示扱いなし**(2024-07 当時の foundation model risk が焦点)

出典:
- [NIST AI 600-1 PDF (nvlpubs.nist.gov)](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf)、アクセス 2026-06-01
- [NIST AI 600-1 PointGuard summary](https://www.pointguardai.com/glossary/nist-ai-600-1)、アクセス 2026-06-01

**【最重要】NIST AI Agent Standards Initiative(2026-02-17 launch)**

これが本論点で **最も重要な発見**。NIST CAISI(Center for AI Standards and Innovation)が 2026-02-17 に正式 launch。

> "Mechanisms such as agent identity, oversight patterns, and multi-agent accountability reflect how AI is actually evolving."

> "The Initiative will ensure that the next generation of AI—AI agents capable of autonomous actions—is widely adopted with confidence, can function securely on behalf of its users, and can interoperate smoothly across the digital ecosystem."

**Q4 2026 release 予定の deliverable**:
1. **AI Agent Interoperability Profile v1**(A2A、MCP を baseline interoperability protocol として取り込み)
2. **AI Agent Test Suite**(評価メトリクス + reference dataset)
3. **voluntary guidelines for AI agents**: **identity and authorization**、**security and risk management**、**monitoring and logging** の 3 領域

これは **KYA Project の核論点と完全に重なる**。NIST が 937 件の RFI 公衆コメントを受けて identity / authorization を独立した workstream にしたという事実は、**「US 連邦は voluntary だが標準化の方向は agent identity 必須」** という強いシグナル。

出典(2026-02-17 NIST 公式発表):
- [Announcing the "AI Agent Standards Initiative" - NIST.gov](https://www.nist.gov/news-events/news/2026/02/announcing-ai-agent-standards-initiative-interoperable-and-secure)、アクセス 2026-06-01
- [NIST AI Agent Standards - Meta Intelligence summary](https://www.meta-intelligence.tech/en/insight-nist-agent-standards)、アクセス 2026-06-01
- [NIST AI Agent Standards Initiative - Jones Walker LLP analysis](https://www.joneswalker.com/en/insights/blogs/ai-law-blog/nists-ai-agent-standards-initiative-why-autonomous-ai-just-became-washingtons.html)、アクセス 2026-06-01
- [CSA NIST AI Agent Standards Research Note - 2026-04](https://labs.cloudsecurityalliance.org/research/csa-research-note-nist-ai-agent-standards-initiative-2026040/)、アクセス 2026-06-01

**第三者整理(CSA = Cloud Security Alliance、CLTC = UC Berkeley、Jones Walker)**:
- CSA "Agentic AI NIST RMF Profile v1"(2026 Q1 公表)が NIST 公式の Agent Profile 出る前の de facto standard 化
- CLTC(UC Berkeley)が "Agentic AI Risk-Management Standards Profile" を公表
- Jones Walker: **"NIST AI Agent Standards Initiative makes autonomous AI Washington's problem"** — 連邦政府が AI agent identity を **voluntary だが明示的に取り扱う始まり**

**KYA Project への含意**:
- NIST Q4 2026 v1 release は **KYA Project の OSS Bridge SDK release(2026-12 re:Invent target)と完全同期**
- **W3C CCG / DIF / IETF SCITT 標準化参加**(`decision-doc.md` §7)に加えて **NIST CAISI のパブコメ参加 / 関係者ヒアリング** を Phase 1 で実施推奨
- KYA = NIST AI Agent IO Profile の reference implementation として位置取れる

#### サブ論点 2: FTC Section 5 + Operation AI Comply + 2026-03-11 AI Policy Statement

**Section 5 of the FTC Act(15 USC §45)**: "Unfair or deceptive acts or practices in or affecting commerce... are hereby declared unlawful." — 1914 制定の condom 条文だが、**AI specific 立法を待たずに FTC が AI 全領域に適用** している。

**Operation AI Comply(2024-09 launch)**: 2025 年だけで **12+ cases**:

- **Workado**(2025-04): "AI Content Detector" の精度を 98% と広告、実際 53%
- **DoNotPay**: "world's first robot lawyer" 主張への執行(2024-09)
- **Growth Cave**(2026-01): "AI software GrowthBox" が 100% 自動化と虚偽広告
- **Air AI**(2026-03-24): "conversational AI" カスタマーサービス代替で $19M 詐取の deceptive earnings claims

出典:
- [FTC Artificial Intelligence page](https://www.ftc.gov/industry/technology/artificial-intelligence)、アクセス 2026-06-01
- [Benesch Law: Operation AI Comply One Year In](https://www.beneschlaw.com/insight/one-year-in-ftcs-operation-ai-comply-continues-under-new-administration-signaling-enduring-enforcement-focus/)、アクセス 2026-06-01
- [Lathrop GPM: Transparency and AI - FTC enforcement](https://www.lathropgpm.com/insights/transparency-and-ai-ftc-launches-enforcement-actions-against-businesses-promoting-deceptive-ai-product-claims/)、アクセス 2026-06-01
- [American Bar Association: Consumer Protection and FTC - Enforcing Section 5(a) in Age of AI (Winter 2026)](https://www.americanbar.org/groups/business_law/resources/business-lawyer/2026-winter/consumer-protection-ftc/)、アクセス 2026-06-01

**【最重要】FTC AI Policy Statement(2026-03-11)**

Trump 2025-12-11 EO の indirective に基づき、FTC が **2026-03-11 に Section 5 の AI 適用 policy statement** を公表:

> "interprets Section 5 of the FTC Act as applying directly to AI systems across their entire lifecycle and establishes the first federal enforcement framework for AI agents, automated decisions, and AI-generated content."

二つの矛盾するメッセージが内包:
1. **AI agents、automated decisions、AI-generated content への執行 framework を establish** → agent 関連 deceptive practice への執行を強化
2. **同時に、state-mandated bias mitigation を "per se deceptive" と分類** → state preemption の道具にする

出典:
- [FTC AI Policy Deadline March 11 - Digital Applied](https://www.digitalapplied.com/blog/ftc-ai-policy-deadline-march-11-compliance-readiness)、アクセス 2026-06-01
- [TechPolicy.Press: FTC's AI Preemption Authority is Limited](https://www.techpolicy.press/the-ftcs-ai-preemption-authority-is-limited/)、アクセス 2026-06-01
- [OpenClawAI: FTC AI Policy Statement Agent Enforcement Playbook](https://openclawai.io/blog/ftc-ai-policy-statement-agent-enforcement/)、アクセス 2026-06-01
- [Mintz: Emerging Federal AI Strategy - FTC Sets Aside Rytr Consent Order(2026-02-13)](https://www.mintz.com/insights-center/viewpoints/54731/2026-02-13-emerging-federal-ai-strategy-ftc-sets-aside-rytr)、アクセス 2026-06-01

**KYA Project への含意(極めて大きい)**:

- **AI agent が "deceptive" として執行されるリスクが連邦レベルで確立済み**。**agent が AI 性を開示しない / 誰の delegation で動くか不透明 / capability を過大表示** は Section 5 違反のリスク
- KYA Layer = **agent 開示 + delegation chain + capability attestation を技術的に強制する仕組み** → 顧客の Section 5 防御策として売れる
- ただし FTC 自身が state preemption の道具になっているため、KYA の "**EU-style 規制 attestation**" 売り込みは US では響きにくい。"**Section 5 deceptive 訴追リスク回避**" の角度で売る

#### サブ論点 3: FinCEN FIN-2019-G001 + Travel Rule + Tornado Cash 判例

**FinCEN FIN-2019-G001(2019-05-09)— 一次資料**:

> "An unhosted wallet... do not qualify as money transmitters as long as the person executing a transaction through the unhosted wallet is doing so to purchase goods or services on the user's own behalf."

> 該当パラグラフ §4.5.1(c): "Entities providing only software without asset custody are not subject to registration or BSA requirements applicable to money services businesses."

出典(一次資料 verbatim):
- [FinCEN Guidance FIN-2019-G001 PDF](https://www.fincen.gov/system/files/2019-05/FinCEN%20Guidance%20CVC%20FINAL%20508.pdf)、アクセス 2026-06-01
- [FinCEN CVC Guidance FINAL PDF (alt)](https://www.fincen.gov/system/files/2019-05/FinCEN%20CVC%20Guidance%20FINAL.pdf)、アクセス 2026-06-01

**31 CFR §1010.410(f)(BSA Travel Rule)**:

- 現行 threshold: $3,000(国内・国際 wire transfer)
- **FinCEN + Fed 2020 共同 NPRM** で **$250 に引き下げ** を提案 → 2026-04 PPSI-AMLCFT-NPRM(stablecoin に重点)で再活性化
- 適用対象: convertible virtual currency(CVC) = stablecoin を含む。"No exemption exists based on asset type"

出典:
- [eCFR 31 CFR 1010.410](https://www.ecfr.gov/current/title-31/subtitle-B/chapter-X/part-1010/subpart-D/section-1010.410)、アクセス 2026-06-01
- [FinCEN PPSI-AMLCFT-NPRM (2026-04)](https://www.fincen.gov/system/files/2026-04/PPSI-AMLCFT-NPRM.pdf)、アクセス 2026-06-01

**【極めて重要】Tornado Cash / Roman Storm 判決(2025-08-06)**

> "On August 6th, 2025, following a four-week trial, a jury found Roman Storm, the founder of Tornado Cash, guilty of conspiracy to operate an unlicensed money transmitting business."

> 検察側の主張: "FinCEN's 2019 guidance is nonbinding and irrelevant in criminal cases."

> 産業反応(Blockchain Association): "verdict is a dangerous precedent that misapplies money transmitter laws."

その後の動き:
- 2026-03-09: DOJ が deadlocked charges(共謀マネロン + sanction violation)で **retrial を申請、2026-10-05 or 10-12 開始予定**
- judge Failla が acquittal bid を保留中

出典:
- [Money Laundering Watch: Tornado Cash Jury Deadlocked](https://www.moneylaunderingnews.com/2025/08/tornado-cash-jury-deadlocked-on-most-serious-charges-but-convicted-founder-roman-storm-on-conspiracy-to-operate-an-unlicensed-money-transmitting-business/)、アクセス 2026-06-01
- [Money Laundering Watch: Prosecution of Samourai Wallet Developers(2025-12)](https://www.moneylaunderingnews.com/2025/12/the-prosecution-of-samourai-wallet-developers-expanding-the-reach-of-crypto-enforcement/)、アクセス 2026-06-01
- [Mayer Brown: Tornado Cash Trial's Mixed Verdict (2025-08)](https://www.mayerbrown.com/en/insights/publications/2025/08/the-tornado-cash-trials-mixed-verdict-implications-for-developer-liability)、アクセス 2026-06-01
- [Hodder Law: Roman Storm Verdict](https://hodder.law/roman-storm-tornado-cash-verdict-crypto-developers/)、アクセス 2026-06-01
- [Mondaq: When Code Becomes Conduct - Tornado Cash for DeFi](https://www.mondaq.com/fin-tech/1701562/when-code-becomes-conduct-what-the-tornado-cash-verdict-means-for-defi)、アクセス 2026-06-01
- [The Defiant: Tornado Cash Judge Ruling Acquittal Bid](https://thedefiant.io/news/regulation/tornado-cash-developer-roman-storm-awaits-judge-s-ruling-on-acquittal-bid)、アクセス 2026-06-01

**KYA Project への含意(極めて大きい、刑事リスク)**:

- **Track B README §1 仮説「ノンカストディWallet型の自己責任ニュアンスで潜る」は Tornado Cash 判決後に脆弱化**
- FinCEN 2019 Guidance は **行政指針(advisory)であり criminal case では非拘束** という判決の立場 → "software-only / non-custodial だから money transmitter ではない" 主張だけでは不十分
- KYA Project が直接 wallet を運営しなくても、**KYA Layer が "agent が金を動かす" 機能を技術的に enable する場合、Storm 型起訴リスクが存在**(推定、確度: 低-中、影響: 極大)
- **対策**:
  - L2 wallet operation に絶対触れない(`decision-doc.md` §3 で確定済)
  - SDK は "attestation の発行と検証のみ" として、agent の意思決定や送金実行を技術的にしない設計の明確化
  - **法人設立国の判断: US デラウェア法人だと FBI / SDNY 管轄リスクが直接降る → 日本 / シンガポール / UAE スタートが安全側**(`decision-doc.md` §1 W2 暫定と整合)

#### サブ論点 4: GENIUS Act(2025-07-18 成立)— stablecoin 経由 agent 送金

**S.1582 GENIUS Act 主要条項**(一次資料 verbatim 引用は WebSearch スニペット経由のため §は概略):

- §3: "It is unlawful for any person other than a permitted payment stablecoin issuer to issue a payment stablecoin in the United States."
- §4: permitted payment stablecoin issuer = (a) IDI subsidiary、(b) federal qualified、(c) state qualified の 3 種
- §7: "Issuers are considered financial institutions under the Bank Secrecy Act" → **BSA / KYC / Travel Rule 全部適用**
- §8: 全 issuer に **full audit + strict AML/KYC programs + freeze technology** 義務
- §13: 施行 = "the earlier of 18 months after enactment (= 2027-01-18) or 120 days after primary regulators issue final regulations"

出典:
- [S.1582 GENIUS Act text - Congress.gov](https://www.congress.gov/bill/119th-congress/senate-bill/1582/text)、アクセス 2026-06-01
- [Paul Hastings: GENIUS Act Comprehensive Guide](https://www.paulhastings.com/insights/crypto-policy-tracker/the-genius-act-a-comprehensive-guide-to-us-stablecoin-regulation)、アクセス 2026-06-01
- [Sidley: GENIUS Act Framework for US Stablecoin Issuance (2025-07)](https://www.sidley.com/en/insights/newsupdates/2025/07/the-genius-act-a-framework-for-us-stablecoin-issuance)、アクセス 2026-06-01
- [OCC Bulletin 2026-3: GENIUS Act NPRM](https://occ.treas.gov/news-issuances/bulletins/2026/bulletin-2026-3.html)、アクセス 2026-06-01
- [Federal Register: GENIUS Act OCC Implementation NPRM (2026-03-02)](https://www.federalregister.gov/documents/2026/03/02/2026-04089/implementing-the-guiding-and-establishing-national-innovation-for-us-stablecoins-act-for-the)、アクセス 2026-06-01

**KYA Project への含意**:

- GENIUS Act は **stablecoin issuer に BSA / KYC を直接義務化** → 全 agent が stablecoin で支払う場合、issuer は **beneficial owner = 人間** の KYC を実施せねばならない
- **agent の delegation chain を証明できないと、issuer は agent 経由 transaction を拒否せざるを得ない**(=> EU AMLR 2027 と同じ構造の論理が US でも 2027 から発生)
- → **KYA Layer = GENIUS Act 上の stablecoin issuer の compliance enabler** として売れる
- 戦略: GENIUS Act 施行(2027-01-18 or 早期)に間に合うように KYA SDK の "stablecoin issuer-facing attestation API" を 2026-Q4 までに用意

#### サブ論点 5: SEC AI 監督(2026 Examination Priorities + Atkins SEC の路線変更)

**SEC 2026 Examination Priorities(2025-10 公表)**:

- AI 監督・compliance program effectiveness を **複数セクションで明示**
- 重点領域:
  - **AI Decision-Making Transparency**: AI ツールがフラグした理由の説明可能性
  - **Fiduciary Compliance**: AI-driven recommendations の fiduciary duty 整合
  - **Marketing Claims**: AI capability 広告の substantiate 能力
  - **Cybersecurity**: AI-driven attacks + polymorphic malware 含む

**【重要な路線変更】PDA Proposal の撤回**:

- 2023-07 Gensler SEC が提案した "Predictive Data Analytics (PDA) Rule" は **Atkins SEC(2025-04 着任)直後に撤回**
- "PDA Proposal was withdrawn less than two months after current SEC Chairman Atkins was sworn in"
- 撤回理由(推定): Trump 政権 light-touch 路線への整合、broker-dealer / investment advisers への AI 利用個別執行に切り替え

出典:
- [SEC 2026 Examination Priorities PDF](https://www.sec.gov/files/2026-exam-priorities.pdf)、アクセス 2026-06-01
- [SEC Press Release: 2026 Examination Priorities](https://www.sec.gov/newsroom/press-releases/2025-132-sec-division-examinations-announces-2026-priorities)、アクセス 2026-06-01
- [Cleary Enforcement Watch: SEC Exam Priorities 2026](https://www.clearyenforcementwatch.com/2025/11/sec-exam-priorities-2026-priorities-largely-consistent-will-approach-to-deficiencies-and-enforcement-referrals-change/)、アクセス 2026-06-01
- [SEC Daly Speech: AI and Future of Investment Management (2026-02-03)](https://www.sec.gov/newsroom/speeches-statements/daly-020326-artificial-intelligence-future-investment-management)、アクセス 2026-06-01

**KYA Project への含意**:

- SEC は **rule-making から個別 enforcement** にシフト → 投資 advisor が agent を使って投資判断する場合、SEC examination で **AI logic transparency + fiduciary alignment + marketing substantiation** を求められる
- KYA Layer = agent の decision provenance(誰が agent を delegate、agent capability の attestation、log)を提供 → SEC examination response の道具として売れる
- 但し **投資 advisor / broker-dealer 専用市場は小さい** → 主要市場とは別、verticalize する余地として記録

#### サブ論点 6: CFPB(機能停止中)— ECOA AI adverse action

**CFPB 2024 guidance**:

- ECOA Reg B 上の adverse action notification: lender が AI / 複雑モデルで credit denial する場合、**具体的・正確な reason** を提示する義務(checklist 流用不可)
- 出典: [CFPB Adverse Action Notification AI Guidance](https://www.consumerfinance.gov/about-us/newsroom/cfpb-issues-guidance-on-credit-denials-by-lenders-using-artificial-intelligence/)、アクセス 2026-06-01

**【極めて重要】CFPB の機能停止状況(2025-2026)**:

- 2025-02: Acting Director Russell Vought が CFPB 閉鎖を宣言、職員に業務停止指示
- 2025-12-22: 24 州が Trump 政権を訴訟
- 2025-12-30: 連邦判事が "CFPB は statutory mandate により funding 維持必要" と判決
- 2025-12-05: CFPB が議会に "$279.6M 必要で 2026-09 まで稼働" と通知
- 2025-11-18: Trump が Stuart Levenbach を director 指名(Vought 留任のための手続き的措置と評価)
- 2025: 元 Acting head of enforcement Cara Petersen 辞任(Trump 政権の CFPB 攻撃を批判)

出典:
- [EPI: Trump administration attempts to close CFPB](https://www.epi.org/policywatch/trump-administration-closes-the-cfpb/)、アクセス 2026-06-01
- [NPR: 24 states sue Trump over CFPB funding (2025-12-22)](https://www.npr.org/2025/12/22/nx-s1-5652043/cfpb-trump-russell-vought-lawsuit)、アクセス 2026-06-01
- [CNN: Judge rebuffs Trump CFPB shutdown attempt (2025-12-30)](https://www.cnn.com/2025/12/30/politics/cfbp-funding-lawsuit-rejected)、アクセス 2026-06-01
- [Consumer Finance Monitor: CFPB funding need (2025-12-05)](https://www.consumerfinancemonitor.com/2025/12/05/cfpb-tells-president-congress-it-will-need-279-6-million-to-continue-statutorily-required-operations-through-september-30-2026/)、アクセス 2026-06-01

**KYA Project への含意**:

- **CFPB の AI ルールメイキング・enforcement は事実上停止中**(2025-12 - 2026-06 時点)
- 但し **ECOA / Reg B / FCRA** などの underlying 法律は CFPB だけでなく FTC、州 AG が enforce 可能 → ベース義務は残る
- 戦略: KYA の規制 attestation packaging で **CFPB AI guidance を含めるが、メイン売り込みポイントにはしない**(政治的不確実性が高い)

#### サブ論点 7: OCC / Fed / FDIC SR 26-2(2026-04-17)— agentic AI を**明示的にスコープ外**

**SR 26-2 主要条文(verbatim 引用、WebSearch スニペット経由)**:

> "Generative AI and agentic AI models are novel and rapidly evolving. As such, they are not within the scope of this guidance."

> "However, a banking organization's risk management and governance practices should guide the determination of appropriate governance and controls for any tools, processes, or systems not covered in this document. The principles described in this guidance apply to traditional statistical and quantitative models and non-generative, non-agentic AI models."

> "The agencies plan to issue in the near future a request for information that addresses model risk management generally and considers, in particular, banks' use of AI, including generative AI and agentic AI and AI-based models."

**適用範囲**: 主に $30B+ 総資産の銀行(関連あれば $30B 未満も該当)

**意味するところ**:
- SR 11-7(2011)と SR 21-8(2021)を **15 年ぶりに改訂**、principles-based approach に shift
- **agentic AI を意図的にスコープ外** = 銀行界・規制業界とも agentic AI のガバナンス枠組みを未定義のまま **RFI を待つ姿勢**
- これは KYA Project にとって **「銀行が agent を使う場合の compliance ベストプラクティス」が空白** = 市場機会の証拠

出典:
- [Federal Reserve SR 26-2 official page](https://www.federalreserve.gov/supervisionreg/srletters/SR2602.htm)、アクセス 2026-06-01(WebFetch 403、WebSearch snippet 経由)
- [SR 26-2 PDF](https://www.federalreserve.gov/supervisionreg/srletters/SR2602.pdf)、アクセス 2026-06-01
- [OCC Bulletin 2026-13 Model Risk Management Revised Guidance](https://www.occ.treas.gov/news-issuances/bulletins/2026/bulletin-2026-13.html)、アクセス 2026-06-01
- [Sullivan & Cromwell: OCC/Fed/FDIC Revised MRM Guidance (2026-04)](https://www.sullcrom.com/insights/memo/2026/April/OCC-Fed-FDIC-Issue-Revised-Guidance-Model-Risk-Management)、アクセス 2026-06-01
- [Davis Polk: Visual memo on Revised MRM Guidance](https://www.davispolk.com/insights/client-update/visual-memo-key-changes-under-federal-banking-agencies-revised-model-risk)、アクセス 2026-06-01
- [Cutover: SR 26-2 and Agentic AI](https://cutover.com/blog/what-sr-26-2-means-for-banks-deploying-agentic-ai)、アクセス 2026-06-01
- [AI2Work: Fed and OCC Leave AI Uncharted](https://ai2.work/blog/fed-and-occ-overhaul-bank-model-risk-rules-but-leave-ai-uncharted)、アクセス 2026-06-01

**KYA Project への含意**:

- **銀行業界での agentic AI compliance は 2026-04-17 時点で連邦規制の空白地帯**
- RFI 発出時期 = 2026-06 〜 2026-Q4(推定) → KYA Project が標準化議論に技術入力するチャンス
- 米銀行が AWS AgentCore Payments を採用する時、SR 26-2 改訂版 / RFI 回答 / Bedrock AgentCore + KYA Bridge の組み合わせが **米銀向けの "principled approach" の事実標準** に育つ可能性

#### サブ論点 8: Trump 2025-12-11 EO + 2026-03-20 National AI Legislative Framework

**EO 14318(暫定通称) "Ensuring a National Policy Framework for AI"(2025-12-11)**:

主要内容(WebSearch スニペット経由):

1. **DOJ AI Litigation Task Force**: 2026-01-10 launch、州 AI 法を **(a) interstate commerce 制約、(b) federal preempted、(c) unlawful** で連邦裁判所提訴
2. **FTC への 2026-03-11 期日**: Section 5 の AI 適用 + state-mandated bias mitigation を **per se deceptive** と分類する policy statement 発出
3. **Federal funding 圧力**: "onerous" AI law を持つ州への federal funding の制限可能性
4. **Colorado AI Act を target に明示**: "requir[es] entities to embed ideological bias within models"
5. **CA AI 法 は最終版では明示されず**(SB 53 / AB 2013 / AB 2655)
6. **Carve-out**: child safety、AI compute and data center infrastructure(permitting reforms 除く)、state procurement and use of AI は preemption 対象外

**National AI Legislative Framework(2026-03-20 公表)**:

- 連邦 light-touch + state preemption の **議会立法提案**
- "Federal preemption of state AI laws" を中心とする 6 objectives
- 議会通過は **当面困難**(Senate filibuster ハードル)

出典:
- [Paul Hastings: Trump EO Challenging State AI Laws (2025-12)](https://www.paulhastings.com/insights/client-alerts/president-trump-signs-executive-order-challenging-state-ai-laws)、アクセス 2026-06-01
- [DLA Piper: New EO Aims to Preempt State AI Regulation (2025-12)](https://www.dlapiper.com/en-us/insights/publications/2025/12/new-executive-order-aims-to-preempt-state-ai-regulation)、アクセス 2026-06-01
- [Latham: AI EO Targets State Laws (2025-12)](https://www.lw.com/en/insights/ai-executive-order-targets-state-laws-and-seeks-uniform-federal-standards)、アクセス 2026-06-01
- [Gibson Dunn: Trump's Latest AI EO Preempts State Laws](https://www.gibsondunn.com/president-trump-latest-executive-order-on-ai-seeks-to-preempt-state-laws/)、アクセス 2026-06-01
- [Sidley: Unpacking the 12/11/2025 EO](https://www.sidley.com/en/insights/newsupdates/2025/12/unpacking-the-december-11-2025-executive-order)、アクセス 2026-06-01(WebFetch 403)
- [Crowell & Moring: EO Tries to Thwart Onerous AI State Regulation](https://www.crowell.com/en/insights/client-alerts/executive-order-tries-to-thwart-onerous-ai-state-regulation-calls-for-national-framework)、アクセス 2026-06-01
- [Sullivan & Cromwell: Trump National Policy Framework AI (2026-03)](https://www.sullcrom.com/insights/memo/2026/March/White-House-Releases-National-Policy-Framework-AI)、アクセス 2026-06-01
- [Mayer Brown: Trump Legislative Recommendations Federal AI Framework (2026-03)](https://www.mayerbrown.com/en/insights/publications/2026/03/trump-administration-issues-legislative-recommendations-for-a-federal-artificial-intelligence-framework)、アクセス 2026-06-01
- [Ropes & Gray: White House Legislative Recommendations (2026-03)](https://www.ropesgray.com/en/insights/alerts/2026/03/the-white-house-legislative-recommendations-national-policy-framework-for-artificial-intelligence-an)、アクセス 2026-06-01
- [Baker Botts: March 2026 Federal Deadlines AI Regulatory](https://ourtake.bakerbotts.com/post/102mirs/march-2026-federal-deadlines-that-will-reshape-the-ai-regulatory-landscape)、アクセス 2026-06-01

**KYA Project への含意**:

- Trump 政権下の連邦規制 = **light-touch + 州 preemption + 個別執行(FTC §5)**
- 結果として **agent identity 義務化は連邦立法レベルでは起こらない**(2026-06 〜 2028 horizon)
- **KYA は EU 売り込み戦略をそのまま US に持ち込むと響かない** — US では「義務化される条文」より「**Section 5 訴追・Tornado Cash 型刑事リスク・GENIUS Act 上の stablecoin issuer compliance**」の角度で売る必要
- 法人設立: **EU 域外 + US 域外スタートが安全側**(Trump EO が状態 AI 法を攻撃中 → US 法人設立すると DOJ Task Force リスクが直接降る可能性。ただし KYA は AI agent 規制対象側ではなくインフラ層 → 直接降りない解釈も可能、Phase 1 弁護士確認必須)

### 2.3 主要州 AI 法(2026-06 時点)

#### 2.3.1 Colorado AI Act SB 24-205 → SB 26-189(repeal & replace)

**【極めて重要】2026-04-27 〜 2026-05-14 の経緯**:

- 元 SB 24-205(2024-05 制定、2026-02-01 施行予定)= US 初の **comprehensive AI 法**、EU AI Act 模倣の high-risk AI 規制
- 2025-08: Polis 知事が **special session 招集**、施行延期協議
- **2026-04-27**: federal magistrate judge が enforcement を **stay**
- **2026-05-14**: Polis 知事が **SB 26-189 署名 → SB 24-205 は事実上死亡**
- **新 SB 26-189**: **2027-01-01 施行**、duty of care / risk management program / impact assessment 要件を削除、pre-use notice + post-adverse-outcome disclosure + 限定的 consumer rights に絞り込み

**SB 26-189 主要条文(verbatim 引用は WebSearch スニペット経由)**:

- "covered ADMT"(automated decision-making technology)概念で範囲を限定
- consequential decision を扱う ADMT に対する pre-use notice 義務
- adverse outcome 発生時の post-disclosure 義務
- Trump EO の Colorado への明示 attack を受け、Colorado は実質的に **要件を大幅緩和**

出典:
- [SB 24-205 元法 Colorado General Assembly](https://leg.colorado.gov/bills/sb24-205)、アクセス 2026-06-01
- [Akin: Colorado Postpones SB 24-205](https://www.akingump.com/en/insights/ai-law-and-regulation-tracker/colorado-postpones-implementation-of-colorado-ai-act-sb-24-205)、アクセス 2026-06-01
- [Clark Hill: Colorado AI Act Update SB 26-189](https://www.clarkhill.com/news-events/news/colorado-ai-act-update-sb26-189-key-changes-2027/)、アクセス 2026-06-01
- [Consumer Finance Monitor: Colorado Rewrites Landmark AI Law](https://www.consumerfinancemonitor.com/2026/05/12/colorado-rewrites-its-landmark-ai-law-unpacking-sb-26-189-and-what-it-means-for-businesses/)、アクセス 2026-06-01
- [Seyfarth Shaw: Colorado Enacts AI Replacement Law](https://www.seyfarth.com/news-insights/colorado-enacts-artificial-intelligence-replacement-law.html)、アクセス 2026-06-01
- [Nixon Peabody: Colorado Repeal Replace AI Act](https://www.nixonpeabody.com/insights/alerts/2026/05/14/colorado-legislature-passes-bill-to-repeal-and-replace-the-colorado-ai-act)、アクセス 2026-06-01
- [Finnegan: Colorado SB 26-189 Framework](https://www.finnegan.com/en/insights/articles/colorado-replaces-landmark-ai-act-an-overview-of-the-new-sb-26-189-framework.html)、アクセス 2026-06-01

**KYA Project への含意**:

- Colorado AI Act が **US で最も EU 的な州法だったが、Trump EO 攻撃で大幅緩和** → 州 AI 法の **連邦 preemption による萎縮効果** の典型例
- 残った SB 26-189 はあくまで "consequential decision-making" focus、agent identity 明示なし
- KYA Project は **EU AI Act 型の州法に依存しないストラテジー** を取るのが正解(2027-01-01 施行 SB 26-189 をターゲットにすると Trump EO の preemption リスクで売れない可能性)

#### 2.3.2 Texas Responsible AI Governance Act(TRAIGA / HB 149)

- **2025-06-22 署名、2026-01-01 施行**(現在施行中)
- 元 draft は Colorado AI Act / EU AI Act 模倣の comprehensive scheme だったが、scale down
- **High-risk AI**: 雇用・教育・医療・住宅・保険・金融サービス・政府サービスに consequential decision を行う AI
- 主に **prohibitions に focus**: behavioral manipulation、discrimination、child pornography / unlawful deepfakes、constitutional right 侵害
- **NIST AI RMF 準拠を Safe Harbor** として明示(=> KYA + NIST AI Agent Profile compliant package 提供で TX 顧客への売り込み根拠)
- Impact assessment は high-risk のみ
- intent-based liability framework(disparate impact alone insufficient)

出典:
- [Texas HB 149 official text PDF](https://capitol.texas.gov/tlodocs/89R/billtext/pdf/HB00149I.pdf)、アクセス 2026-06-01
- [Latham: Texas Signs TRAIGA Into Law](https://www.lw.com/en/insights/texas-signs-responsible-ai-governance-act-into-law)、アクセス 2026-06-01
- [Baker Botts: Texas Enacts TRAIGA (2025-07)](https://www.bakerbotts.com/thought-leadership/publications/2025/july/texas-enacts-responsible-ai-governance-act-what-companies-need-to-know)、アクセス 2026-06-01
- [Norton Rose Fulbright: Texas TRAIGA pre-Jan 1](https://www.nortonrosefulbright.com/en/knowledge/publications/c6c60e0c/the-texas-responsible-ai-governance-act)、アクセス 2026-06-01
- [K&L Gates: Pared Back TRAIGA Signed Into Law (2025-06)](https://www.klgates.com/Pared-Back-Version-of-the-Texas-Responsible-Artificial-Intelligence-Governance-Act-Signed-Into-Law-6-24-2025)、アクセス 2026-06-01
- [TechPolicy.Press: Texas New Model State AI Regulation](https://www.techpolicy.press/texas-just-created-a-new-model-for-state-ai-regulation/)、アクセス 2026-06-01

**KYA Project への含意**:

- TX TRAIGA の **NIST AI RMF Safe Harbor** が KYA の戦略と整合 → NIST AI Agent IO Profile compliant な KYA SDK = TX 顧客への safe harbor 提供
- agent identity 明示要件はないが、impact assessment + intent-based liability framework は KYA Layer による attestation で defense として使える

#### 2.3.3 California: SB 53 + AB 2013 + AB 2655 + AB 1018

**SB 53 Transparency in Frontier AI Act(TFAIA、2025-09-29 署名)**:

- **US 初の "frontier AI" 直接規制**、開発者対象(10^26 FLOP+ で訓練)
- 3 要件:
  1. **Transparency**: frontier AI framework 公開
  2. **Accountability**: whistleblower 保護 + 民事罰
  3. **Responsiveness**: California Department of Technology が annual 更新提案
- foundation model provider 向け → KYA Project は直接対象外

出典:
- [Newsom press release SB 53](https://www.gov.ca.gov/2025/09/29/governor-newsom-signs-sb-53-advancing-californias-world-leading-artificial-intelligence-industry/)、アクセス 2026-06-01
- [White & Case: California TFAIA Enacted](https://www.whitecase.com/insight-alert/california-enacts-landmark-ai-transparency-law-transparency-frontier-artificial)、アクセス 2026-06-01
- [Carnegie: California SB 53 First Frontier AI Law](https://carnegieendowment.org/emissary/2025/10/california-sb-53-frontier-ai-law-what-it-does)、アクセス 2026-06-01
- [Brookings: California's AI safety law](https://www.brookings.edu/articles/what-is-californias-ai-safety-law/)、アクセス 2026-06-01
- [Latham: California Assumes Role as Lead US AI Regulator](https://www.lw.com/en/insights/california-assumes-role-as-lead-us-regulator-of-ai)、アクセス 2026-06-01
- [Future of Privacy Forum: California SB 53 Explained](https://fpf.org/blog/californias-sb-53-the-first-frontier-ai-law-explained/)、アクセス 2026-06-01

**AB 2013 Generative AI Training Data Transparency(2024 署名、2026-01-01 disclosure 期限)**:

- generative AI を CA 住民に提供する **developer** に対し、訓練 dataset summary を website 公開義務
- KYA Project は **AI system 開発者ではない** → 直接対象外

出典:
- [Crowell & Moring: AB 2013 Generative AI Data Disclosure](https://www.crowell.com/en/insights/client-alerts/californias-ab-2013-requires-generative-ai-data-disclosure-by-january-1-2026)、アクセス 2026-06-01
- [Morgan Lewis: California vetoes SB 1047, signs AB 2013](https://www.morganlewis.com/pubs/2024/10/california-governor-vetoes-ai-safety-bill-sb-1047-signs-ab-2013-requiring-generative-ai-transparency)、アクセス 2026-06-01

**AB 2655 Defending Democracy from Deepfake Deception(2024 署名)**:

- 1M+ CA ユーザー platform に対する deepfake election content 除去義務
- 連邦裁判所が enforcement を 2025-06-28 まで stay → 適用境界 unclear
- agent commerce には直接関係薄

出典:
- [Cooley: California's New AI Laws Training Data and Transparency](https://www.cooley.com/news/insight/2024/2024-10-16-californias-new-ai-laws-focus-on-training-data-content-transparency)、アクセス 2026-06-01
- [DLA Piper: California Enacts Sweeping AI Regulation (2024-10)](https://www.dlapiper.com/en-us/insights/publications/2024/10/california-enacts-sweeping-new-ai-regulation)、アクセス 2026-06-01

**AB 1018 Automated Decision Systems(2025-09-13 時点で Wiener により inactive file 入り、事実上 dormant)**:

- ADS を ML / 統計モデル / data analytics / AI から派生する computational process と広く定義
- 雇用・医療・住宅 employment 決定影響を target
- **2027-01-01 deployer 義務予定だったが、CA Senate Wiener により dormancy** → 2026-06 時点で施行可能性は **低**

出典:
- [AB 1018 official text](https://leginfo.legislature.ca.gov/faces/billNavClient.xhtml?bill_id=202520260AB1018)、アクセス 2026-06-01
- [Fisher Phillips: AB 1018 Anti-Discrimination](https://www.fisherphillips.com/en/news-insights/california-introduces-another-ai-anti-discrimination-bill.html)、アクセス 2026-06-01
- [CSA: AB 1018 California AI Regulation (2025-09)](https://cloudsecurityalliance.org/blog/2025/09/05/ab-1018-california-s-upcoming-ai-regulation-and-what-it-means-for-companies)、アクセス 2026-06-01

**KYA Project への含意(CA まとめ)**:

- CA の AI 法群は **frontier model developer**(SB 53)と **AI system developer / deployer**(AB 2013、AB 1018)中心 → KYA Project は **AI system でないと立論できれば対象外**
- ただし KYA SDK 顧客側(agent system 提供者)は CA 法の影響を受ける → KYA の規制 attestation package に **CA AB 2013 + SB 53 用の compliance helper** を含める価値あり
- Trump EO は **CA 法を最終版で明示せず** → CA は連邦攻撃の最前線ではない(Colorado は前線)

#### 2.3.4 New York RAISE Act + NYC Local Law 144

**NY RAISE Act(Responsible AI Safety and Education Act、2025-12-19 署名、2027-01-01 施行)**:

- 大型 frontier AI モデル developer に対する transparency / compliance / safety / reporting 義務
- penalty あり
- SB 53 同様、foundation model developer focus → KYA Project は直接対象外

出典:
- [Skadden: NY Enacts AI Transparency Law (2026-01)](https://www.skadden.com/insights/publications/2026/01/new-york-enacts-ai-transparency-law)、アクセス 2026-06-01

**NYC Local Law 144(AEDT Bias Audit、2023 施行)**:

- Automated Employment Decision Tool 利用 employer に対する **annual bias audit + 結果公開 + opt-out 通知** 義務
- penalty: $500/違反、$1,500/日(継続違反)
- **2026 enforcement update**: NYC Comptroller audit が DCWP enforcement の **ineffective** を指摘 → 今後 enforcement 強化見込み

出典:
- [NYC DCWP AEDT page](https://www.nyc.gov/site/dca/about/automated-employment-decision-tools.page)、アクセス 2026-06-01
- [Deloitte: NYC Local Law 144 Algorithmic Bias](https://www.deloitte.com/us/en/services/audit-assurance/articles/nyc-local-law-144-algorithmic-bias.html)、アクセス 2026-06-01
- [DLA Piper: NYC AI Hiring Law Audit Risk for Employers (2026)](https://knowledge.dlapiper.com/dlapiperknowledge/globalemploymentlatestdevelopments/2026/New-York-Critical-audit-of-New-York-Citys-AI-hiring-law-signals-increased-risk-for-employers)、アクセス 2026-06-01

**KYA Project への含意(NY まとめ)**:

- NYC LL144 は AEDT (employment) 限定 → agent commerce には直接無関係
- NY RAISE Act は frontier developer 対象 → KYA は対象外
- ただし AEDT 用に KYA 互換性 + bias audit pipeline は MVP の vertical 拡張余地として記録

---

## 3. 比較表(US 連邦 + 主要州、時系列マトリクス)

| 時期 | 適用される義務(連邦) | 適用される義務(州) | Agent Identity 義務化度 | KYA への影響 |
|------|------------------------|------------------------|------------------------|--------------|
| **現状(2026-06)** | NIST AI RMF / 600-1(voluntary)、FTC §5、FinCEN 2019 G001、SR 26-2 改訂、SEC 2026 Exam、GENIUS Act 段階施行 | NYC LL144 enforcement、CO SB 24-205 stay 中、TX TRAIGA 施行中 | 弱(明示義務なし)、Section 5 で執行 | KYA は voluntary best practice として売り込み可、Section 5 防御策で売る |
| **2026-Q3-Q4** | DOJ AI Litigation Task Force 州法提訴 / FTC AI policy statement 効力発揮、SR 26-2 後 RFI 公表、**NIST AI Agent IO Profile v1 release(Q4 2026)** | NYC LL144 enforcement 強化 | 中(NIST 自主規制が事実上 baseline 化) | KYA = NIST IO Profile reference implementation として位置取り |
| **2027-01-01** | GENIUS Act 施行(stablecoin issuer BSA / KYC)、CFPB 機能停止 / 部分回復 | **TX TRAIGA, NY RAISE, CO SB 26-189, CA AB 2013** 全部施行(または影響顕在化) | 中(間接、stablecoin / state high-risk AI 経由) | KYA = GENIUS Act 上の issuer compliance enabler + TX/NY safe harbor 提供 |
| **2027-2028** | NIST AI Agent IO Profile 後継、議会 federal AI 立法(Senate filibuster で確度低) | 州 vs 連邦 preemption 訴訟継続、州 AI 法の executable な subset 確定 | 中-強(個別執行 + 業界自主規制で事実上 KYA 化) | KYA Layer は規制 attestation packaging で commodity 化、prime customer は AI agent platform 提供者 |
| **2028-2029** | possible federal AI act passage(party control 次第)、Tornado Cash retrial 結果による刑事 baseline 確定 | preemption 判決 by SCOTUS の可能性 | 強(立法 or 判例で確定) | KYA Layer は規制 attestation packaging で commodity 化、prime customer は AI agent platform 提供者 |

---

## 4. 「抜け道」分析(KYA Project の視点)

### 4.1 KYA が直面する規制負荷の見積(US)

EU の場合と同じ枠組み:

| KYA Project の役割解釈 | US 法上の地位 | 義務負荷 |
|------------------------|---------------|----------|
| (A) AI system provider(訓練・market に出す) | NIST AI 600-1 voluntary、CA SB 53 / NY RAISE 適用可能性、TX TRAIGA developer | **中**(VC で言う "AI system" 否認できれば軽い) |
| (B) AI deployer(ユーザー向けにサービス提供) | TX TRAIGA deployer、CFPB ECOA、CA AB 2013 | **軽-中** |
| (C) **規制対象外**(infrastructure / attestation provider) | 直接適用なし | **ほぼ無**(ただし Tornado Cash 型刑事リスクの説明責任あり) |
| (D) Money Transmitter / MSB | FinCEN MSB 登録 + 49 state MTL + Travel Rule + AML | **極めて重い**(全 50 州、$100-数百万 / 州、6-9 ヶ月-2 年) |
| (E) Stablecoin issuer(GENIUS Act) | OCC/Fed 監督 + IDI subsidiary + BSA/KYC + freeze tech | **極めて重い** |
| (F) FTC §5 deceptive risk(無登録だが widespread enforcement target) | FTC enforcement のリスク | **個別執行リスク**、登録系の重さはないが訴追リスクあり |

**推奨スタンス(暫定、EU と同じ)**: **(C) を主軸**。
- KYA SDK は AI system 本体ではなく "identity attestation infrastructure" として設計
- 顧客の compliance を可能にする道具
- **(D)(E) は絶対回避** — Tornado Cash 判決後の MTL リスクは想定以上に高い

### 4.2 リスク要因(US 特有)

| リスク | 確度 | 影響 | 対策 |
|--------|------|------|------|
| **Tornado Cash 型刑事リスク** — KYA SDK が "agent が金を動かす" enable と認定され、Storm 型 18 USC §1960 起訴 | **低-中** | **極大**(個人の刑事責任) | L2 wallet operation に絶対触れない、L3 attestation のみ、SDK を OSS + Apache 2.0 で公開 transparency 維持、起訴管轄国を US 域外に維持 |
| **GENIUS Act 上の stablecoin issuer 認定リスク** — KYA が attestation の発行で issuer と誤解 | 低 | 大 | "we do not issue any stablecoin" の明示 disclaimer、attestation = digital credential であって stablecoin 非該当の technical doc |
| **MTL リスク** — KYA がいずれかの州で "transmission" と認定 | 低-中 | 極大(全 50 州 MTL + state-by-state $100K-数百万) | L3 のみ提供、settlement / wallet 機能ゼロ、SDK 利用規約で顧客が L2 に触れる責任を明確化 |
| **FTC §5 deceptive 認定リスク** — KYA SDK の capability 過大表示が顧客の Section 5 違反を誘発 | 低 | 中 | marketing material の substantiate、capability boundary の technical doc 明示、FTC AI 2026 Policy Statement への参照 |
| **Trump EO 攻撃の波及リスク** — KYA の "規制 attestation packaging" 売り込みが連邦 preemption 攻撃の対象に巻き込まれる | 低 | 中 | EU AI Act 売り込みフレーズの US 向け修正、US 売り込みは "Section 5 defense" + "voluntary NIST conformance" で再フレーム |
| **CFPB 機能不全リスク** — CFPB 関連 attestation が政治的不確実性で売れない | 高 | 中 | CFPB 関連を mainstream sales pitch から外す、ECOA / FCRA は FTC / 州 AG で enforce 可能性残ることを記録 |
| **NIST AI Agent IO Profile Q4 2026 release の遅延 / 内容変更リスク** — KYA SDK が NIST Profile に合致しないと "reference implementation" 戦略破綻 | 中 | 大 | CAISI パブコメ参加、Cloud Security Alliance "Agentic AI NIST RMF Profile" early adoption、Microsoft "Architecting Trust" NIST framework 参照 |
| **Colorado SB 26-189 施行リスク / 大幅変更** — 2027-01-01 までに更に緩和 / 大幅変更 | 中 | 低-中 | Colorado に売り込みを依存しない、TX TRAIGA Safe Harbor を主軸に |
| **DOJ AI Litigation Task Force 状態 law 全廃リスク** — 州 AI 法全部 SCOTUS で違憲化 | 低 | 大 | 連邦 light-touch + 連邦個別執行(FTC §5)に売り込み軸を移行 |

### 4.3 推奨スタンス(KYA Project として、US 向け)

- **核となる主張**: "KYA Layer は AI system でも money transmitter でもない identity attestation infrastructure。**Section 5 deceptive 訴追・Tornado Cash 型起訴・GENIUS Act 上の stablecoin issuer 義務** を顧客が回避するための技術的道具を提供する"
- **法的根拠の固め方**:
  - FinCEN FIN-2019-G001 §4.5.1(software-only / non-custodial)準拠
  - NIST AI Agent IO Profile(Q4 2026 v1)voluntary 準拠 → TX TRAIGA Safe Harbor 主張
  - FTC AI Policy Statement(2026-03-11)対応の transparency design
  - Tornado Cash 判決を受けた criminal risk advisory(SDK doc に明示)
- **法人設立国の判断**(`decision-doc.md` §1 への含意): **US デラウェア法人は Tornado Cash 起訴リスクの直接降下 + DOJ AI Litigation Task Force ターゲット化リスク + MTL 50 州負荷で当面非推奨**。**EU 域外(日本 / シンガポール / UAE)から US 顧客にサービス提供** で適用法を慎重に判断する戦略は EU と同じ。

---

## 5. 戦略的含意(KYA Project への影響)

### 5.1 結論: US の agent identity 義務化は **間接的かつ分散的**、EU と比較で **緩いがリスク構造が違う**

**KYA Project の核仮説への影響**: **追い風(条件付き)、ただし EU と性質が異なる**。

理由:
1. **連邦 light-touch + Trump EO による州 preemption 攻撃** で **「義務化される条文」は EU よりはるかに緩い**
2. しかし **Section 5(FTC AI Policy Statement 2026-03-11)+ Tornado Cash 判決 + GENIUS Act stablecoin issuer** で **個別執行 + 刑事リスク + セクター個別** の **三層リスク** が残る
3. **NIST AI Agent IO Profile Q4 2026 v1 release** で **連邦 voluntary 標準が事実上の baseline 化** する可能性が高い → KYA の "reference implementation" 戦略余白がここに開く
4. **EU との比較**: EU AI Act + AMLR + PSD3 + eIDAS の重層効果 vs US の Section 5 + GENIUS + state law(Trump EO 攻撃下)+ NIST voluntary → **US の方が法的義務化は緩いが、Tornado Cash 型刑事リスクの個人リスクは強い**

### 5.2 法人設立国(decision-doc.md §1)への含意

**US デラウェア法人設立は Phase 0 段階では非推奨に確度上昇**(`decision-doc.md` §1 W2 暫定方向と整合):

理由:
- **Tornado Cash 起訴リスク**: KYA SDK が "agent が金を動かす" enable と認定された場合、SDNY(連邦地検 NY 南部)管轄が降る可能性。**US 法人 = この起訴が直接届く**(2025-08-06 Storm 判決の射程)
- **MTL 50 州負荷**: 仮に "money transmission" と誤解されると state-by-state MTL + bond + 6-9 ヶ月-2 年の licensing で実質市場参入不可
- **DOJ AI Litigation Task Force**: 州 AI 法を提訴する task force(2026-01-10 launch)が KYA 戦略を間接的に削る
- **GENIUS Act stablecoin issuer 認定リスク**: 一意に否認可能だが、US 法人だと OCC / Fed 規制圏内の認定リスクが残る

**暫定推奨**(`decision-doc.md` §1 既存方向の確認 + 強化):
- 初期は **EU 域外 + US 域外法人(日本 / シンガポール / UAE)から US 顧客にサービス提供**
- US 顧客への service provision で **Section 5 / GENIUS Act / Tornado Cash の管轄問題が降る境界条件** を Phase 1 で弁護士確認
- **US 子会社設立** は (a) NIST AI Agent IO Profile が安定、(b) Tornado Cash retrial 結果が確定、(c) GENIUS Act 施行規則が確定 した時点で再評価(早くて 2027-Q3)
- 確度: 暫定見立て、Phase 1 で弁護士確認必須

### 5.3 ビジネスモデル(decision-doc.md §2)への含意

`decision-doc.md` §2 W2 暫定「**1 SDK ライセンス + 5 Hybrid: OSS Bridge + 商用規制 attestation packaging**」を US 向けに以下の修正で確認:

- **規制 attestation packaging US 版**: EU AI Act / AMLR / PSD3 ではなく以下のセットに変更
  - **(1) FTC Section 5 deceptive 防御 package** — FTC AI Policy Statement 2026-03-11 対応の transparency disclosure attestation
  - **(2) FinCEN BSA / Travel Rule 上のノンカスト宣言 package** — KYA SDK が "money transmission ではない" の technical attestation
  - **(3) NIST AI Agent IO Profile compliant attestation** — Q4 2026 v1 release 後の voluntary conformance package
  - **(4) TX TRAIGA Safe Harbor package** — NIST AI RMF Safe Harbor 利用の compliance summary
  - **(5) GENIUS Act 上の non-issuer 明示 + issuer-facing API** — stablecoin issuer の compliance enabler として agent delegation chain attestation

- **棄却した売り込みポイント**(US 限定):
  - "EU AI Act 対応" 単独売り込み → US 顧客には響かない
  - CFPB compliance attestation 単独 → 政治不確実性で陳腐化リスク

### 5.4 技術アーキテクチャ(decision-doc.md §3)への含意

`decision-doc.md` §3 W2 暫定確定の技術スタック(did:web + SD-JWT VC + SP1 + ML-DSA dual-sig + spruceid/ssi + 3 層 Bridge)は **US 適合性 OK**。追加で以下を実装推奨:

- **Cloudflare Web Bot Auth 互換性**: IETF RFC 9421 HTTP Message Signatures ベース、Cloudflare blog 2026-02 で AWS Bedrock AgentCore 統合発表 → **KYA SDK の "agent identifier" output が Web Bot Auth の HTTP signature と互換** で出せると AWS 顧客への売り込みが強い
- **NIST AI Agent IO Profile reference implementation**: Q4 2026 release に合わせて KYA SDK を "NIST conformant" として証明する test suite に組み込む
- **OpenAI Web Bot Auth 採用** ("OpenAI has started to sign their requests using HTTP Message Signatures" — Cloudflare 2025-2026)も Cloudflare blog で言及 → US 主要 AI player の agent identity 採用が進む → KYA Layer の market readiness 確度向上

出典:
- [Cloudflare Web Bot Auth blog](https://blog.cloudflare.com/web-bot-auth/)、アクセス 2026-06-01
- [Cloudflare Signed Agents blog](https://blog.cloudflare.com/signed-agents/)、アクセス 2026-06-01
- [Cloudflare Agent Registry blog](https://blog.cloudflare.com/agent-registry/)、アクセス 2026-06-01
- [Cloudflare Web Bot Auth docs](https://developers.cloudflare.com/bots/reference/bot-verification/web-bot-auth/)、アクセス 2026-06-01
- [GitHub cloudflare/web-bot-auth repository](https://github.com/cloudflare/web-bot-auth)、アクセス 2026-06-01
- [Stytch: Web Bot Auth for agent verification](https://stytch.com/blog/stytch-supports-web-bot-auth/)、アクセス 2026-06-01

### 5.5 時間圧力(decision-doc.md §5、Path 選択)への含意

`decision-doc.md` §5 W2 暫定「**AWS 後出しリスク 7 ヶ月 + EU 12-18 ヶ月**」を US 向けに以下のレイヤーで補強:

- **追加圧力**: **NIST AI Agent IO Profile v1 release Q4 2026** = KYA OSS Bridge SDK 公開 deadline と同期
- **追加圧力**: **GENIUS Act 施行 2027-01-18(or 規則制定 +120 日)** = KYA の stablecoin issuer-facing API 完成 deadline
- **緩和要因**: Trump EO の連邦 preemption / light-touch 路線で **「義務化される条文」遅延** → EU と同じく市場形成は 12-18 ヶ月 window
- **緩和要因**: SR 26-2(2026-04-17)が agentic AI をスコープ外にしたため、銀行業界での agentic AI baseline 確定が **2027-2028 まで遅延** → KYA Layer が参入する余地が長期間維持

`decision-doc.md` §5 W2 暫定 **Path C(Hybrid)** は US 視点でも継続支持。

### 5.6 新規追加リスク(decision-doc.md §6)

以下を `decision-doc.md` §6 に追記候補:

- **Tornado Cash 型刑事リスクの直接降下リスク**: KYA SDK が "agent が金を動かす" enable と認定された場合、SDNY 管轄の 18 USC §1960 起訴が個人 / 法人に降る可能性。**確度: 低-中、影響: 極大(個人の刑事責任)**。対策: L2 wallet 操作絶対回避、SDK doc に "we do not enable money transmission" 明示、US 法人設立を Phase 0 段階では避ける
- **DOJ AI Litigation Task Force 攻撃の二次波及リスク**: 2026-01-10 launch、州 AI 法 preemption 訴訟で KYA の "規制 attestation packaging" 売り込みが間接的に削られる。**確度: 低、影響: 中**
- **GENIUS Act stablecoin issuer 認定リスク**: KYA が attestation 発行を理由に issuer と誤解。**確度: 低、影響: 大**。対策: attestation = digital credential ≠ stablecoin の technical doc 明示
- **NIST AI Agent IO Profile 内容変更リスク**: Q4 2026 v1 が KYA SDK と非互換だと "reference implementation" 戦略破綻。**確度: 中、影響: 大**。対策: CAISI パブコメ参加、CSA / CLTC との early collaboration
- **FTC AI Policy Statement 2026-03-11 内容の予測不能性**: Trump 政権下で AI 規制方針が 6 ヶ月単位で変動。**確度: 高、影響: 中**。対策: voluntary NIST compliance を主軸に置き、政治的中立性を確保

### 5.7 EU と US の比較(`decision-doc.md` 横断含意)

| 論点 | EU(W2 完了) | US(W3 暫定) |
|------|---------------|----------------|
| 明示的な agent identity 義務 | No(条文に "agentic AI" 定義語なし) | No(連邦 NIST voluntary、SR 26-2 はスコープ外) |
| 間接的義務化の重層 | Yes(AI Act 50 + 14 + 26 + AMLR + PSD3 + eIDAS) | Yes(FTC §5 + GENIUS + FinCEN + NIST IO Profile + state law) |
| 義務化される時期 | 2026-08 (transparency only) → 2027-12 (high-risk) → 2027-07 (AMLR) | 連邦明示義務なし、2027-01 (TX TRAIGA full, NY RAISE, CO SB 26-189), 2027-01 (GENIUS) |
| 標準化の方向 | EUDI Wallet ARF v2.9+ (2027-2028 で agent / delegation) | NIST AI Agent IO Profile v1 (Q4 2026) |
| 刑事リスク | 低(直接適用 Regulation で行政罰中心) | **高(Tornado Cash 判決 → 18 USC §1960 起訴リスク)** |
| KYA Project が立ちやすい根拠 | AI Act 構造的ギャップ + EUDI ARF delegation 空白(2026-Q4 - 2027-Q4) | NIST AI Agent IO Profile reference implementation + Section 5 defense + Web Bot Auth 互換 |
| 法人設立リスク | EU 法人は AI Act / AMLR / eIDAS QTSP 義務直接降下リスク | US 法人は Tornado Cash 起訴 / MTL / DOJ Task Force 降下リスク |
| **推奨スタンス** | EU 域外スタート + EUDI 安定後子会社 | US 域外スタート + NIST Profile / GENIUS / Tornado Cash retrial 結果安定後子会社 |

**KYA Project への含意(両法域横断)**:
- EU と US は両方とも **「明示義務化はないが、層的に必要性が高まる」** で同じ構造
- **法人設立は両方とも域外スタートが安全側** → 日本 / シンガポール / UAE が候補
- **時間圧力**: NIST Q4 2026 v1 release + EUDI ARF v2.9 + GENIUS 施行 2027-01 が一斉に来る → **2026-Q4 ~ 2027-Q4 の 12 ヶ月 window** で OSS Bridge SDK + 規制 attestation packaging を市場投入する必要

---

## 6. 主要発見(エグゼクティブ向けサマリ)

1. **US 連邦法で agent identity を明示的に義務化する規制は 2026-06 時点で存在しない**。NIST AI RMF / AI 600-1 は voluntary、SR 26-2(2026-04-17)は agentic AI を **明示的にスコープ外**、SEC PDA Proposal は **Atkins SEC で撤回済**。

2. **しかし NIST AI Agent Standards Initiative(2026-02-17 launch、Q4 2026 v1 release)が voluntary 連邦標準の baseline 化を進行中**。identity / authorization / monitoring / logging を扱う → **KYA Project の核論点と完全に重なる**。KYA SDK = NIST IO Profile reference implementation の戦略余白。

3. **Trump 政権下の連邦規制 = light-touch + 州 preemption + 個別執行(FTC Section 5)** の三本柱。2025-12-11 EO + 2026-03-11 FTC AI Policy Statement + 2026-03-20 National AI Legislative Framework で **state AI law の萎縮効果** を生み出し、Colorado AI Act が SB 26-189 で大幅緩和、TX TRAIGA は NIST AI RMF Safe Harbor で軟着陸。

4. **Tornado Cash / Roman Storm 判決(2025-08-06)が KYA Project にとって最大の US 特有リスク**。FinCEN 2019 Guidance を criminal case で非拘束と DOJ が主張、Storm が 18 USC §1960 で有罪。**KYA SDK が "agent が金を動かす" enable と誤解されると SDNY 管轄起訴リスクが個人 / 法人に直接届く**。**US 法人設立を Phase 0 段階では避ける** ことの強い根拠。

5. **重層効果(NIST IO Profile Q4 2026 + GENIUS Act 2027-01 + TX/NY/CO 州法 2027-01 + FTC §5 個別執行 + Tornado Cash 刑事 baseline)で 2027-2028 までに事実上の KYA 必要性は EU 同様に成立** — ただし **「義務化される条文」ではなく「訴追・執行を避けるための事実上のベストプラクティス」として KYA が必要** という性質の違いがある(推定、確度: 中-高)。

---

## 7. ソース

### 一次資料(US 連邦法・州法・ガイダンス)

#### 連邦法・規制
- [NIST AI Risk Management Framework 1.0 - NIST](https://www.nist.gov/itl/ai-risk-management-framework)
- [NIST AI 600-1 Generative AI Profile PDF (nvlpubs.nist.gov)](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf)
- [Announcing the "AI Agent Standards Initiative" - NIST.gov (2026-02-17)](https://www.nist.gov/news-events/news/2026/02/announcing-ai-agent-standards-initiative-interoperable-and-secure)
- [FinCEN Guidance FIN-2019-G001 PDF](https://www.fincen.gov/system/files/2019-05/FinCEN%20Guidance%20CVC%20FINAL%20508.pdf)
- [FinCEN PPSI-AMLCFT-NPRM (2026-04)](https://www.fincen.gov/system/files/2026-04/PPSI-AMLCFT-NPRM.pdf)
- [eCFR 31 CFR 1010.410 Travel Rule](https://www.ecfr.gov/current/title-31/subtitle-B/chapter-X/part-1010/subpart-D/section-1010.410)
- [GENIUS Act S.1582 text - Congress.gov](https://www.congress.gov/bill/119th-congress/senate-bill/1582/text)
- [OCC Bulletin 2026-3 GENIUS Act NPRM](https://occ.treas.gov/news-issuances/bulletins/2026/bulletin-2026-3.html)
- [Federal Register: GENIUS Act OCC NPRM (2026-03-02)](https://www.federalregister.gov/documents/2026/03/02/2026-04089/implementing-the-guiding-and-establishing-national-innovation-for-us-stablecoins-act-for-the)
- [Federal Reserve SR 26-2 official page](https://www.federalreserve.gov/supervisionreg/srletters/SR2602.htm)
- [SR 26-2 PDF](https://www.federalreserve.gov/supervisionreg/srletters/SR2602.pdf)
- [SR 26-2 Attachment](https://www.federalreserve.gov/supervisionreg/srletters/SR2602a1.pdf)
- [OCC Bulletin 2026-13 MRM Revised Guidance](https://www.occ.treas.gov/news-issuances/bulletins/2026/bulletin-2026-13.html)
- [SEC 2026 Examination Priorities PDF](https://www.sec.gov/files/2026-exam-priorities.pdf)
- [SEC Press Release: 2026 Examination Priorities](https://www.sec.gov/newsroom/press-releases/2025-132-sec-division-examinations-announces-2026-priorities)
- [SEC Daly Speech: AI and Future of Investment Management (2026-02-03)](https://www.sec.gov/newsroom/speeches-statements/daly-020326-artificial-intelligence-future-investment-management)
- [CFPB AI page](https://www.consumerfinance.gov/ai/)
- [CFPB AI Compliance Plan M-25-21 PDF (2025-09-26)](https://files.consumerfinance.gov/f/documents/cfpb_ai-compliance-plan_2025-09.pdf)
- [CFPB Advanced Technology page](https://www.consumerfinance.gov/rules-policy/advanced-technology/)
- [FTC Artificial Intelligence page](https://www.ftc.gov/industry/technology/artificial-intelligence)
- [Trump EO "Ensuring a National Policy Framework for AI" (2025-12-11) - WhiteHouse](https://www.whitehouse.gov/presidential-actions/2025/12/eliminating-state-law-obstruction-of-national-artificial-intelligence-policy/) (WebFetch 403、WebSearch snippet 経由)
- [Trump National AI Legislative Framework (2026-03-20) - WhiteHouse](https://www.whitehouse.gov/releases/2026/03/president-donald-j-trump-unveils-national-ai-legislative-framework/) (WebFetch 403、WebSearch snippet 経由)

#### 州法
- [Colorado SB 24-205 Colorado General Assembly](https://leg.colorado.gov/bills/sb24-205)
- [Colorado SB 24-205 bill text PDF](https://leg.colorado.gov/bill_files/47770/download)
- [Texas HB 149 official text PDF](https://capitol.texas.gov/tlodocs/89R/billtext/pdf/HB00149I.pdf)
- [Texas HB 149 Legiscan](https://legiscan.com/TX/text/HB149/id/3180120)
- [California AB 1018 official text](https://leginfo.legislature.ca.gov/faces/billNavClient.xhtml?bill_id=202520260AB1018)
- [Newsom SB 53 press release (2025-09-29)](https://www.gov.ca.gov/2025/09/29/governor-newsom-signs-sb-53-advancing-californias-world-leading-artificial-intelligence-industry/)
- [NYC DCWP AEDT page](https://www.nyc.gov/site/dca/about/automated-employment-decision-tools.page)

#### NIST 関連派生ドキュメント
- [CSA Agentic AI NIST RMF Profile v1 - Cloud Security Alliance](https://labs.cloudsecurityalliance.org/agentic/agentic-nist-ai-rmf-profile-v1/)
- [CSA NIST AI Agent Standards Research Note (2026-04)](https://labs.cloudsecurityalliance.org/research/csa-research-note-nist-ai-agent-standards-initiative-2026040/)
- [CSA AI Agent Governance Framework Gap (2026-04)](https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-agent-governance-framework-gap-20260403/)
- [CSA Federal Agentic AI Security NIST Standards Initiative](https://labs.cloudsecurityalliance.org/research/csa-research-note-nist-ai-agent-standards-federal-framework/)
- [CLTC UC Berkeley: Agentic AI Risk-Management Standards Profile](https://cltc.berkeley.edu/publication/agentic-ai-risk-profile/)
- [Microsoft: Architecting Trust - NIST framework for AI Agents](https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/architecting-trust-a-nist-based-security-governance-framework-for-ai-agents/4490556)

#### Cloudflare Web Bot Auth(技術標準)
- [Cloudflare Web Bot Auth blog (initial)](https://blog.cloudflare.com/web-bot-auth/)
- [Cloudflare Verified Bots with Cryptography blog](https://blog.cloudflare.com/verified-bots-with-cryptography/)
- [Cloudflare Signed Agents blog](https://blog.cloudflare.com/signed-agents/)
- [Cloudflare Agent Registry blog](https://blog.cloudflare.com/agent-registry/)
- [Cloudflare Web Bot Auth docs](https://developers.cloudflare.com/bots/reference/bot-verification/web-bot-auth/)
- [GitHub cloudflare/web-bot-auth repository](https://github.com/cloudflare/web-bot-auth)

### 二次資料(法律事務所クライアントアラート)

#### FTC / Trump EO 関連
- [Paul Hastings: Trump EO Challenging State AI Laws (2025-12)](https://www.paulhastings.com/insights/client-alerts/president-trump-signs-executive-order-challenging-state-ai-laws)
- [DLA Piper: New EO Aims to Preempt State AI Regulation (2025-12)](https://www.dlapiper.com/en-us/insights/publications/2025/12/new-executive-order-aims-to-preempt-state-ai-regulation)
- [Latham & Watkins: AI EO Targets State Laws (2025-12)](https://www.lw.com/en/insights/ai-executive-order-targets-state-laws-and-seeks-uniform-federal-standards)
- [Gibson Dunn: Trump's Latest AI EO Preempts State Laws](https://www.gibsondunn.com/president-trump-latest-executive-order-on-ai-seeks-to-preempt-state-laws/)
- [Sidley: Unpacking 12/11/2025 EO](https://www.sidley.com/en/insights/newsupdates/2025/12/unpacking-the-december-11-2025-executive-order) (WebFetch 403)
- [Crowell & Moring: EO Tries to Thwart Onerous AI State Regulation](https://www.crowell.com/en/insights/client-alerts/executive-order-tries-to-thwart-onerous-ai-state-regulation-calls-for-national-framework)
- [Seyfarth Shaw: Trump EO Centralizing Federal Oversight](https://www.seyfarth.com/news-insights/president-trump-signs-executive-order-preempting-state-ai-laws-and-centralizing-federal-oversight.html)
- [Orrick: 5 Things About Trump's AI EO (2025-12)](https://www.orrick.com/en/Insights/2025/12/5-Things-to-Know-About-Trumps-AI-Executive-Order)
- [Sullivan & Cromwell: Trump National Policy Framework AI (2026-03)](https://www.sullcrom.com/insights/memo/2026/March/White-House-Releases-National-Policy-Framework-AI)
- [Mayer Brown: Trump Legislative Recommendations Federal AI (2026-03)](https://www.mayerbrown.com/en/insights/publications/2026/03/trump-administration-issues-legislative-recommendations-for-a-federal-artificial-intelligence-framework)
- [O'Melveny: Trump AI Action Plan EOs Promote Innovation](https://www.omm.com/insights/alerts-publications/trump-administration-releases-ai-action-plan-and-issues-executive-orders-to-promote-innovation/)
- [Ropes & Gray: White House Legislative Recommendations (2026-03)](https://www.ropesgray.com/en/insights/alerts/2026/03/the-white-house-legislative-recommendations-national-policy-framework-for-artificial-intelligence-an)
- [Baker Botts: March 2026 Federal Deadlines AI Regulatory](https://ourtake.bakerbotts.com/post/102mirs/march-2026-federal-deadlines-that-will-reshape-the-ai-regulatory-landscape)
- [Benesch Law: Operation AI Comply One Year In (Trump admin continuation)](https://www.beneschlaw.com/insight/one-year-in-ftcs-operation-ai-comply-continues-under-new-administration-signaling-enduring-enforcement-focus/)
- [Lathrop GPM: FTC AI Enforcement Section 5](https://www.lathropgpm.com/insights/transparency-and-ai-ftc-launches-enforcement-actions-against-businesses-promoting-deceptive-ai-product-claims/)
- [ABA: Consumer Protection FTC Section 5(a) Age of AI (Winter 2026)](https://www.americanbar.org/groups/business_law/resources/business-lawyer/2026-winter/consumer-protection-ftc/)
- [TechPolicy.Press: FTC's AI Preemption Authority Limited](https://www.techpolicy.press/the-ftcs-ai-preemption-authority-is-limited/)
- [Mintz: Emerging Federal AI Strategy FTC Sets Aside Rytr (2026-02)](https://www.mintz.com/insights-center/viewpoints/54731/2026-02-13-emerging-federal-ai-strategy-ftc-sets-aside-rytr)
- [OpenClawAI: FTC AI Policy Statement Agent Enforcement](https://openclawai.io/blog/ftc-ai-policy-statement-agent-enforcement/)

#### NIST / FinCEN / Tornado Cash 関連
- [Jones Walker: NIST AI Agent Standards Initiative](https://www.joneswalker.com/en/insights/blogs/ai-law-blog/nists-ai-agent-standards-initiative-why-autonomous-ai-just-became-washingtons.html)
- [Money Laundering Watch: Tornado Cash Jury Deadlocked (2025-08)](https://www.moneylaunderingnews.com/2025/08/tornado-cash-jury-deadlocked-on-most-serious-charges-but-convicted-founder-roman-storm-on-conspiracy-to-operate-an-unlicensed-money-transmitting-business/)
- [Money Laundering Watch: Samourai Wallet Developers (2025-12)](https://www.moneylaunderingnews.com/2025/12/the-prosecution-of-samourai-wallet-developers-expanding-the-reach-of-crypto-enforcement/)
- [Mayer Brown: Tornado Cash Mixed Verdict (2025-08)](https://www.mayerbrown.com/en/insights/publications/2025/08/the-tornado-cash-trials-mixed-verdict-implications-for-developer-liability)
- [Hodder Law: Roman Storm Verdict for Crypto Developers](https://hodder.law/roman-storm-tornado-cash-verdict-crypto-developers/)
- [Mondaq: Tornado Cash for DeFi (2025-12)](https://www.mondaq.com/fin-tech/1701562/when-code-becomes-conduct-what-the-tornado-cash-verdict-means-for-defi)
- [The Defiant: Roman Storm Acquittal Bid](https://thedefiant.io/news/regulation/tornado-cash-developer-roman-storm-awaits-judge-s-ruling-on-acquittal-bid)
- [The Block: Storm Fate Unclear Says Judge](https://www.theblock.co/post/396922/tornado-cash-developer-roman-storms-fate-unclear-says-judge-failla)

#### SEC / Banking 関連
- [Cleary Enforcement Watch: SEC Exam Priorities 2026](https://www.clearyenforcementwatch.com/2025/11/sec-exam-priorities-2026-priorities-largely-consistent-will-approach-to-deficiencies-and-enforcement-referrals-change/)
- [Akin: SEC 2026 Exam Priorities](https://www.akingump.com/en/insights/alerts/sec-announces-2026-exam-priorities)
- [Comply: SEC 2026 Exam Priorities](https://www.comply.com/resource/secs-2026-exam-priorities/)
- [Grant Thornton: SEC 2026 Examination Priorities](https://www.grantthornton.com/insights/articles/asset-management/2026/sec-reveals-examination-priorities)
- [Kitces: SEC AI Compliance Frameworks](https://www.kitces.com/blog/artificial-intelligence-compliance-considerations-investment-advisers-sec-securities-exchange-commission-legal-regulation-framework/)
- [Crowell & Moring: SEC Investor Advisory AI Disclosure](https://www.crowell.com/en/insights/client-alerts/investor-advisory-committee-recommends-sec-disclosure-guidelines-for-artificial-intelligence)
- [Sullivan & Cromwell: OCC/Fed/FDIC Revised MRM Guidance (2026-04)](https://www.sullcrom.com/insights/memo/2026/April/OCC-Fed-FDIC-Issue-Revised-Guidance-Model-Risk-Management)
- [Davis Polk: Visual Memo on Revised MRM Guidance](https://www.davispolk.com/insights/client-update/visual-memo-key-changes-under-federal-banking-agencies-revised-model-risk)
- [Cutover: SR 26-2 and Agentic AI](https://cutover.com/blog/what-sr-26-2-means-for-banks-deploying-agentic-ai)
- [AI2Work: Fed and OCC Leave AI Uncharted](https://ai2.work/blog/fed-and-occ-overhaul-bank-model-risk-rules-but-leave-ai-uncharted)
- [Domino.ai: SR 26-2 Explained](https://domino.ai/data-science-dictionary/sr-26-2)
- [ValidMind: SR 26-2 What Every Bank Needs to Know](https://validmind.com/blog/sr-26-2-what-every-bank-needs-to-know-and-why-acting-now-is-a-competitive-advantage/)
- [GAICC: AI Governance in Banking SR 11-7](https://gaicc.org/blog/ai-governance-banking-financial-services-sr-11-7-occ-usa/)

#### CFPB / Stablecoin 関連
- [Skadden: CFPB Adverse Action AI Models (2024-01)](https://www.skadden.com/insights/publications/2024/01/cfpb-applies-adverse-action-notification-requirement)
- [McGlinchey Stafford: CFPB AI Employment Decisions](https://www.mcglinchey.com/insights/cfpb-issues-new-guidance-on-ai-in-employment-decisions/)
- [Lexology: CFPB AI Credit Decisions Guidance](https://www.lexology.com/library/detail.aspx?g=b4313663-8f88-4013-81b7-cd36c5ed9291)
- [Consumer Finance Monitor: CFPB Funding Need (2025-12)](https://www.consumerfinancemonitor.com/2025/12/05/cfpb-tells-president-congress-it-will-need-279-6-million-to-continue-statutorily-required-operations-through-september-30-2026/)
- [EPI: Trump Closes CFPB](https://www.epi.org/policywatch/trump-administration-closes-the-cfpb/)
- [NPR: 24 States Sue Trump over CFPB Funding](https://www.npr.org/2025/12/22/nx-s1-5652043/cfpb-trump-russell-vought-lawsuit)
- [CNN: Judge Rebuffs CFPB Shutdown (2025-12-30)](https://www.cnn.com/2025/12/30/politics/cfbp-funding-lawsuit-rejected)
- [Paul Hastings: GENIUS Act Comprehensive Guide](https://www.paulhastings.com/insights/crypto-policy-tracker/the-genius-act-a-comprehensive-guide-to-us-stablecoin-regulation)
- [Sidley: GENIUS Act Framework (2025-07)](https://www.sidley.com/en/insights/newsupdates/2025/07/the-genius-act-a-framework-for-us-stablecoin-issuance)
- [JAMS ADR: GENIUS Act Reshaping Stablecoin Regulation](https://www.jamsadr.com/insight/2025/how-the-genius-act-is-reshaping-stablecoin-regulation-and-emerging)
- [Sumsub: Travel Rule US Jurisdictional 2025](https://sumsub.com/blog/crypto-travel-rule-us/)
- [Hacken: Crypto Travel Rule Global VASP](https://hacken.io/discover/crypto-travel-rule/)
- [Fraxtional: Stablecoin Compliance KYC Travel Rule](https://fraxtional.co/feeds/blog/stablecoin-compliance)

#### 州法 alerts
- [Akin: Colorado Postpones SB 24-205](https://www.akingump.com/en/insights/ai-law-and-regulation-tracker/colorado-postpones-implementation-of-colorado-ai-act-sb-24-205)
- [Brownstein: Colorado Landmark AI Coming Online](https://www.bhfs.com/insight/colorados-landmark-ai-law-coming-online-what-developers-and-deployers-should-know/)
- [Clark Hill: Colorado AI Act Update SB 26-189](https://www.clarkhill.com/news-events/news/colorado-ai-act-update-sb26-189-key-changes-2027/)
- [Consumer Finance Monitor: Colorado Rewrites AI Law](https://www.consumerfinancemonitor.com/2026/05/12/colorado-rewrites-its-landmark-ai-law-unpacking-sb-26-189-and-what-it-means-for-businesses/)
- [Seyfarth Shaw: Colorado AI Replacement Law](https://www.seyfarth.com/news-insights/colorado-enacts-artificial-intelligence-replacement-law.html)
- [Nixon Peabody: Colorado Repeal Replace AI Act](https://www.nixonpeabody.com/insights/alerts/2026/05/14/colorado-legislature-passes-bill-to-repeal-and-replace-the-colorado-ai-act)
- [Finnegan: Colorado SB 26-189 Framework](https://www.finnegan.com/en/insights/articles/colorado-replaces-landmark-ai-act-an-overview-of-the-new-sb-26-189-framework.html)
- [Ogletree: Colorado New AI Act ADM Consequential](https://ogletree.com/insights-resources/blog-posts/colorados-new-ai-act-targets-automated-decision-making-for-consequential-decisions/)
- [Epstein Becker Green: Colorado SB 26-189 Employers](https://www.workforcebulletin.com/inside-colorados-senate-bill-26-189-impacts-and-implications-for-employers)
- [Latham: Texas Signs TRAIGA](https://www.lw.com/en/insights/texas-signs-responsible-ai-governance-act-into-law)
- [Baker Botts: Texas TRAIGA (2025-07)](https://www.bakerbotts.com/thought-leadership/publications/2025/july/texas-enacts-responsible-ai-governance-act-what-companies-need-to-know)
- [Norton Rose Fulbright: Texas TRAIGA Before Jan 1](https://www.nortonrosefulbright.com/en/knowledge/publications/c6c60e0c/the-texas-responsible-ai-governance-act)
- [K&L Gates: Pared Back TRAIGA](https://www.klgates.com/Pared-Back-Version-of-the-Texas-Responsible-Artificial-Intelligence-Governance-Act-Signed-Into-Law-6-24-2025)
- [TechPolicy.Press: Texas New Model State AI Regulation](https://www.techpolicy.press/texas-just-created-a-new-model-for-state-ai-regulation/)
- [Morgan Lewis: California Vetoes SB 1047, Signs AB 2013 (2024-10)](https://www.morganlewis.com/pubs/2024/10/california-governor-vetoes-ai-safety-bill-sb-1047-signs-ab-2013-requiring-generative-ai-transparency)
- [Cooley: California's New AI Laws (2024-10)](https://www.cooley.com/news/insight/2024/2024-10-16-californias-new-ai-laws-focus-on-training-data-content-transparency)
- [Crowell & Moring: CA AB 2013 (Generative AI Data Disclosure)](https://www.crowell.com/en/insights/client-alerts/californias-ab-2013-requires-generative-ai-data-disclosure-by-january-1-2026)
- [DLA Piper: California Sweeping AI Regulation (2024-10)](https://www.dlapiper.com/en-us/insights/publications/2024/10/california-enacts-sweeping-new-ai-regulation)
- [White & Case: California TFAIA Enacted (SB 53)](https://www.whitecase.com/insight-alert/california-enacts-landmark-ai-transparency-law-transparency-frontier-artificial)
- [Latham: California Lead US AI Regulator (2025-10)](https://www.lw.com/en/insights/california-assumes-role-as-lead-us-regulator-of-ai)
- [Carnegie Endowment: California SB 53 First Frontier AI Law](https://carnegieendowment.org/emissary/2025/10/california-sb-53-frontier-ai-law-what-it-does)
- [Brookings: California's AI Safety Law](https://www.brookings.edu/articles/what-is-californias-ai-safety-law/)
- [Future of Privacy Forum: California SB 53 Explained](https://fpf.org/blog/californias-sb-53-the-first-frontier-ai-law-explained/)
- [Goodwin: California Frontier AI Catastrophic Risk](https://www.goodwinlaw.com/en/insights/publications/2025/11/alerts-technology-aiml-california-moves-to-regulate-frontier-ai-with-a-focus-on-catastrophic-risk)
- [Fisher Phillips: California AB 1018 Anti-Discrimination](https://www.fisherphillips.com/en/news-insights/california-introduces-another-ai-anti-discrimination-bill.html)
- [CSA: AB 1018 California AI Regulation](https://cloudsecurityalliance.org/blog/2025/09/05/ab-1018-california-s-upcoming-ai-regulation-and-what-it-means-for-companies)
- [Pillsbury: SB 1047 and 38 AI Laws California](https://www.pillsburylaw.com/en/news-and-insights/sb-1047-california-ai-laws.html)
- [California Lawyers Association: AI and Privacy](https://calawyers.org/privacy-law/ai-and-privacy-a-guide-to-californias-recently-passed-legislation/)
- [Skadden: NY Enacts AI Transparency Law (RAISE Act, 2026-01)](https://www.skadden.com/insights/publications/2026/01/new-york-enacts-ai-transparency-law)
- [Deloitte: NYC Local Law 144 Algorithmic Bias](https://www.deloitte.com/us/en/services/audit-assurance/articles/nyc-local-law-144-algorithmic-bias.html)
- [DLA Piper: NYC AI Hiring Audit Risk (2026)](https://knowledge.dlapiper.com/dlapiperknowledge/globalemploymentlatestdevelopments/2026/New-York-Critical-audit-of-New-York-Citys-AI-hiring-law-signals-increased-risk-for-employers)

#### Money Transmitter / MTL 関連
- [Ridgeway Financial: MTL Requirements by State](https://www.ridgewayfs.com/money-transmitter-license-requirements-by-state/)
- [Finextra: MTL in 2026 Requirements (Shrivastava)](https://www.finextra.com/blogposting/30783/money-transmitter-license-in-2026-requirements-costs-and-a-practical-roadmap-for-fintechs)
- [Brico: MSB vs MTL Federal Registration vs State](https://www.brico.ai/post/msb-vs-money-transmitter-license)
- [Cogent Law: MTL Licensing for Fintech & Crypto](https://cogentlaw.com/money-transmitter-licensing-what-fintechs-and-crypto-companies-need-to-know-article/)
- [Fenergo: How To Get MTL](https://resources.fenergo.com/blogs/how-to-get-a-money-transmitter-license)

### 業界・研究レポート
- [TechPolicy.Press: Timeline of Trump White House AI Actions](https://www.techpolicy.press/timeline-of-trump-white-house-actions-and-statements-on-artificial-intelligence/)
- [TechPolicy.Press: Texas New Model State AI Regulation](https://www.techpolicy.press/texas-just-created-a-new-model-for-state-ai-regulation/)
- [VerifyWise: US AI Regulations 2026 Federal Orders State Laws](https://verifywise.ai/blog/state-of-ai-governance-regulations-united-states-2026)
- [Wilson Sonsini: 2026 Year in Preview AI Regulatory](https://www.wsgr.com/en/insights/2026-year-in-preview-ai-regulatory-developments-for-companies-to-watch-out-for.html)
- [Skadden: 2026 Insights - Government Regulation of AI](https://www.skadden.com/insights/publications/2026/2026-insights/sector-spotlights/dont-believe-the-hype)
- [Davis Polk: AI page](https://www.davispolk.com/artificial-intelligence)
- [Benton: Trump EOs Shape Federal AI Regulation](https://www.benton.org/blog/trump-executive-orders-shape-federal-ai-regulation-and-override-state-actions)
- [Epstein Becker Green: AI Regulation at Crossroads Preemption](https://www.workforcebulletin.com/artificial-intelligence-regulation-at-a-crossroads-the-trump-administrations-preemption-push)
- [Zwillgen: Trump EO Targets State AI Laws](https://www.zwillgen.com/artificial-intelligence/trump-executive-order-targets-state-ai-laws/)
- [Holland & Knight: US Companies EU AI Act August 2026](https://www.hklaw.com/en/insights/publications/2026/04/us-companies-face-eu-ai-acts-possible-august-2026-compliance-deadline)
- [BVNK: Global Stablecoin Regulations 2026](https://bvnk.com/blog/global-stablecoin-regulations-2026)

### Coin Center / Blockchain Association(業界団体)
- [Blockchain Association response to Tornado Cash verdict (via Money Laundering Watch coverage)](https://www.moneylaunderingnews.com/2025/08/tornado-cash-jury-deadlocked-on-most-serious-charges-but-convicted-founder-roman-storm-on-conspiracy-to-operate-an-unlicensed-money-transmitting-business/)
- [Solana Policy Institute statement on Tornado Cash conviction (via Hodder Law coverage)](https://hodder.law/roman-storm-tornado-cash-verdict-crypto-developers/)
- [Blockworks: Tornado Cash Conviction Open-Source Developer Risk](https://blockworks.co/news/opinion-tornado-cash-conviction-raises-alarm)

---

## 8. W4 以降の深掘り項目

- [ ] **NIST AI Agent IO Profile draft v1**(Q4 2026 release 直後)の verbatim 精読、KYA SDK との互換性詳細評価
- [ ] **FTC AI Policy Statement(2026-03-11)正式文書** の verbatim 確認(WebFetch 403 のため 2026-06 時点で外部要約のみ)
- [ ] **Trump EO(2025-12-11)WhiteHouse 公式文書** の verbatim 確認(WebFetch 403、WebSearch snippet 経由のみ)
- [ ] **GENIUS Act 施行規則** の OCC / Fed NPRM 精読(2026-03-02 NPRM 確認済、最終規則 = 2026-Q4 〜 2027-Q1 想定)
- [ ] **SR 26-2 RFI** が agentic AI を扱う場合の verbatim 確認(発表時期: 2026-Q3-Q4 想定)
- [ ] **Tornado Cash retrial(2026-10 開始予定)** の結果が判明した時点で KYA SDK 設計 / 法人設立判断への影響再評価
- [ ] **NIST CAISI への formal engagement**: 公開コメント期間に KYA 視点の input、reference implementation としての positioning
- [ ] **Web Bot Auth IETF draft** の verbatim 精読、KYA SDK との互換 / 競合関係の評価(`tracks/C-tech-trends/` に移管検討)
- [ ] **JP(AI 推進法、金融庁 AI ガバナンス検討会)、UK(FCA AI、Sandbox)、SG(MAS FEAT、Veritas)、UAE(VARA AI Charter)** で同論点を別ファイルで完了(W4-W6)
- [ ] **弁護士確認**(Phase 1 で実施): KYA SDK が (a) NIST AI "system" 定義非該当、(b) FinCEN money transmitter 非該当、(c) GENIUS Act stablecoin issuer 非該当、(d) Tornado Cash 型 18 USC §1960 起訴防御の弁護士アドバイス(Davis Polk / Latham / Skadden / Gibson Dunn 候補)
- [ ] **AWS Bedrock AgentCore + Cloudflare Web Bot Auth + KYA Bridge** の glue が NIST IO Profile Q4 2026 reference implementation として位置取れるかの技術検証(`tracks/C-tech-trends/` クロスリファレンス)

---

## 9. 注意・免責

- 本ドキュメントは **法律意見ではない**。リサーチドキュメント。最終判断は弁護士確認必須。
- WhiteHouse、Sidley、CFPB、Federal Reserve 等の主要一次・二次資料サイトが WebFetch では 403 で取得できず、WebSearch スニペット経由で確認。条文 verbatim 引用は **CFR、Congress.gov、NIST.gov 経由** で取れた範囲 + 二次資料スニペット経由の引用を組み合わせ。**critical な決定の前にコタさんが Congress.gov / WhiteHouse.gov / NIST.gov で原文確認すること推奨**。
- "推定"、"確度: 中"、"暫定" 等の表記は意図的に使用。確定情報と推定を区別。
- Tornado Cash retrial が 2026-10 から開始される可能性が高く、本ドキュメントの **KYA 刑事リスク評価は判決時点で更新が必要**。本ドキュメントは 2026-06-01 時点の評価。
- Trump EO 2025-12-11、FTC AI Policy Statement 2026-03-11、SR 26-2 2026-04-17、Colorado SB 26-189(2026-05-14)、NIST AI Agent Standards Initiative 2026-02-17 launch は **直近 6 ヶ月で連続発出された規制群**。政治的・規制的不確実性が極めて高い期間にあり、**6 ヶ月単位での再評価が必要**。
- 弁護士の意見と当局見解は本ドキュメント内で区別(章末注記、弁護士見解は事務所名・日付付き)。
