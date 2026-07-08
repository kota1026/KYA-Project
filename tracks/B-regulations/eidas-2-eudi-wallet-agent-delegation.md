---
topic: eIDAS 2.0 + EUDI Wallet ARF が AI agent / delegation を扱う時期と KYA Project の参入経路
slug: eidas-2-eudi-wallet-agent-delegation
last_updated: 2026-06-01
jurisdictions: [EU]
relevance_to_kya: critical
status: draft (W3 deep-dive)
disclaimer: これは法律意見ではない。リサーチドキュメント。最終判断は弁護士確認必須。
---

# 論点: eIDAS 2.0 + EUDI Wallet ARF が AI agent / delegation を公式定義する時期と、KYA Project の参入経路

## TL;DR(結論先出し)

| 設問 | 答え | 根拠 |
|------|------|------|
| **EUDI Wallet ARF は AI agent delegation を公式定義しているか?** | **No(2026-06-01 時点)** | ARF v2.9.0(2026-05-11 release)Annex 1 definitions に "agent" "delegation" "mandate" 定義語なし。Topic I 討議論文 v0.4(2025-05-20)も natural person ↔ natural person 限定で AI agent 言及ゼロ |
| **EU は 2027-2028 までに agent delegation 枠組みを作る予定か?** | **Yes(EBW 提案で確定方向)** | COM(2025) 838 final(2025-11-19、European Business Wallet 規則案)Recital 28 が "agentic AI" を新規 use case として implementing acts 委任で明示。EP rapporteur draft 2026-03-20 公表 |
| **agent delegation の公式定義は ARF v3.0 で出る予定か?** | **未確定(推定: 2027-Q1〜Q4)** | 2026 iteration calendar(全 7 iterations、Iteration 1 = 2026-02-25〜04-29)。Topic I 反映は推定 ARF v2.11/v2.12(2026-Q4)。Agentic AI 専用 topic は Iteration 8+(2027 起算)になる見込み |
| **KYA Project は EU 市場形成期間に何を取れるか?** | **Non-qualified EAA Provider + ARF contributor + KYA reference impl 標準化** | QTSP 認定は SME 非現実(初期数十万 EUR、6-12 ヶ月、HSM FIPS 140-2 L3 必須、24 ヶ月毎 audit)。non-qualified EAA + W3C VC profile + WE BUILD 連携が現実解 |
| **2026-Q4〜2027-Q4 の独占的市場形成期間は本当に存在するか?** | **Yes(条件付き、確度: 中-高)** | EUDI Wallet 2026-12 提供義務、2027-12 受入義務、EBW 2028-? application。ARF agent delegation 確定は 2027-Q4 以降 → **空白期間 12-15 ヶ月** |

**1 行で**: EUDI Wallet 本体は人間用、2026-12 GA。**EU は agent delegation を EBW(COM 2025/838)で別 regulation 化する方向に舵を切った**(2025-11-19 提案、Recital 28 で agentic AI を明示)。EBW の application は 2028 以降、ARF v3.x で agent delegation が定義されるまでの **12-15 ヶ月が KYA Project の独占的参入期間**(推定、確度: 中-高)。

---

## 1. 論点の定義

**問い**: EU の eIDAS 2.0(Regulation (EU) 2024/1183)と EUDI Wallet Architecture Reference Framework(ARF)が、AI agent / autonomous agent / delegation chain をいつ・どう公式に定義するか?KYA Project はその「定義前」の空白期間に **どんなポジションを取れるか**?

**なぜ KYA に関係するか**: KYA Project = **AWS x402 ecosystem 専用 KYA 実装 + 規制 attestation packaging specialist**(`synthesis/decision-doc.md` §0、W2 暫定)。EU 市場では eIDAS 2.0 attestation 形式(SD-JWT VC + mdoc)を使った agent identity attestation の発行・検証が事業の柱の一つ。**EUDI Wallet が agent delegation を定義する前に、その attestation provider のポジションを取れるかが戦略上の核心**。

**今回のスコープ**: EU 単一法域。eIDAS 2.0 本体 + ARF + LSPs(Large Scale Pilots)+ EBW(European Business Wallet)+ QTSP 認定経路を網羅。米国 / 日本 / 英国 / シンガポール / UAE は別ファイル。

**W2 文書からの派生**: `tracks/B-regulations/eu-ai-act-agent-identity-mandate.md` §2.3 サブ論点 8 で「ARF v2.8.0 は delegation を未定義」「2026-Q4〜2027-Q4 が KYA の独占的市場形成期間」と暫定。本稿は **この暫定を W3 深掘りで検証 + EBW 提案発見で再フレーム**。

---

## 2. EU 法域マッピング(eIDAS 2.0 + ARF + EBW + LSPs + QTSP)

### 2.1 適用法体系(eIDAS 2.0 系)

| 規制 / 文書 | 種別 | 公表 / 発効 | 適用日 | 法的拘束力 |
|-------------|------|-------------|--------|------------|
| Regulation (EU) 2024/1183 | **eIDAS 2.0(本体)** | 2024-05-20 OJ 公表、20日後発効 | 加盟国 wallet 提供義務 **2026-12-21**(Art. 5a(1) + 移行期間)/ 受入義務 **2027-12** | **直接適用、拘束力強** |
| Commission Implementing Regulations(全 30+ CIR/CID、2024-2025 採択) | **Implementing Acts** | 2024-12〜2025 順次 OJ 公表 | 親規則と連動 | **拘束力強** |
| EUDI Wallet Architecture Reference Framework(ARF) | **ガイドライン** | v2.9.0 = 2026-05-11、GitHub 公開 | 適用日なし | **legally not mandatory**(ただし Implementing Acts 更新時の Commission 参照元) |
| **COM(2025) 838 final**(European Business Wallet) | **Proposed Regulation** | 2025-11-19 EC 提案、2026-03-20 EP rapporteur draft | 未定(推定 2027-Q4 採択、2028 application) | **提案段階、未拘束** |
| Large Scale Pilots(EWC / POTENTIAL / NOBID / DC4EU + APTITUDE / WE BUILD) | **試験プロジェクト** | 2023-04 開始(第1世代)、2025-09 第2世代 launch | 推定 2026 末まで継続 | **non-binding、ARF 改訂入力源** |

出典:
- [Regulation (EU) 2024/1183 - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/1183/oj/eng)(WebFetch 403、Article 5a verbatim は web ミラー経由)
- [Article 5a to 5f - eIDAS 2 text](https://www.european-digital-identity-regulation.com/Article_5a_(Regulation_EU_2024_1183).html)(403、WebSearch snippet 経由)
- [EUDI Wallet ARF GitHub repository](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework)
- [COM(2025) 838 final - EUR-Lex](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex:52025PC0838)(403、Eerste Kamer ミラー [PDF](https://www.eerstekamer.nl/bijlage/20251121/com_2025_838_proposal_for_a/document3/f=/vmsoctgrbbeb.pdf) 経由でメタ確認のみ、403)
- [EU Digital Identity Wallet Pilot implementation](https://digital-strategy.ec.europa.eu/en/policies/eudi-wallet-implementation)
- アクセス全て 2026-06-01

### 2.2 eIDAS 2.0 Article 5a の representation 関連条文

#### Article 3(定義)— "User" の定義

WebSearch snippet 経由(原文 verbatim 確認は EUR-Lex 403 のため間接):

> "**user** means a natural or legal person, or a natural person representing another natural person or a legal person, that uses trust services or electronic identification means provided in accordance with this Regulation."

→ **agent / AI / autonomous system は user 定義の外**。"natural person representing another natural person or a legal person" のみが representation を捕捉。

出典: [Article 3 - eIDAS 2 text](https://www.european-digital-identity-regulation.com/Article_3_(Regulation_EU_2024_1183).html)、アクセス 2026-06-01

#### Article 5a(5)(f)— EUDI Wallet の PID requirement

WebSearch snippet 経由:

> "Article 5a(5)(f): Person Identification Data must **uniquely represent the natural person, legal person or the natural person representing the natural or legal person**, and must be associated with that European Digital Identity Wallet."

→ ここでも "agent" の余地は存在せず、**natural person 中心**。Recital 60 群が representation 詳細を扱うが、現時点で agent / AI 関連の verbatim 確認は未完(EUR-Lex 403)。

#### Article 5a(5)(g)— Implementing Acts への委任

5a(5) は Implementing Acts で技術仕様を整備する権限を Commission に委任。**ARF はこの Implementing Acts の前段ガイドラインとして機能**するが法的拘束力なし。Commission は ARF を "take into account" するのみ。

出典: [Article 5a to 5f - eIDAS 2 text](https://www.european-digital-identity-regulation.com/Article_5a_(Regulation_EU_2024_1183).html)、[Self-Sovereign Identity and eIDAS 2.0 - arXiv 2601.19837](https://arxiv.org/html/2601.19837v2)、アクセス 2026-06-01

#### 「mandate scope は eID notification process に書かれているが evidence requester には届かない」問題

WebSearch snippet 経由(arXiv):

> "The scope of powers or mandates may be described in the notification process of eID schemes that concern either legal persons or natural persons representing legal persons, but **this information is not available to the evidence requester and there is no agreed syntax to encode it**."

→ **2026-06-01 時点で EU 全体に共通する mandate encoding syntax が存在しない**。これは KYA Project の戦略的余白の **法的根拠**。

出典: [Self-Sovereign Identity and eIDAS 2.0: An Analysis - arXiv 2601.19837](https://arxiv.org/html/2601.19837v2)、アクセス 2026-06-01

### 2.3 EUDI Wallet ARF 現状(v2.9.0、2026-05-11)— delegation / agent の扱い

**ARF v2.9.0 リリース履歴の verbatim 確認(GitHub CHANGELOG 経由)**:

- **v2.8.0** = 2026-02-02 release。Member States feedback on Annex 2、4 discussion papers 統合(Topic T / AA / E / R = wallet provider support、payment SCA、pseudonyms、device authentication)
- **v2.9.0** = 2026-05-11 release。ENISA security feedback、Commission TS3 alignment、Wallet Unit Attestations(WUA)Revision Round 統合
- **Topic I(natural person representing another natural person)** = **v2.2.0(2025-06-20)で初統合**、Iteration 5(2026 サイクル、refinement round)で再オープン中

出典: [EUDI ARF CHANGELOG.md](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/CHANGELOG.md)、[Discussion topics README](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/docs/discussion-topics/README.md)、アクセス 2026-06-01

#### 2.3.1 ARF Annex 1(Definitions)— "agent" "delegation" "mandate" は **未定義**

WebFetch verbatim 確認(GitHub raw 経由):

- 定義あり: "User"(natural or legal person, or a natural person representing another)、"PID"、"QEAA"、"PuB-EAA"、"EAA"、"Attestation"、"Attestation Provider"
- **定義なし: "delegation" "mandate" "agent" "autonomous system" "AI"**

これは ARF が「人間中心の identity attestation」フレームを保持し、agent delegation 概念を **意図的に未定義のまま** にしていることを示す。

出典: [ARF Annex 1 - Definitions(raw GitHub)](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/docs/annexes/annex-1/annex-1-definitions.md)、アクセス 2026-06-01

#### 2.3.2 Discussion Topic I(Natural person representing another natural person)— v0.4(2025-05-20)

WebFetch verbatim 確認(GitHub raw 経由):

> "**Discussion Paper Version 0.4, updated 20 May 2025**, in draft form."
> 
> 提案内容:
> - representation 用 distinct attestation type を新設
> - "must specify the nature of the representation and clearly define the operations that the representative is authorized to perform"
> - "must be either short-lived or revocable"
> - "It SHALL NOT be possible to conceal this information"
> - 2 new requirements: Commission が Rulebook を作成、Attestation Providers が revocation 確保
> 
> **AI agent / autonomous agent / machine-to-machine 関連の言及は全くなし**(focus exclusively on natural persons: parents/guardians, caregivers, power of attorney holders)

出典: [Topic I Discussion Paper - i-natural-person-representing-another-natural-person.md(raw GitHub)](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/docs/discussion-topics/i-natural-person-representing-another-natural-person.md)、アクセス 2026-06-01

#### 2.3.3 Discussion Topic AA(Electronic Payments SCA with Wallet)— delegation 未扱い

WebFetch verbatim 確認:

> Topic AA は PSD2 SCA 3 use cases(payment 開始 / 口座 online アクセス / fraud risk remote actions)に限定。**delegation / agent / mandate / MIT / recurring 言及なし**。GitHub Discussion #582 では "third party requested flow" rename 議論や "Electronic Mandate" support の passing reference あるが、深い議論は未着手。

**EUDI Wallet SCA 公式見解(WebSearch 経由)**:
> "**Delegation of the authentication to a third party does not take place. However, SCA may be outsourced to wallet providers, but the Card issuers remain responsible for compliance.**"

→ **SCA delegation の third party は否定**、ただし wallet provider への outsourcing は許容。card issuer が compliance 責任を持つ。これは W2 文書(§2.3 サブ論点 7)で予測した PSD3/PSR delegation 構造と整合。

出典:
- [Topic AA Discussion Paper - aa-support-of-electronic-payments-SCA-with-wallet.md(raw GitHub)](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/docs/discussion-topics/aa-support-of-electronic-payments-SCA-with-wallet.md)
- [GitHub Discussion #582 - Topic AA](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/582)
- [Signicat: SCA with EUDI Wallets](https://www.signicat.com/blog/strong-customer-authentication-sca-with-eudi-wallets-what-financial-services-need-to-know)
- アクセス 2026-06-01

#### 2.3.4 2026 iteration calendar(全 7 iterations、15 topics)

GitHub raw verbatim:

| Iteration | Topics(refinement / new) |
|-----------|---------------------------|
| **Iteration 1**(2026-02-25 〜 2026-04-29) | C: Wallet Unit Attestation, X: Relying Party registration |
| **Iteration 2** | J: Wallet to Wallet interaction, U: EUDI Wallet Trust Mark |
| **Iteration 3** | E: Pseudonyms / User authentication |
| **Iteration 4** | AB: Digital Signature using EUDI Wallet(**新規**) |
| **Iteration 5** | L: User data deletion request, M: User reporting to DPAs, **I: Natural person representing another natural person**(refinement) |
| **Iteration 6** | F: Digital Credentials API, AC: Cryptographic binding of attestations(**新規**), G: ZKP |
| **Iteration 7** | AA: Electronic Payments SCA, AD: User binding in proximity flows(**新規**), AE: Liveness tests(**新規**) |

→ Iteration 1 完了 = 2026-04-29、ARF 反映 = 約 7 週後 = **2026-06 中旬の ARF v2.10(推定)**。同じペースで Iteration 5(Topic I 反映)= 推定 **2026-Q4 の ARF v2.12/v2.13**、Iteration 7(payment SCA)= 推定 **2027-Q1〜Q2 の ARF v3.0**。

→ **AI agent / agentic delegation 専用の discussion topic は 2026 iteration 計画に存在しない**。早ければ 2027 iteration(Iteration 8+)で取り上げられる可能性(推定、確度: 中)。

出典: [Discussion Topics README(raw GitHub)](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/docs/discussion-topics/README.md)、アクセス 2026-06-01

### 2.4 European Business Wallet(EBW)— agentic AI を明示する初の EU 法案

これが本稿の **最重要発見**。W2 文書時点で未認識。

#### 2.4.1 COM(2025) 838 final の概要

- **公表日**: **2025-11-19**(European Commission)
- **文書**: Proposal for a Regulation on the establishment of European Business Wallets
- **EP rapporteur draft report**: **2026-03-20** 公表
- **EDPS Opinion 5/2026**: 2026-01-20 公表
- **EUDI Wallet との関係**: 補完(legal entity 専用)

出典:
- [European business wallets - Legislative Train Schedule (EP)](https://www.europarl.europa.eu/legislative-train/theme-a-new-plan-for-europe-s-sustainable-prosperity-and-competitiveness/file-european-business-wallet)
- [European business wallets briefing - EPRS PDF](https://www.europarl.europa.eu/RegData/etudes/BRIE/2025/774703/EPRS_BRI(2025)774703_EN.pdf)
- [European Business Wallets - DG CONNECT policy page](https://digital-strategy.ec.europa.eu/en/policies/business-wallets)
- [EDPS Opinion 5/2026 PDF](https://www.edps.europa.eu/system/files/2026-01/26-01-20_opinion_establishment_of_european_business_wallets_en.pdf)(WebFetch 403)
- アクセス 2026-06-01

#### 2.4.2 EBW Recital 28 — agentic AI への明示的言及(verbatim)

WebSearch snippet 経由(2026-06-01 時点で原典 PDF 403 のため間接確認):

> **Recital 28**: "implementing powers should be conferred on the Commission to establish and update the procedures and technical specifications on the implementation of core functionalities, thereby **allowing for the integration of additional features and new technologies that would enable new use cases, such as agentic AI or the provision of a digital identity to an owner's asset**, and enabling the European Business Wallets to continue to support the evolving needs of economic operators in a secure and trustworthy manner."

→ これは **EU 公式法文として "agentic AI" を初めて明示**した瞬間。AI Act は agentic を定義していない(W2 文書で確認済)が、**EBW がそれを implementing acts 経由で取り込む権限を Commission に与える設計**。

出典: WebSearch via [Identity Week](https://identityweek.net/eu-commission-publishes-proposal-for-business-wallet/)(WebFetch 403)、[Baker McKenzie EU New Package Reforms AI and Data (2026-01)](https://www.bakermckenzie.com/en/insight/publications/2026/01/eu-new-package-reforms-ai-data-and-business-identity)、[WE BUILD Consortium press release](https://www.webuildconsortium.eu/news/european-commission-published-the-proposal-regulation-on-the-establishment-of-european-business-wallets)、アクセス 2026-06-01

#### 2.4.3 EBW のスコープ・タイムライン(WebSearch 経由)

- **economic operator(企業)向け**: business wallet 使用は **non-mandatory**(任意)
- **公共部門の受入義務**: regulation 適用後 **24 ヶ月以内** に core minimum functionalities を accept
- **採択時期(推定)**: 2026-Q4〜2027 EP / Council 通過、**OJ 公表 2027 Q1-Q2**(推定、確度: 中)
- **application 開始(推定)**: 2027 OJ + 24 ヶ月 = **2029 始動**(推定、確度: 中)

→ **EBW 公的施行までに 2.5-3 年の窓**。この間に KYA Project は agentic AI integration の reference implementation と attestation profile を提案できる。

出典: [Dock.io: EU Business Wallet - What You Need to Know](https://www.dock.io/post/eu-business-wallet-what-you-need-to-know-about-the-eus-digital-id-for-companies-video-and-takeaways)、[Spherity: European Business Wallet Strategic Pillar](https://medium.com/spherity/the-european-business-wallet-a-strategic-pillar-for-digital-identity-and-industrial-3f9983f7b299)、[Finextra: Mandatory European Business Wallets - Bo Harald](https://www.finextra.com/blogposting/30926/why-mandatory-european-business-wallets-in-public-sector-units-are-a-sea-change)、アクセス 2026-06-01

#### 2.4.4 EBW が KYA Project に与える戦略的意味

**3 つの含意**:

1. **EU は agent identity を eIDAS 本体ではなく EBW で扱う方向に舵を切った**。これは「eIDAS 2.0 自体は agent delegation を扱わない」「EBW Implementing Acts でじわじわ詰める」という **段階的取り込み戦略**。KYA Layer の独占的市場形成期間が 2027-Q4 から **2028-2029 まで延長される可能性**(推定、確度: 中)。

2. **agentic AI の "公式定義" は EBW Implementing Acts で固まる**。KYA Project が **EBW Implementing Acts 整備プロセスに reference implementation を提供** すれば、agent attestation の事実標準を握りに行ける。

3. **WE BUILD consortium が agent integration の non-paper を 2026-03 に Commission に提出済み**。KYA Project が WE BUILD と連携すれば、ARF/EBW 双方への技術的入力ルートが開く。

### 2.5 Large Scale Pilots(LSPs)— agent 関連の有無

**第1世代(2023-04 開始)**: EWC / POTENTIAL / NOBID / DC4EU(550+ 組織、26 EU 加盟国 + Norway/Iceland/Ukraine、€46M+ EU funding)

| LSP | スコープ | Agent 関連 |
|-----|----------|------------|
| **EWC**(EU Digital Identity Wallet Consortium) | Digital Travel Credentials | なし(人間旅行者中心) |
| **POTENTIAL** | 6 sectors(政府サービス、銀行、telecom、mobile driving license、e-signature、health) | なし(個別 sector の人間 user 中心) |
| **NOBID**(Nordic Baltic + Italy/Germany) | **支払い authorization**(EUDI Wallet の payment use case) | なし(個人 / 法人の payment、AI agent 言及なし) |
| **DC4EU** | 教育・社会保障 | なし |

**第2世代(2025-09 launch)**: APTITUDE / WE BUILD

| LSP | 国・パートナー | スコープ | Agent 関連 |
|-----|----------------|----------|------------|
| **APTITUDE** | 117 partners、11 加盟国(仏 coordinator、捷、独、希、伊、Latvia、Lithuania、蘭、波、葡) | 旅行、mobile vehicle registration | **明示なし**(travel & vehicle 中心) |
| **WE BUILD** | EU 加盟国 + 公共当局 + SME + 大企業、24 ヶ月 testing | **B2B / B2G / B2C payments**、**EBW pilot** | **明示あり(2026-03 non-paper)** ★ |

**WE BUILD が 2026-03 に発表した non-paper(超重要)**:

WebSearch verbatim 経由:

> "The EU should take a coordinated approach to integrating AI agents into digital transactions, with special attention on payments... Europe is well placed to shape the emerging landscape of 'agentic commerce,' in which AI systems act autonomously on behalf of users, businesses, and public bodies."
> 
> "The unique legal and technical foundations provided by the EUDI Wallet, the European Digital Identity Framework (EUDIF) and the Business Wallet framework will help address the trust, identity, and accountability challenges AI agents introduce."
> 
> "EU's tools could **enable mutual authentication between AI agents, verify the relationship between a human and their agent, and confirm that merchants are legitimate**."

→ **WE BUILD は agent ↔ agent mutual auth、human ↔ agent binding 検証、merchant legitimacy 確認を EUDI/EBW 上で実現することを公式に提唱**。これは KYA Project の核ユースケースと **完全に一致**。

出典:
- [What are the Large Scale Pilot Projects - EC EUDI Wallet](https://ec.europa.eu/digital-building-blocks/sites/spaces/EUDIGITALIDENTITYWALLET/pages/694487808/What+are+the+Large+Scale+Pilot+Projects)
- [Biometric Update: EU can rein in AI agents with EUDI Wallets and business wallets - WE BUILD](https://www.biometricupdate.com/202603/eu-can-rein-in-ai-agents-with-eudi-wallets-and-business-wallets-we-build)(403、WebSearch snippet 経由)
- [Biometric Update: New EU Large Scale Pilots launch (2025-09)](https://www.biometricupdate.com/202509/new-eu-large-scale-pilots-launch-to-develop-the-digital-identity-wallet-ecosystem)
- [Indicio: APTITUDE Digital Wallet Travel and Payments](https://indicio.tech/blog/indicio-to-advance-trusted-digital-identity-with-aptitude-europes-newest-large-scale-project-for-digital-wallet-travel-and-payments/)
- アクセス 2026-06-01

### 2.6 加盟国別 EUDI Wallet 実装状況(2026 春時点)

WebSearch 経由:

| 加盟国 | 状況 | 2026-12 提供義務達成見込み |
|--------|------|---------------------------|
| **France** | France Identité 本番稼働中、EUDI Wallet 化と RP 統合テスト開始 | **高**(top tier) |
| **Italy** | IT Wallet System(IO app 公的 wallet + 民間追加)、明示的 framework | **高** |
| **Germany** | **2027-01-02 launch announcement**(2026-12 遅延)、private market 翌年開放 | **遅延** |
| **Spain** | Cl@ve + national eID 既存システム統合の課題 | **遅延リスク** |
| **Netherlands** | **間に合わない見込み**(公式表明) | **遅延** |
| **Finland** | public resources 公開済み | **中** |
| Bulgaria | public resources 公開済み | 中 |

→ 加盟国の温度差が顕著。**フランス・イタリアが先行、ドイツ・蘭が遅延**。KYA Project にとっては **フランス・イタリア企業との pilot 連携が現実的な参入経路**(WE BUILD で確認可能)。

出典: [eIDEasy: EU Digital Identity Wallets Status by Member State (April 2026)](https://www.eideasy.com/blog/eu-digital-identity-wallets-status-april-2026)、[Namirial: EUDI Wallet status check by country](https://www.namirial.com/en/blog/stories/status-check-eudi-wallet/)、[Biometric Update: Will EUDI Wallet be ready in 2026 - experts say probably not](https://www.biometricupdate.com/202512/will-the-eudi-wallet-be-ready-in-2026-experts-say-probably-not)、アクセス 2026-06-01

### 2.7 QTSP(Qualified Trust Service Provider)認定の現実性

#### 2.7.1 QTSP 認定要件・コスト・期間

WebSearch 集約:

| 項目 | 内容 |
|------|------|
| **準拠標準** | ETSI EN 319 401(General Policy Requirements)、ETSI EN 319 403(CAB requirements)、ISO/IEC 17065 |
| **手順** | (1) 申請 NCA(national supervisory authority)、(2) CAB(Conformity Assessment Body)選定、(3) CAB audit(technical infra / processes / security / staff / operations)、(4) conformity assessment report、(5) NCA qualified status 付与、(6) EU Trusted List 登録 |
| **期間** | **6-12 ヶ月**(初回認定) |
| **初期コスト(CAB audit)** | **20,000-50,000 GBP**(約 23,000-58,000 EUR)+ NCA fee |
| **年次更新** | 5,000-15,000 GBP(約 5,800-17,500 EUR) |
| **再認定** | **24 ヶ月毎**(full re-assessment) |
| **infrastructure** | HSM **FIPS 140-2 Level 3** 以上、24/7 高可用 |
| **保険** | 損害保険(million EUR 単位、QTSP の liability に対応) |
| **総初期投資** | **hundreds of thousands EUR**(複数 source の一致) |
| **継続コスト** | 年次 6 桁 EUR(insurance + audit + staff + infra) |

出典:
- [ENISA: Conformity Assessment of QTSPs](https://www.enisa.europa.eu/publications/assessment-of-qualified-trust-service-providers)
- [ENISA: Recommendations for QTSPs based on Standards](https://www.enisa.europa.eu/sites/default/files/publications/WP2016%203-2%2015%20Recommendations%20for%20QTSPs%20based%20on%20Standards.pdf)
- [ESign Global: How to set up a Qualified Trust Service in the UK](https://www.esignglobal.com/blog/set-up-qualified-trust-service-uk)
- [Trustcloud: QTSPs key pillar in eIDAS 2](https://trustcloud.tech/blog/qualified-trust-service-providers-key-pillar-eidas-2-0/)
- [Ubiqu: Preparing for eIDAS 2.0 - QTSP certification](https://ubiqu.com/preparing-for-eidas-2-0-is-your-technology-ready-for-qtsp-certification/)
- [Ascertia: What is a QTSP and how do you become one](https://blog.ascertia.com/what-is-a-qtsp)
- [Schwalm Steffen Medium: Certification and obligations for acceptance in eIDAS 2.0](https://medium.com/@schwalm.steffen/certification-and-obligations-for-acceptance-in-eidas-2-0-d4d1eaf53ec6)
- アクセス 2026-06-01

#### 2.7.2 QTSP 認定の SME / 個人事業者非現実性

**個人 / SME での QTSP 認定の現実性 = 低**:

1. 初期投資 hundreds of thousands EUR(おそらく **300k-700k EUR 規模**、推定)
2. 6-12 ヶ月の認定期間 + 24 ヶ月毎の再認定 = 継続的に compliance team が必要
3. HSM FIPS 140-2 L3 + 24/7 SOC + 高可用 = SaaS infra + 専属 staff
4. liability 保険(million EUR 単位)
5. **NCA(national supervisory authority)との直接関係構築**(加盟国別、対面)

→ **KYA Project(個人 / 小規模スタートアップ)が QTSP 直接取得は Phase 1 / 2 では非現実的**。

#### 2.7.3 KYA Project が QTSP なしで提供できる範囲

**eIDAS 2.0 の attestation 階層**:

| 種別 | 略称 | 発行者 | KYA Project の取得可否 |
|------|------|--------|------------------------|
| Qualified EAA | **QEAA** | QTSP(qualified) | × (現実的に不可) |
| Public sector EAA | **PuB-EAA** | 公共部門 | × (該当せず) |
| **non-qualified EAA** | **EAA** | 任意の attestation provider | **○(参入可)** |

→ **KYA Project は non-qualified EAA Provider として agent attestation を発行可能**。これは ARF 上は許容され、WC3 VC 形式(VCDM v2.0)も使える(SD-JWT VC / mdoc は QEAA 限定の解釈もあり、確度: 中)。

**non-qualified EAA の市場性**:
- 法的 effect は QEAA より弱い(qualified electronic signature と同等の効果は得られない)
- ただし **technical interoperability は ARF 準拠で確保可能**
- B2B / B2C で「監査証跡として有用」「コンプライアンス上のベストプラクティス」として価値訴求可能
- AMLR 2027(`eu-ai-act-agent-identity-mandate.md` §2.3 サブ論点 6 参照)+ PSD3 SCA delegation の **間接効果** で需要が立ち上がる(推定、確度: 中)

出典: [ARF Annex 1 Definitions - raw GitHub](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/docs/annexes/annex-1/annex-1-definitions.md)、[Truscreen: Qualified Electronic Seal eIDAS 2 Business Requirements](https://truescreen.io/articles/eidas-2-qualified-electronic-seal-businesses/)、アクセス 2026-06-01

### 2.8 OID4VCI / OID4VP / SD-JWT VC / mdoc の ARF 統合状況

WebSearch 集約:

- **必須 credential format(ARF)**: SD-JWT VC + ISO/IEC 18013-5(mdoc) + 任意で W3C VC(VCDM v2.0、non-qualified EAA のみ)
- **必須 issuance protocol**: OID4VCI(OpenID for Verifiable Credential Issuance)
- **必須 verification protocol**: OID4VP(OpenID for Verifiable Presentations)
- **必須 profile**: HAIP(OpenID4VC High Assurance Interoperability Profile 1.0、draft 04)
- **mdoc remote**: ISO/IEC 18013-7

→ **KYA Project の W2 技術スタック(did:web + SD-JWT VC + mdoc dual format)は ARF 必須仕様と完全整合**。OID4VCI / OID4VP / HAIP の実装が Phase 1 必須。

出典:
- [GitHub Issue #4: OpenID4VC HAIP 1.0](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/4)
- [OpenID Foundation HAIP 1.0 draft 04](https://openid.net/specs/openid4vc-high-assurance-interoperability-profile-1_0-04.html)
- [walt.id: eIDAS 2 Explained](https://walt.id/eidas2)
- [walt.id: OpenID4VCI Developer Guide 2026](https://docs.walt.id/concepts/data-exchange-protocols/openid4vci)
- アクセス 2026-06-01

### 2.9 OpenID Federation の役割

WebSearch verbatim:

> "OpenID Federation is a framework that enables the establishment of trust relationships among different entities, such as identity providers, relying parties, and intermediaries... The Trust Federation architecture is based on **OpenID Connect Federation** and adopted to meet eIDAS 2.0 Architecture Reference Framework guidelines."

→ Wallet 間 / Issuer / Relying Party 間の trust 構築は OpenID Federation。KYA Project は OpenID Federation 上の "intermediary"(non-qualified EAA Provider)として位置取れる。

出典: [Business Wallet Blog: OpenID Federation for EUDI Wallet Interoperability](https://businesswallet.eu/blog/getting-started/openid-federation-eu-digital-identity-wallet-interoperability)、アクセス 2026-06-01

### 2.10 ARF v3.0 / agentic AI 専用 topic のロードマップ予測

**確定情報**:
- ARF v2.9.0 = 2026-05-11
- 2026 iteration calendar(全 7 iterations、Iteration 1 = 2026-02-25〜04-29、各 iteration 7 週後に ARF release)
- Iteration 5(Topic I 反映)= 推定 2026-Q4 ARF release
- Iteration 7(Topic AA / AD / AE 反映)= 推定 2027-Q1〜Q2

**推定情報(確度: 中-低)**:
- ARF v3.0 = 2026 iteration 完了後、**2027-Q2〜Q3**(推定、major rev は通常 EBW 採択タイミングと同期する可能性)
- **agentic AI 専用 discussion topic** = 2027 iteration(Iteration 8+ 起算)で取り上げられる可能性、確度: 中
- **agent delegation 公式定義** = 早ければ **2027-Q4 ARF v3.x**、現実的には **2028-2029 EBW Implementing Acts**(確度: 中)

→ **2026-Q4 から 2027-Q4(または 2028-Q4)までの 12-24 ヶ月が ARF レベルでの "agent delegation 未定義期間"**。KYA Project の独占的市場形成期間として活用可能(推定、確度: 中-高)。

---

## 3. 比較表(eIDAS 2.0 + EBW + ARF の段階別影響)

| 時期 | 法的・技術的状況 | Agent delegation 公式定義度 | KYA Project への影響 |
|------|------------------|------------------------------|----------------------|
| **現状(2026-06)** | ARF v2.9.0 + Topic I v0.4(natural person のみ)+ EBW 提案段階 | **ゼロ**(agent 定義語なし) | **市場形成最初期、ARF contributor になれる窓** |
| **2026-Q4** | ARF v2.12〜v2.13(Topic I refinement 反映)、Iteration 5 完了 | 弱(natural person 拡張のみ) | non-qualified EAA Provider として WE BUILD と連携可能 |
| **2026-12** | EUDI Wallet 加盟国提供義務(France/Italy = on time、Germany/NL = 遅延)、ARF v2.13(推定) | 弱 | KYA reference impl が WE BUILD / APTITUDE で参照される **戦略好機** |
| **2027-Q1〜Q2** | ARF v3.0(推定)+ Iteration 7 反映(payment SCA / proximity / liveness) | 中(payment SCA 詳細化) | PSD3/PSR と EUDI Wallet SCA outsourcing で KYA Layer 需要立ち上がり |
| **2027-07** | AMLR 適用開始(CASP €1,000 CDD) | 中(間接、agent delegation 証明の事実上の必要) | KYA = AMLR compliance の技術的前提 |
| **2027-Q3〜Q4** | EBW 採択 + OJ 公表(推定)、ARF Iteration 8 で agentic AI 開始(推定) | 中-強(EBW Implementing Acts 整備開始) | **EBW Implementing Acts への技術的入力ルートが本格化** |
| **2027-12** | EUDI Wallet 受入義務(銀行 / 規制セクター)、AI Act 高リスク義務(暫定 2027-12-02) | 中-強(SCA accept 必須) | KYA Layer = EU 銀行向け agent attestation 提供 |
| **2028 中** | PSD3/PSR 適用開始(推定 2027-Q4〜2028-Q3)、EBW pilot 推進 | 強 | KYA Layer = EBW reference impl ベンダー候補 |
| **2028-2029** | EBW application 開始(推定、OJ + 24 ヶ月)、agent delegation 公式 spec 確定見込み | **強(公式定義確定)** | KYA Project は EBW Implementing Acts 参照 ベンダーとして地位確立 / または競合に飲まれる |

---

## 4. 「抜け道」分析(KYA Project の視点)

### 4.1 KYA が取れる 3 つのポジション

| ポジション | 取得難度 | EU 市場での法的効果 | 推奨 |
|-----------|----------|--------------------|------|
| (A) **QTSP**(qualified trust service provider) | 高(初期 300-700k EUR、6-12 ヶ月、24 ヶ月再認定) | 強(QEAA 発行可、qualified signature 効果) | **Phase 2 以降の選択肢、初期は不可** |
| (B) **non-qualified EAA Provider** | 低(技術整備のみ、ARF 準拠) | 中(non-qualified、interoperability 確保) | **★ Phase 1 推奨** |
| (C) **ARF contributor / WE BUILD partner** | 低-中(GitHub PR、consortium 参加) | 公式 spec への影響力 | **★ Phase 1 推奨、(B) と併行** |

**推奨スタンス(W3 暫定)**: **(B) + (C) を 2026-Q4 から並行展開**。

理由:
1. QTSP は SME / 個人事業者には現実的に高すぎる(初期 300-700k EUR、年次 6 桁 EUR、HSM FIPS 140-2 L3 + 24/7 SOC)
2. non-qualified EAA は ARF 仕様準拠で誰でも発行可能、agent attestation の市場をまず立ち上げる
3. ARF contributor は **agent delegation 公式定義(2027-Q4〜2028)の前にプロセスに入り込む** ための最重要ルート
4. WE BUILD は EBW pilot で 2026-2028 の 24 ヶ月 testing 期間、agentic AI 提唱者 → **連携で reference impl ベンダー化可能**

### 4.2 リスク要因

1. **QTSP 必須化リスク**: AMLA RTS や 2028-2029 EBW Implementing Acts で agent attestation が QEAA 必須化 → non-qualified EAA Provider 排除(確度: 低-中、影響: 大)。対策: WE BUILD / ARF プロセスで non-qualified EAA の継続的有効性を主張
2. **EBW Implementing Acts が KYA と非互換の technical spec を採用するリスク**: Commission が想定外の credential format / federation スキームを採用 → KYA reference impl の retrofit コスト発生(確度: 中、影響: 中)。対策: WE BUILD 内で早期に技術的入力
3. **加盟国実装の温度差リスク**: France / Italy 先行、Germany / NL 遅延 → 統一市場形成が遅延、KYA の販売チャネル分散(確度: 高、影響: 中)。対策: France / Italy 先行で reference customer 開拓
4. **EUDI Wallet ARF が agentic AI を直接取り込むリスク**: EBW 経由ではなく ARF v3.x で直接定義 → KYA Layer の戦略的余白縮小(確度: 中、影響: 中)。対策: ARF GitHub Discussions に early-stage で参加
5. **EU 域外プレイヤー(Anthropic / Google / Microsoft / Skyfire)による先行 reference impl リスク**: 米国大手が WE BUILD と連携して standard を取る(確度: 中-高、影響: 大)。対策: 2026-Q3 までに OSS Bridge SDK 公開 + WE BUILD コンタクト
6. **eIDAS Implementing Acts の追加(2026-2027)が想定外の制約を導入するリスク**(確度: 中、影響: 中)

### 4.3 推奨スタンス(KYA Project として)

- **核となる主張**: "KYA Layer は EU eIDAS 2.0 ARF 準拠の non-qualified EAA Provider として agent attestation を発行・検証する。WE BUILD と協働で agent integration reference impl を提供する。Phase 2 で必要なら QTSP 認定を検討"
- **法的根拠の固め方**: ARF 準拠(SD-JWT VC + mdoc + OID4VCI + OID4VP + HAIP)+ WE BUILD non-paper(2026-03)の引用 + EBW Recital 28 の "agentic AI" 言及活用
- **明確な outside 範囲**: KYA Layer は QTSP として qualified electronic signature を発行しない、payment custody を行わない、Wallet 本体は提供しない(attestation issuance / verification のみ)
- **EBW Implementing Acts プロセスへの参画**: 2027-Q1〜Q3 の Commission stakeholder consultation に reference impl を提出

---

## 5. 戦略的含意(KYA Project への影響)

### 5.1 結論: EU は **2027-Q4〜2028 までは agent delegation を公式定義しない**、その間が KYA Project の独占的市場形成期間

W2 文書の「2026-Q4〜2027-Q4 の 1 年が独占的市場形成期間」という暫定は、W3 深掘りで **「2026-Q4〜2028-Q4 の 24 ヶ月に拡大可能」**(推定、確度: 中)に修正:

理由:
1. ARF v2.9.0(2026-05-11)時点で agent delegation 定義語が一切なし
2. Topic I(natural person representing another)v0.4 が 2025-05-20 から 1 年以上更新されていない、agent 言及ゼロ
3. EBW(COM 2025/838)が agentic AI を implementing acts 委任で扱う方向 → **採択 2027-Q3 + OJ + 24 ヶ月 application** = 2029-Q3 まで強制力なし(推定)
4. ARF iteration calendar(2026 で 7 iterations、Iteration 5 まで Topic I refinement のみ、agentic 専用 topic なし)
5. WE BUILD non-paper(2026-03)が agent integration framework を提案中 → **Commission に正式採用されるかは未確定**(推定、確度: 中)

### 5.2 法人設立国(decision-doc.md §1)への含意

**W2 暫定「EU 域外スタート + EUDI Wallet 統合フェーズで EU 子会社検討」を W3 で継続支持 + 強化**:

- **強化点 1**: EBW の発見で、agent delegation 公式定義は **2028-2029 EBW Implementing Acts**(推定)= EU 子会社設立タイミングを **2028-Q1 以降に明確化**
- **強化点 2**: QTSP 認定が SME に非現実的(初期 300-700k EUR、6-12 ヶ月、HSM FIPS 140-2 L3) → **EU 子会社設立後に QTSP 検討するのが最短**
- **強化点 3**: France / Italy 先行 → **EU 子会社は France または Italy** が現実的(WE BUILD partners の所在地、DG CONNECT との近接)。**Germany / NL は遅延ペナルティを共有しない方が良い**
- **暫定推奨**: 初期(2026-2028)= **日本 / シンガポール / UAE から EU 顧客にサービス提供**、2028-Q1 以降 = **France または Italy に EU 子会社**(EBW Implementing Acts プロセス参画用)

### 5.3 ビジネスモデル(decision-doc.md §2)への含意

**W2 暫定「SDK ライセンス + Hybrid OSS Bridge + 商用規制 attestation packaging」を W3 で強化**:

- **OSS Bridge SDK**: ARF 必須仕様(SD-JWT VC + mdoc + OID4VCI + OID4VP + HAIP)を OSS 化 → WE BUILD / APTITUDE / 加盟国 pilot で参照されやすい
- **商用 SDK / SaaS**: agent identity attestation(non-qualified EAA)発行 / 検証、agent ↔ human binding、delegation chain audit
- **新規追加候補**: **EBW Implementing Acts compliance package**(2028-2029 採択時に対応)
- **QTSP 認定**: Phase 2 以降の選択肢(EU 子会社設立後)

### 5.4 技術アーキテクチャ(decision-doc.md §3)への含意

**W2 暫定スタックを W3 で完全検証**:

| Layer | W2 選択 | W3 検証結果 |
|-------|---------|-------------|
| DID method | did:web + did:erc8004 | **ARF 直接の DID 要求なし**(PID は ISO 18013-5 mdoc / SD-JWT VC で hand)、KYA 内部で did:web 使用は問題なし |
| VC format | **SD-JWT VC + mdoc dual** | **ARF 必須仕様と完全一致** ★ |
| ZK | SP1 | ARF Iteration 6 で Topic G (ZKP) refinement、SP1 採用はゼロ知識証明として ARF 互換性確認要 |
| PQC | ML-DSA + Ed25519 dual-sig | ARF / EBW で PQC 言及は限定的、ENISA recommendation で 5-10 年 migration プラン要求の流れ(推定、確度: 中) |
| SSI library | spruceid/ssi | OSS 最成熟、HAIP 対応の有無を W4 で検証 |

**新規追加**:
- **HAIP(OpenID4VC High Assurance Interoperability Profile)実装が Phase 1 必須**(ARF mandatory profile)
- **OpenID Federation 対応**(eIDAS 2.0 Trust Federation の基盤)
- **mdoc remote(ISO/IEC 18013-7)実装**(remote presentation 必須)

### 5.5 時間圧力(decision-doc.md §5、Path 選択)への含意

**W2 暫定「7 ヶ月(AWS)+ 12-18 ヶ月(EU 規制重層)」を W3 で更新**:

- **AWS 後出しリスク = 7 ヶ月**(2026-12 re:Invent まで、不変)
- **EU 規制重層市場形成期間 = 12-24 ヶ月に拡大**(W2 = 12-18 → W3 = 12-24)
  - 理由: EBW Implementing Acts で agent delegation 公式定義が 2028-2029 にずれ込み(推定、確度: 中)
- **総合戦略 window**: 7 ヶ月の AWS 圧力をクリアした後、**18-24 ヶ月の EU 市場形成期間** に商用展開を成熟させる時間あり
- **Path C(Hybrid)継続支持**: 個人開発 → 2028 で Path A(独立)への切替余地を最大化

### 5.6 新規追加リスク(decision-doc.md §6)

**W3 追加**:

- **EBW Implementing Acts technical spec 非互換リスク**: Commission が想定外の credential format / federation スキーム採用(確度: 中、影響: 中)
- **WE BUILD non-paper が Commission に採用されないリスク**: 2026-03 non-paper が EU 公式採用されず agent integration が EBW Implementing Acts に反映されない(確度: 中、影響: 中)
- **米国大手による WE BUILD 連携先行リスク**: Anthropic / Google / Microsoft / Skyfire が WE BUILD と早期連携 → 標準化議論で先手(確度: 中-高、影響: 大)
- **加盟国 EUDI Wallet 提供遅延の連鎖リスク**: Germany / NL 遅延が EU 全体の market timing を遅らせる → KYA 商用化機会も後ずれ(確度: 高、影響: 中)
- **QTSP 必須化リスク**: AMLA RTS や EBW Implementing Acts で agent attestation が QEAA 必須化(確度: 低-中、影響: 大) — W2 で既に列挙、W3 でも継続

---

## 6. 主要発見(エグゼクティブ向けサマリ)

1. **eIDAS 2.0 本体は agent delegation を扱わない**(Article 5a / Article 3 の "user" 定義に AI agent の余地なし、natural person 限定)
2. **ARF v2.9.0(2026-05-11)時点で "agent" "delegation" "mandate" の定義語が Annex 1 に一切なし**。Topic I(natural person representing another)も v0.4(2025-05-20)で natural person 限定、AI agent 言及ゼロ
3. **EU は agent identity を eIDAS 本体ではなく EBW(European Business Wallet、COM 2025/838 final、2025-11-19 提案)で扱う方向に舵を切った** — Recital 28 で agentic AI を implementing acts 委任で明示
4. **WE BUILD consortium が 2026-03 に non-paper を Commission に提出済み** — "mutual authentication between AI agents, verify the relationship between a human and their agent" を EUDI/EBW 上で実現することを公式提唱
5. **QTSP 認定は SME / 個人事業者には非現実的**(初期 300-700k EUR、6-12 ヶ月、HSM FIPS 140-2 L3、24 ヶ月毎再認定)。**KYA Project は non-qualified EAA Provider + ARF/WE BUILD contributor が最適**
6. **2026-Q4〜2028-Q4 の 24 ヶ月が KYA Project の独占的市場形成期間**(W2 の 12-18 ヶ月から 12-24 ヶ月に拡大可能、確度: 中-高)
7. **KYA Project の W2 技術スタック(SD-JWT VC + mdoc)は ARF 必須仕様と完全整合**。OID4VCI / OID4VP / HAIP / OpenID Federation の実装が Phase 1 必須
8. **加盟国温度差**: France / Italy 先行、Germany(2027-01-02 遅延)/ Netherlands(遅延見込み)/ Spain(legacy 統合課題)→ **EU 子会社設立は France または Italy**

---

## 7. KYA Project の参入経路(2026-Q3 〜 2028-Q4 ロードマップ)

### Phase 1(2026-Q3 〜 2026-Q4)

- [ ] **OSS Bridge SDK 公開**(GitHub、Apache 2.0)
  - did:web + SD-JWT VC + mdoc + OID4VCI + OID4VP + HAIP 実装
  - AWS AgentCore × ARF 準拠 attestation の glue
- [ ] **ARF GitHub Discussions / Issues への参加**
  - Topic I(Iteration 5、refinement 中)に agent 視点コメント
  - Topic AA(Iteration 7、SCA)で delegation chain 議論への参加
- [ ] **WE BUILD consortium への打診**
  - 2026-03 non-paper の executor として reference impl 提案
- [ ] **AWS x402 ecosystem 統合の reference impl**(decision-doc.md §0 の Win Condition 1)

### Phase 2(2027-Q1 〜 2027-Q4)

- [ ] **non-qualified EAA Provider として商用 SDK / SaaS 提供開始**
  - フランス / イタリア企業を最初の reference customer に
- [ ] **EBW Implementing Acts stakeholder consultation 参加**
  - Commission DG CONNECT との直接コンタクト
- [ ] **AMLR 2027-07 適用 + EUDI Wallet 2027-12 受入義務の連動需要を取り込む**
- [ ] **ARF v3.0(推定 2027-Q2〜Q3)で agentic AI topic が立ち上がれば早期参画**

### Phase 3(2028-Q1 〜 2028-Q4)

- [ ] **EU 子会社設立(France または Italy)**
- [ ] **EBW pilot ベンダーとしての地位確立**
- [ ] **QTSP 認定検討**(EBW Implementing Acts で QEAA 必須化シナリオに備える)
- [ ] **standard 化議論で agent identity attestation の事実標準を握る**

---

## 8. ソース

### 一次資料(EU 法・条文・公式公表)

#### eIDAS 2.0 本体

- [Regulation (EU) 2024/1183 (eIDAS 2.0) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/1183/oj/eng) — WebFetch 403、Article 5a verbatim は web ミラー経由
- [Article 3 - eIDAS 2 text(web mirror)](https://www.european-digital-identity-regulation.com/Article_3_(Regulation_EU_2024_1183).html) — User 定義
- [Article 5a to 5f - eIDAS 2 text(web mirror)](https://www.european-digital-identity-regulation.com/Article_5a_(Regulation_EU_2024_1183).html) — EUDI Wallet 中核条文(403、WebSearch snippet 経由)
- [Article 6 to 13 - eIDAS 2 text(web mirror)](https://www.european-digital-identity-regulation.com/Article_6_(Regulation_EU_2024_1183).html) — Trust services

#### EUDI Wallet ARF GitHub

- [EUDI Wallet ARF GitHub repository](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework)
- [ARF CHANGELOG(raw GitHub)](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/CHANGELOG.md) — v2.8.0 / v2.9.0 リリース履歴
- [ARF README(raw GitHub)](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/README.md)
- [ARF Discussion Topics README(raw GitHub)](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/docs/discussion-topics/README.md) — 7 iterations / 15 topics calendar
- [Topic I Discussion Paper(raw GitHub)](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/docs/discussion-topics/i-natural-person-representing-another-natural-person.md) — v0.4、2025-05-20
- [ARF Annex 1 Definitions(raw GitHub)](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/main/docs/annexes/annex-1/annex-1-definitions.md) — "agent" "delegation" 未定義
- [GitHub Discussion #582 - Topic AA SCA](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/582)
- [GitHub Roadmap Discussion #79 - Reference Implementation Roadmap](https://github.com/eu-digital-identity-wallet/eudi-wallet-reference-implementation-roadmap/discussions/79)
- [GitHub Issue #4 - OpenID4VC HAIP 1.0 integration](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/4)
- [GitHub Issue #431 - EC TS12 v1.0.1 SCA Implementation with Wallet](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/431)

#### European Business Wallet(EBW)

- [COM(2025) 838 final - EUR-Lex](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex:52025PC0838) — WebFetch 403、Recital 28 verbatim は WebSearch snippet 経由
- [European Business Wallets - DG CONNECT policy](https://digital-strategy.ec.europa.eu/en/policies/business-wallets)
- [European business wallets - Legislative Train Schedule (EP)](https://www.europarl.europa.eu/legislative-train/theme-a-new-plan-for-europe-s-sustainable-prosperity-and-competitiveness/file-european-business-wallet)
- [European business wallets briefing - EPRS PDF](https://www.europarl.europa.eu/RegData/etudes/BRIE/2025/774703/EPRS_BRI(2025)774703_EN.pdf)
- [COM(2025) 838 final - Eerste Kamer mirror PDF](https://www.eerstekamer.nl/bijlage/20251121/com_2025_838_proposal_for_a/document3/f=/vmsoctgrbbeb.pdf) — WebFetch 403
- [EDPS Opinion 5/2026 - PDF](https://www.edps.europa.eu/system/files/2026-01/26-01-20_opinion_establishment_of_european_business_wallets_en.pdf) — WebFetch 403

#### Commission / ENISA / Trust Services

- [European Digital Identity Wallet implementation - DG CONNECT](https://digital-strategy.ec.europa.eu/en/policies/eudi-wallet-implementation)
- [European Digital Identity Regulation - DG CONNECT](https://digital-strategy.ec.europa.eu/en/policies/eudi-regulation)
- [Trust Services Q&A - DG CONNECT](https://digital-strategy.ec.europa.eu/en/faqs/questions-answers-trust-services-under-european-digital-identity-regulation)
- [Becoming a QTSP - eIDAS Dashboard](https://eidas.ec.europa.eu/efda/discover/becoming-qtsp)
- [EUDI Trust Services Framework - eIDAS Dashboard](https://eidas.ec.europa.eu/efda/assets/i18n/home/static-html/faq/eu-trust-service-framework_en.html)
- [List of qualified trust service providers - EU Trusted Lists](https://digital-strategy.ec.europa.eu/en/policies/eu-trusted-lists)
- [ENISA: Conformity Assessment of QTSPs](https://www.enisa.europa.eu/publications/assessment-of-qualified-trust-service-providers)
- [ENISA: Recommendations for QTSPs based on Standards](https://www.enisa.europa.eu/sites/default/files/publications/WP2016%203-2%2015%20Recommendations%20for%20QTSPs%20based%20on%20Standards.pdf)
- [ENISA: Conformity Assessment of TSPs Technical Guidelines](https://www.enisa.europa.eu/publications/tsp-conformity-assessment)
- [What are the Large Scale Pilot Projects - EC EUDI Wallet portal](https://ec.europa.eu/digital-building-blocks/sites/spaces/EUDIGITALIDENTITYWALLET/pages/694487808/What+are+the+Large+Scale+Pilot+Projects)
- [The European Digital Identity Regulation - EC portal](https://ec.europa.eu/digital-building-blocks/sites/spaces/EUDIGITALIDENTITYWALLET/pages/915931811/The+European+Digital+Identity+Regulation)

### 標準・技術仕様

- [OpenID4VC High Assurance Interoperability Profile 1.0 - draft 04](https://openid.net/specs/openid4vc-high-assurance-interoperability-profile-1_0-04.html)
- [ETSI EN 319 401 Assessment Handbook(BSI mirror, DE)](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Publikationen/TechnischeRichtlinien/TR03125/Assessment-Handbuch_ETSI_319_401.pdf)

### Large Scale Pilots / 業界

- [WE BUILD Consortium - EU Commission publishes EBW proposal](https://www.webuildconsortium.eu/news/european-commission-published-the-proposal-regulation-on-the-establishment-of-european-business-wallets)
- [Biometric Update: EU can rein in AI agents with EUDI Wallets and business wallets - WE BUILD](https://www.biometricupdate.com/202603/eu-can-rein-in-ai-agents-with-eudi-wallets-and-business-wallets-we-build) — 403、WebSearch snippet 経由
- [Biometric Update: New EU Large Scale Pilots launch 2025-09](https://www.biometricupdate.com/202509/new-eu-large-scale-pilots-launch-to-develop-the-digital-identity-wallet-ecosystem)
- [Biometric Update: Will EUDI Wallet be ready in 2026 - experts say probably not](https://www.biometricupdate.com/202512/will-the-eudi-wallet-be-ready-in-2026-experts-say-probably-not)
- [Biometric Update: OneSpan joins WE BUILD and Aptitude](https://www.biometricupdate.com/202605/onespan-joins-eudi-wallet-testing-push-through-we-build-and-aptitude)
- [Biometric Update: POTENTIAL pilot common standards](https://www.biometricupdate.com/202511/eudi-wallet-needs-common-standards-applied-rigorously-potential-pilot-finds)
- [Indicio: APTITUDE Digital Wallet Travel and Payments](https://indicio.tech/blog/indicio-to-advance-trusted-digital-identity-with-aptitude-europes-newest-large-scale-project-for-digital-wallet-travel-and-payments/)
- [Aptitude consortium homepage](https://aptitude.digital-identity-wallet.eu/)
- [Meeco Report: EUDI Large Scale Pilots](https://media.meeco.me/public-assets/reports/Meeco_Report_EUDI_Large_Scale_Pilots.pdf)
- [NOBID Consortium kick-off](https://www.nobidconsortium.com/kick-off-for-nobid-and-large-scale-piloting-of-the-eu-digital-wallet/)

### 法律事務所・コンサル

- [Baker McKenzie: EU New Package Reforms AI, Data and Business Identity (2026-01)](https://www.bakermckenzie.com/en/insight/publications/2026/01/eu-new-package-reforms-ai-data-and-business-identity)
- [Baker McKenzie: EUDI Wallet Harmonizes Identification and Age-Gating (2026-03)](https://www.bakermckenzie.com/en/insight/publications/2026/03/european-union-eudi-wallet-harmonizes-identification-and-age-gating)
- [William Fry: Era of Identity Assurance - EUDI Wallet FAQs](https://www.williamfry.com/knowledge/the-era-of-identity-assurance-faqs-on-europes-digital-identity-wallet/)
- [Arthur Cox: EUDI Wallet What companies need to know](https://www.arthurcox.com/knowledge/the-eu-digital-identity-wallet-what-companies-need-to-know/)
- [Identity Week: EU Commission publishes proposal for Business Wallet](https://identityweek.net/eu-commission-publishes-proposal-for-business-wallet/) — 403、WebSearch snippet 経由
- [Identity Week: 18 months to launch - Europe ready for EU Digital ID Wallet](https://identityweek.net/18-months-to-launch-is-europe-ready-for-the-eu-digital-id-wallet/)
- [Spherity: European Business Wallet Strategic Pillar - Carsten Stöcker](https://medium.com/spherity/the-european-business-wallet-a-strategic-pillar-for-digital-identity-and-industrial-3f9983f7b299)
- [Spherity: European Business Wallet trusted cross-border business](https://www.spherity.com/post/european-business-wallet-trusted-cross-border-business-with-eidas-2-0)
- [Mondaq: EU Business Wallet How It Works](https://www.mondaq.com/corporate-and-company-law/1710340/eu-business-wallet-how-it-works-and-how-it-complements-the-eudi-wallet-under-eidas)
- [Bundesnotarkammer: EU Commission proposal on EU Business Wallet](https://www.bnotk.de/en/tasks-and-activities/magazines/bnotk-international/details/eu-commission-proposal-on-eu-business-wallet-published) — 403
- [Namirial: Wallets and Agentic AI - Trust, Identity, Transactions](https://www.namirial.com/en/blog/ecosystem/wallets-agentic-ai-trust/)
- [Namirial: PSD3 and PSR impacts](https://www.namirial.com/en/blog/ecosystem/psd3-and-psr/)
- [Namirial: EUDI Wallet status check by country](https://www.namirial.com/en/blog/stories/status-check-eudi-wallet/)
- [Signicat: SCA with EUDI Wallets](https://www.signicat.com/blog/strong-customer-authentication-sca-with-eudi-wallets-what-financial-services-need-to-know)
- [Signicat: EUDI Wallets Only One Year to Launch](https://www.signicat.com/blog/eudi-wallets-only-one-year-to-launch)
- [Truvity: Bank's 3 Steps to eIDAS 2.0 Compliance](https://www.truvity.com/blog/your-banks-first-3-steps-to-eidas-2-0-compliance)
- [walt.id: EUDI Wallet Complete Guide](https://walt.id/eidas2/eudi-wallet)
- [walt.id: eIDAS 2 Implementers Guide](https://walt.id/white-paper/eidas2-implementers-guide)
- [walt.id: eIDAS 2 Explained](https://walt.id/eidas2)
- [walt.id: OpenID4VCI Developer Guide 2026](https://docs.walt.id/concepts/data-exchange-protocols/openid4vci)
- [WWPass: EUDI Wallet Acceptance for Enterprise IAM 2025-2027](https://www.wwpass.com/blog/eudi-wallet-acceptance-for-enterprise-iam-2025-2027-a-90-day-blueprint/)
- [Hopae: EUDI Wallet and eIDAS 2.0 - Why companies should prepare now](https://www.hopae.com/blog/eudi-wallet-eidas-2-0-why-companies-should-prepare-now)
- [Trustcloud: QTSPs key pillar in eIDAS 2](https://trustcloud.tech/blog/qualified-trust-service-providers-key-pillar-eidas-2-0/)
- [Ubiqu: Preparing for eIDAS 2.0 - QTSP certification](https://ubiqu.com/preparing-for-eidas-2-0-is-your-technology-ready-for-qtsp-certification/)
- [Ascertia: What is a QTSP and how do you become one](https://blog.ascertia.com/what-is-a-qtsp)
- [ESign Global: How to set up a Qualified Trust Service in the UK](https://www.esignglobal.com/blog/set-up-qualified-trust-service-uk)
- [Truscreen: Qualified Electronic Seal eIDAS 2 Business Requirements](https://truescreen.io/articles/eidas-2-qualified-electronic-seal-businesses/)
- [Schwalm Steffen Medium: Certification and obligations for acceptance in eIDAS 2.0](https://medium.com/@schwalm.steffen/certification-and-obligations-for-acceptance-in-eidas-2-0-d4d1eaf53ec6)
- [Utimaco: eIDAS 2.0 Moving Closer - EDIW and Pilot Implementation](https://utimaco.com/news/blog-posts/eidas-20-moving-closer-european-digital-identity-wallet-eidiw-and-pilot)
- [Utimaco: What is a Qualified Trust Service Provider](https://utimaco.com/service/knowledge-base/digital-signing/what-qualified-trust-service-provider-qtsp)
- [Entrust: eIDAS Implementing Acts Wallet Rules ID Proofing](https://www.entrust.com/resources/learn/eidas-implementing-acts)
- [Sumsub: eIDAS 2.0 Power Grab](https://sumsub.com/blog/eidas-europe/)
- [Cryptomathic: eIDAS 2.0 Implementing Acts](https://www.cryptomathic.com/blog/eidas-2.0-implementing-acts-clear-compliance-guidance-for-trust-providers)
- [Reply: Agentic checkout beyond the hype - European players](https://www.reply.com/en/strategy-and-business-model-transformation/agentic-checkout-beyond-the-hype)
- [eIDEasy: EU Digital Identity Wallets Status by Member State April 2026](https://www.eideasy.com/blog/eu-digital-identity-wallets-status-april-2026)
- [Dock.io: Mandatory EUDI Wallet Acceptance - Who Must Accept](https://www.dock.io/post/mandatory-eudi-wallet-acceptance-heres-who-must-accept-and-whos-exempt)
- [Dock.io: EU Business Wallet - What You Need to Know](https://www.dock.io/post/eu-business-wallet-what-you-need-to-know-about-the-eus-digital-id-for-companies-video-and-takeaways)
- [Finextra: Why mandatory European Business Wallets in public sector](https://www.finextra.com/blogposting/30926/why-mandatory-european-business-wallets-in-public-sector-units-are-a-sea-change)
- [AI Chamber: European Business Wallets problems they address](https://aichamber.eu/european-business-wallets-what-they-are-and-what-problems-they-aim-to-address/)
- [Orange Business: European Identity Wallet and Business Wallet building digital trust](https://perspective.orange-business.com/en/european-identity-wallet-and-business-wallet-building-digital-trust-in-europe/)
- [Business Wallet Blog: OpenID Federation for EUDI Wallet Interoperability](https://businesswallet.eu/blog/getting-started/openid-federation-eu-digital-identity-wallet-interoperability)
- [iGrant.io: EUDI Wallets with OpenID4VC](https://docs.igrant.io/concepts/openID4vc/)
- [Identity Foundation Blog: European Commission announces interoperability wallet](https://blog.identity.foundation/european-commission-announces-the-interoperability-wallet-for-identity-wallets/)
- [BusinessWallet.eu: EU Business Wallet docs](https://docs.igrant.io/regulations/reg-eu-digital-id-framework/)
- [Norton Rose Fulbright: PSD3 PSR 2026 readiness](https://www.nortonrosefulbright.com/en/knowledge/publications/cedd39c6/psd3-and-psr-from-provisional-agreement-to-2026-readiness)
- [DLA Piper: PSD3 PSR Proposed Reforms (2026-03)](https://www.dlapiper.com/en/insights/publications/2026/03/psd3-and-psr)

### 業界・研究レポート

- [arXiv 2601.19837: Self-Sovereign Identity and eIDAS 2.0](https://arxiv.org/html/2601.19837v2)
- [CEUR-WS Vol-3863 Paper2: Bridging eIDAS 2.0 Legal Requirements and Technical Solutions](https://ceur-ws.org/Vol-3863/paper2.pdf)
- [Springer chapter: EUDI Wallet as Defined in eIDAS 2 Regulation](https://link.springer.com/chapter/10.1007/978-3-031-74889-9_19)
- [arXiv 2501.09674: Authenticated Delegation and Authorized AI Agents](https://arxiv.org/pdf/2501.09674)
- [arXiv 2601.19893: Enabling SSI-Compliant Use of EUDI Wallet via TEE and ZKP](https://arxiv.org/pdf/2601.19893)
- [arXiv 2602.14871: interID Ecosystem-agnostic Verifier-as-a-Service](https://arxiv.org/pdf/2602.14871)
- [Fime: Agentic AI and payments - when AI gets a wallet](https://www.fime.com/blog/blog-15/post/agentic-ai-and-payments-when-ai-gets-a-wallet-and-a-will-of-its-own-661)
- [Quantum Space: EUDI Wallet Europe's Digital Identity 2026 Explained](https://thequantumspace.org/2025/09/08/future-proofing-the-eu-digital-identity-wallet/)
- [EU Perspectives: Your ID phone-based EUDI Wallet rollout 2026](https://euperspectives.eu/2026/01/eu-digital-identity-wallet-fces-2026-deadline/)
- [Thierry Thevenet Medium: From AI in Wallets to Wallet for AI Agents](https://medium.com/@thierry.thevenet/from-ai-in-wallets-to-wallet-for-ai-agents-9f51f16f83d4)

---

## 9. W4 以降の深掘り項目

- [ ] **EUR-Lex の Regulation (EU) 2024/1183 verbatim 確認**(現状 web ミラー snippet 経由)
- [ ] **COM(2025) 838 final verbatim 全文取得**(Eerste Kamer ミラー、EUR-Lex 共に 403、コタさんによる直接取得が必要)
- [ ] **EDPS Opinion 5/2026 全文取得**(EBW への data protection 観点コメント、推定で agent identity に言及あり)
- [ ] **WE BUILD non-paper 全文取得**(2026-03 公表、現状 Biometric Update snippet 経由のみ)
- [ ] **ARF Iteration 5 完了 → ARF v2.12 release 待ち**(推定 2026-Q3)で Topic I 反映後の verbatim
- [ ] **eIDAS 2.0 Recital 60+ verbatim 確認**(representation 関連、EUR-Lex 403 のため未完)
- [ ] **加盟国別実装 deep dive**(France / Italy で reference customer 候補リストアップ)
- [ ] **OpenID Federation 1.0 spec 精読**(KYA Layer の trust federation integration 設計)
- [ ] **HAIP draft 04 → final spec の進捗監視**
- [ ] **WE BUILD への正式コンタクト経路設計**(Phase 1 着手前にメンバー確認、コタさんの判断)
- [ ] **DG CONNECT stakeholder consultation の開催スケジュール監視**(EBW Implementing Acts 整備プロセス)

---

## 10. 注意・免責

- 本ドキュメントは **法律意見ではない**。リサーチドキュメント。最終判断は弁護士確認必須。
- EUR-Lex、Identity Week、Biometric Update、Bundesnotarkammer、EDPS、Council 等の主要一次・二次資料が WebFetch で 403 で取得できず、WebSearch snippet 経由で確認している箇所が多数。条文 verbatim 引用は GitHub raw / web mirror snippet による。**critical な決定の前にコタさんが EUR-Lex / EDPS で原文確認すること推奨**。
- ARF v2.9.0 リリース日(2026-05-11)と Iteration 1 期間(2026-02-25〜04-29)は GitHub raw CHANGELOG / Discussion Topics README から確認済。
- Topic I 討議論文 v0.4(2025-05-20)、Annex 1 Definitions の "agent" "delegation" "mandate" 未定義は GitHub raw verbatim で確認済。これは KYA Project の戦略的余白の **直接的な裏付け証拠**。
- COM(2025) 838 final Recital 28 "agentic AI" 言及は WebSearch snippet 経由(EUR-Lex 403)。**verbatim 全文の取得は W4 以降の必須タスク**。
- "暫定合意" "推定" "確度: 中" 等の表記は意図的に使用。確定情報と推定を区別している。
- 加盟国別実装状況(France 先行、Germany 2027-01-02、NL 遅延)は 2026 春時点の状況。**月次で監視継続が必要**。
- QTSP コスト(初期 300-700k EUR、推定)は WebSearch 集約による。NCA / CAB から直接見積もり取得は Phase 1 で実施。
