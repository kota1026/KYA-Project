---
type: density-survey
track: A
phase: 0 / W2
created: 2026-05-20
last_updated: 2026-05-20
status: active
scope: KYA Layer 競合密度調査(8 社 + α)
related:
  - tracks/A-competitors/aws-bedrock-agentcore-payments.md
  - inbox/2026-05-20-aws-bedrock-agentcore-payments.md
---

# KYA Layer Density Survey — 2026 W2

## 目的

W1 で暫定確定した「Multi-cloud Agent Identity & Compliance Layer(L3 / KYA Layer)を狙う」ポジショニング仮説について、**サードパーティで既に強いプレイヤーが存在しないか**を 1 社あたり 0.5-1 ページの lighter sketch で密度評価し、来週 W3 で full profile 化すべき上位 2-3 社を特定する。

AWS Bedrock AgentCore Payments(L2)は 2026-05-07 Preview launch、x402 + Coinbase + Stripe + Privy で配管を押さえた。「KYA」という用語は AWS docs にゼロだが、本サーベイで分かった通り、サードパーティ側では既に **複数の "KYA" 製品・標準化イニシアチブ** が走っている。

---

## 0. 全体俯瞰(調査前の整理)

**用語の出処と分岐**:
- 「Know Your Agent(KYA)」用語の **オリジネーター** は **Skyfire**(2024 創業、2025-06 KYAPay protocol 発表、2025-12 Visa Intelligent Commerce との PoC)。投資家に Coinbase Ventures、a16z CSX、DCVC([Stellagent blog](https://stellagent.ai/insights/skyfire-kyapay-know-your-agent) 2026 / [Skyfire businesswire 2025-06-26](https://www.businesswire.com/news/home/20250626772489/en/Skyfire-Launches-Open-KYAPay-Protocol-With-Agent-Checkout) アクセス 2026-05-20)。
- Trulioo / Sumsub / Persona / Vouched / Microblink は既存 KYC ベンダーが **KYA 文脈へ拡張**(2025-08 〜 2026-01 にかけて立て続けに発表)。
- AgentFacts / Stellagent / Skyfire / ATXP / KYA-OS(Vouched 経由 DIF)は **標準化 / プロトコル** レイヤー。
- knowyouragent.network / knowyouragent.xyz は **独立した小規模スタートアップ**(soulbound / checkout layer)。

**Skyfire は W2 のスコープ外だが、KYA 用語の originator として隣接深掘り候補(W3 検討)**。

---

## 1. ATXP(Circuit & Chisel)

- **slug**: atxp
- **website**: https://atxp.ai/
- **KYA に対するスタンス**: **製品の前提条件として組み込み済み**(KYA = agent identity + delegation chain + capability limits + behavior consistency を「payment 認可前に検証するレイヤー」と定義)
- **主力プロダクト**: ATXP(Agent Transaction Protocol) — MCP tool 向け pay-per-use、agent wallet、email、phone を agent に配るインフラ
- **KYA 関連プロダクトの実在性**: ⚠️ Beta(ATXP は GA に近いが「KYA」自体は 解説 blog + ATXP credit の attribution 機能として実装、専用 SKU なし)
- **顧客例**: 公表は薄いが、ATXP Chat / Music / Pics / Video など自社 dogfooding プロダクトを公開([atxp.ai](https://atxp.ai/) アクセス 2026-05-20)。エンタープライズ顧客名は未確認
- **資金調達ステージ**: **Seed $19.2M(2025-09)**、Primary Venture Partners + ParaFi Capital リード、Stripe、Coinbase Ventures、Solana Ventures、Samsung Next、Polygon Labs 参加。エンジェルに Anatoly Yakovenko、Raj Gokal、Google Cloud Web3 Head、Kraken Co-CEO 等([financialit.net](https://financialit.net/news/fundraising-news/circuit-chisel-secures-192-million-and-launches-atxp-web-wide-protocol-agentic) アクセス 2026-05-20)
- **AgentCore との関係**: **直接統合の公式発表なし**(投資家には Stripe / Coinbase Ventures が居る = AWS x402 ecosystem と背後資本が重なる)。ATXP 側 blog で AWS AgentCore を解説するなど、ecosystem player として位置取り
- **創業者**: Louis Amira(元 Stripe Head of Crypto & AI Partnerships)、David Noel-Romas(元 Stripe Head of Crypto Engineering)— **Stripe 系の人脈直結**
- **深掘り価値(KYA Project 視点)**: **★★★(高)**
- **推奨アクション**: **来週 W3 で full profile 化**(理由: Stripe 出身 + Coinbase / Solana / Polygon の資本構造 = AWS x402 と Google AP2 の両方に橋渡しできる中立 protocol を志向。KYA Project と最も直接の競合になる可能性)
- **主要ソース**:
  - [ATXP: KYA explained blog](https://atxp.ai/blog/know-your-agent-kya-explained/)(アクセス 2026-05-20)
  - [Circuit & Chisel $19.2M Seed](https://financialit.net/news/fundraising-news/circuit-chisel-secures-192-million-and-launches-atxp-web-wide-protocol-agentic)(アクセス 2026-05-20)
  - [GitHub atxp-dev/atxp](https://github.com/atxp-dev/atxp)(アクセス 2026-05-20)

---

## 2. Trulioo

- **slug**: trulioo
- **website**: https://www.trulioo.com/
- **KYA に対するスタンス**: **正式 framework として提唱**。**Digital Agent Passport (DAP)** という独自概念を中核に据え、Worldpay と Google AP2 にバンドル展開済み。Stellagent blog によれば DAP は「KYA framework の technical heart」と位置付けられる
- **主力プロダクト**: Global Identity Platform(KYC + KYB + AML、ID-DV、Watchlist screening 等)+ **Know Your Agent / Digital Agent Passport**(2025-08 発表)
- **KYA 関連プロダクトの実在性**: ✅ GA(white paper + 製品ページあり、Worldpay 統合は GA に近い実運用 PoC)
- **顧客例**: **Worldpay**(2025-08 提携、merchant 向け KYA 提供)、**Google**(AP2 への参加発表 2025-12-04、Google 自身が Trulioo を KYC ベンダーとして利用中)、PayOS(KYA white paper 共著)、450+ enterprise customers([getlatka.com](https://getlatka.com/companies/trulioo) アクセス 2026-05-20)
- **資金調達ステージ**: **Series D $394M(2021-06、TCV リード)、累計 $477M、評価額 $1.75B**([Crunchbase](https://www.crunchbase.com/organization/trulioo) アクセス 2026-05-20)。2025-2026 で IPO or strategic acquisition 観測(businessmodelcanvastemplate.com、推定)
- **AgentCore との関係**: **未確認**(Google AP2 側にバンドル。AWS x402 側との公式発表は本 W2 サーベイ範囲では確認できず)
- **深掘り価値(KYA Project 視点)**: **★★★(高)**
- **推奨アクション**: **来週 W3 で full profile 化**(理由: KYA を「framework として ship 済み」「Worldpay × Google AP2 という超巨大配管に既に組み込み」「累計 $477M 調達」— **本サーベイ最強の競合**。KYA Project の "L3 が空いている" 仮説に対して最も鋭く反証する存在)
- **主要ソース**:
  - [Trulioo KYA white paper](https://www.trulioo.com/resources/white-papers/know-your-agent-an-identity-framework-for-trusted-agentic-commerce)(アクセス 2026-05-20)
  - [Trulioo + Worldpay KYA partnership](https://www.biometricupdate.com/202508/trulioo-partners-with-payment-platform-worldpay-to-offer-know-your-agent-to-merchants)(アクセス 2026-05-20)
  - [Trulioo joins Google AP2(2025-12-04)](https://finovate.com/trulioo-joins-googles-agent-payments-protocol-ap2-to-secure-agent-led-payments/)(アクセス 2026-05-20)

---

## 3. Persona(Persona Identities, Inc.)

- **slug**: persona
- **website**: https://withpersona.com/
- **KYA に対するスタンス**: **製品化済み**。"Safe Agentic Commerce Starts With KYA and Dynamic IDV" として agent transactions を自動ルーティングする paving solution あり
- **主力プロダクト**: Identity verification platform(KYC / AML / KYB / 年齢確認)+ **Case Review Agents**(AI decisioning for high-stakes ID decisions、2026 Early Access)
- **KYA 関連プロダクトの実在性**: ⚠️ Beta(blog ベース + Case Review Agents は Early Access、専用「KYA SKU」はまだ命名ベース)
- **顧客例**: **OpenAI**、Lime、Heritage Bank、2024 で 3 億超の verifications 処理([fintechfutures.com](https://www.fintechfutures.com/venture-capital-funding/us-identity-platform-persona-hits-2bn-valuation-after-200m-series-d) アクセス 2026-05-20)
- **資金調達ステージ**: **Series D $200M(co-led Founders Fund + Ribbit Capital)、評価額 $2B**。既存に BOND、Coatue、Chemistry、First Round、Index Ventures。2021 の Series C は $150M / 評価額 $1.5B
- **AgentCore との関係**: **未確認**(OpenAI が顧客 = AWS Bedrock managed OpenAI 経由で間接接点はあり得るが公式発表なし)
- **2026-02 セキュリティ事案**: Federal Risk and Authorization Management Program 関連の coding 露出([therage.co](https://www.therage.co/persona-age-verification/))。reputational risk あり
- **深掘り価値(KYA Project 視点)**: **★★(中)**
- **推奨アクション**: **watch list**(理由: KYA を製品名として打ち出していない / blog レイヤー。OpenAI 顧客 + $2B 評価は無視できないが、Trulioo ほど標準化レイヤーには踏み込んでいない。Case Review Agents の進化次第で W4-W5 で再評価)
- **主要ソース**:
  - [Persona: Safe Agentic Commerce Starts With KYA](https://withpersona.com/blog/safe-agentic-commerce-starts-with-kya-and-dynamic-idv)(アクセス 2026-05-20)
  - [Persona Series D $200M](https://www.fintechfutures.com/venture-capital-funding/us-identity-platform-persona-hits-2bn-valuation-after-200m-series-d)(アクセス 2026-05-20)
  - [Persona Case Review Agents Early Access](https://withpersona.com/blog/introducing-early-access-for-case-review-agents)(アクセス 2026-05-20)

---

## 4. Sumsub(Sum and Substance)

- **slug**: sumsub
- **website**: https://sumsub.com/
- **KYA に対するスタンス**: **製品化済み**。2026-01-29 に "AI Agent Verification" を KYA framework の一部として正式 launch。**Agent-to-Human Binding** という独自コンセプト(automation を verified human identity に動的に紐付け)を打ち出し
- **主力プロダクト**: KYC / AML / KYB プラットフォーム + **AI Agent Verification(KYA framework 内)**
- **KYA 関連プロダクトの実在性**: ✅ GA(2026-01-29 launch、PR Newswire 経由で複数地域カバー)
- **顧客例**: fintech、crypto、trading、gaming で 4,000+ 顧客(LeadIQ 2024 時点、推定)。具体名は公開薄
- **資金調達ステージ**: **Series D $157M、累計 $250M+、評価額 $1.1B**+(IVP、Accel、Permira、Emergence Capital、Pritzker Group、Chicago Ventures 等)([Crunchbase](https://www.crunchbase.com/organization/sum-substance) アクセス 2026-05-20)。2026-02 時点で 987 employees
- **AgentCore との関係**: **未確認**(KYA 側として AWS / Google どちらの protocol にもバンドル発表なし)
- **深掘り価値(KYA Project 視点)**: **★★★(高)**
- **推奨アクション**: **来週 W3 で full profile 化**(理由: Trulioo と並び KYA を製品化済み + ユニコーンスケール + 「Agent-to-Human Binding」というコンセプトは KYA Project が狙う "human delegation audit" と直接重複)
- **主要ソース**:
  - [Sumsub KYA blog](https://sumsub.com/blog/know-your-agent/)(アクセス 2026-05-20)
  - [Sumsub AI Agent Verification launch 2026-01-29](https://sumsub.com/newsroom/sumsubs-ai-agent-verification-introduces-agent-to-human-binding-to-establish-human-accountability-in-ai/)(アクセス 2026-05-20)
  - [Help Net Security 2026-01-29](https://www.helpnetsecurity.com/2026/01/29/sumsub-ai-agent-verification/)(アクセス 2026-05-20)

---

## 5. Vouched

- **slug**: vouched
- **website**: https://www.vouched.id/
- **KYA に対するスタンス**: **製品化 + 標準化への donation 両建て**。**KYA Suite**(Agent Checkpoint、Agent Detect、Agent Govern、MCP-I、Know That AI、Identiclaw)を 2025-2026 で連続 launch。2026-03 に MCP-I を **DIF(Decentralized Identity Foundation)に donate**、**KYA-OS** にリネームされ DIF Trusted AI Agents WG で governance 開始
- **主力プロダクト**: 旧来は ID document verification(driver's license + selfie)。現在は **Agent Checkpoint = AI agent detection / classification / governance**
- **KYA 関連プロダクトの実在性**: ✅ GA(KYA Suite は商用、KYA-OS は仕様として DIF 配下で open governance)
- **顧客例**: 公開薄(40 employees の small startup、2026 FinTech Breakthrough Award "ID Verification Solution of the Year")
- **資金調達ステージ**: **Series A $17M(2025-09、Spring Rock Ventures リード、BHG VC 参加)、累計 $22M、40 employees**。**Madrona Venture Labs から spinout**([GeekWire](https://www.geekwire.com/2025/id-verification-startup-vouched-raises-17m-as-it-builds-ai-tools-for-new-future-of-identity/) アクセス 2026-05-20)
- **AgentCore との関係**: **未確認**(KYA-OS は MCP ベース → Anthropic / Claude 系と親和性高。AWS 側との直接統合は確認できず)
- **戦略的注目点**: **オープン標準化路線の最右翼**。Trulioo は商用 framework、Sumsub も商用、Vouched **だけが DIF へ donate** している。DID + VC ベース = KYA Project がオープン標準ベースで動くなら **協業相手 / 上流標準** になり得る
- **深掘り価値(KYA Project 視点)**: **★★★(高)**
- **推奨アクション**: **来週 W3 で full profile 化(優先度高)**(理由: KYA-OS standard が DIF 内で固まると、**KYA Project の "中立 multi-cloud" 戦略が標準準拠で正当化できる**。逆に KYA-OS が de facto になれば KYA Project は「KYA-OS 実装の SDK ベンダー」になり、上流の Vouched / DIF の動向が戦略を支配する)
- **主要ソース**:
  - [Vouched Know Your Agent product page](https://www.vouched.id/know-your-agent)(アクセス 2026-05-20)
  - [DIF KYA-OS announcement 2026-03](https://blog.identity.foundation/kya-os/)(アクセス 2026-05-20)
  - [Vouched $17M Series A 2025-09](https://www.businesswire.com/news/home/20250904708838/en/Vouched-Announces-%2417-Million-Series-A-to-Accelerate-Expansion-Building-on-Know-Your-Agent-KYA-Suite-Success)(アクセス 2026-05-20)

---

## 6. AgentFacts(Jared Grogan / Universitas AI)

- **slug**: agentfacts
- **website**: https://agentfacts.org/
- **KYA に対するスタンス**: **"Universal KYA Standard" を自称する独立イニシアチブ**(arXiv 2506.13794 で論文発表、Apache 2.0 license)。**10 カテゴリの metadata standard**(食品の Nutrition Facts に倣う標準化アプローチ)
- **主力プロダクト**: AgentFacts Universal KYA Standard(仕様 + generator tool + GitHub repo)
- **KYA 関連プロダクトの実在性**: 🚧 **発表のみ / 標準提案レベル**。商用 SaaS ではなく **個人主導の標準化提案**(Jared Grogan = Universitas AI CEO、UAE R&D 経験者)。Universitas AI 内 digital twin 用途で利用、financial services / gaming / Web3 で enterprise pilots(公開ロゴなし、推定)
- **顧客例**: Universitas AI(自社利用)。エンタープライズパイロットの具体名は **未確認**
- **資金調達ステージ**: **非公開 / 不明**(個人 / 小規模研究所運営、推定)
- **AgentCore との関係**: **不明**(model / framework agnostic を謳う = OpenAI、Anthropic、LangChain、CrewAI、AutoGen 全対応の方針、独立 spec)
- **深掘り価値(KYA Project 視点)**: **★(低)〜★★(中)**
- **推奨アクション**: **watch list**(理由: 商業基盤が薄く製品競合とは言えない。だが **arXiv に論文 + NANDA Index と連携(arXiv 2507.14263)** = 学術 / 標準化レイヤーで言及される可能性。KYA Project が compliance attestation を仕様化するときに参照すべき)
- **主要ソース**:
  - [AgentFacts KYA standard](https://agentfacts.org/kya)(アクセス 2026-05-20)
  - [arXiv 2506.13794 AgentFacts paper](https://arxiv.org/abs/2506.13794)(アクセス 2026-05-20)
  - [arXiv 2507.14263 NANDA Index + AgentFacts](https://arxiv.org/abs/2507.14263)(アクセス 2026-05-20)

---

## 7. Stellagent(Stellagent Inc.)

- **slug**: stellagent
- **website**: https://stellagent.ai/
- **KYA に対するスタンス**: **blog で言及のみ + 隣接製品**。KYA framework の解説 blog を多数公開(Trulioo DAP の解説、Skyfire KYAPay の解説等)= **KYA 自体は提唱者ではない、ecosystem analyst / 隣接プレイヤー**
- **主力プロダクト**: **Presso**(EC + 広告 + analytics + 顧客データの hub)+ **Agentic Commerce Studio**(2026-05-14 launch — AI shopping readiness 検証ツール、自然言語 → 商品検索 → カート → 決済準備の browser demo)
- **KYA 関連プロダクトの実在性**: ❌ **直接の KYA プロダクトなし**(blog ベースの解説者)。Agentic Commerce Studio は KYA というよりも **merchant 側 "AI shopping readiness" 製品**
- **顧客例**: 公開薄(2026-05-14 launch 直後、selected partners with demos)
- **資金調達ステージ**: **不明 / 非公開**(日本拠点、推定)
- **AgentCore との関係**: **言及のみ**(blog で AWS / Google / Skyfire を横断分析)
- **深掘り価値(KYA Project 視点)**: **★(低)**
- **推奨アクション**: **drop / watch only**(理由: KYA の競合ではなく、**KYA を解説する隣接 commerce プレイヤー**。日本市場の merchant 向け agentic commerce 製品は KYA Project とレイヤーが違う。ただし日本市場参入時に **パートナー候補** として記憶)
- **主要ソース**:
  - [Stellagent KYA framework blog](https://stellagent.ai/insights/kya-know-your-agent-framework)(アクセス 2026-05-20)
  - [Stellagent Agentic Commerce Studio launch 2026-05-14](https://www.prnewswire.com/news-releases/stellagent-launches-agentic-commerce-studio-for-ai-agent-shopping-readiness-302772393.html)(アクセス 2026-05-20)

---

## 8. Microblink

- **slug**: microblink
- **website**: https://microblink.com/
- **KYA に対するスタンス**: **"Know Your Actor" として独自リブランド**。一般的な「Know Your Agent」とは綴り違うが意味的に同じレンジ。2026 を "Know Your Actor era" と位置付けて自社プラットフォーム = **Identity Intelligence OS** を再ポジショニング
- **主力プロダクト**: BlinkID(2,500+ ID document types、140 countries)+ **Identity Intelligence OS**(2026 reframe)
- **KYA 関連プロダクトの実在性**: ⚠️ Beta / マーケティング先行(blog で agentic commerce protocol を解説、glossary に KYA エントリー、商用 SKU としては既存 BlinkID/Platform の延長で agentic 対応を打ち出している)
- **顧客例**: 50 banks + telcos と提携、2025 で 29 億 ID verification を処理、100M+ end users。2026-03 US DHS Remote Identity Validation Rally で 7 ベンダー中唯一全 3 指標で "high performing"
- **資金調達ステージ**: **Series A 2020-12 で含む累計 $100M**([Crunchbase](https://www.crunchbase.com/organization/microblink) アクセス 2026-05-20)。bootstrapped 起源、Croatia / NYC dual HQ
- **AgentCore との関係**: **未確認**(blog で agentic commerce protocol を解説するが、AWS / Google プロトコルとの公式統合発表なし)
- **深掘り価値(KYA Project 視点)**: **★★(中)**
- **推奨アクション**: **watch list**(理由: KYA という用語は微妙にずれている "Know Your **Actor**"。document verification 強い既存ベンダーの agentic 拡張で、KYA Project の "L3 multi-cloud SDK" とは直接競合しない。但し DHS で唯一の "high performing" は **regulated 市場での認証実績** として強い参考になる)
- **主要ソース**:
  - [Microblink Know Your Actor blog](https://microblink.com/resources/blog/why-the-future-of-identity-is-kya-know-your-actor/)(アクセス 2026-05-20)
  - [Microblink 2026 newsroom](https://microblink.com/about/newsroom/microblink-heads-into-know-your-actor-era-of-2026/)(アクセス 2026-05-20)
  - [Microblink KYA glossary](https://microblink.com/resources/glossary/what-is-kya-know-your-agent/)(アクセス 2026-05-20)

---

## 9. (発見) Know Your Agent Network / KnowYourAgent(.network / .xyz)

- **slug**: knowyouragent-network-xyz
- **website**: https://knowyouragent.network/ + https://knowyouragent.xyz/
- **KYA に対するスタンス**: **小規模 vertical 特化スタートアップ 2 件**(別組織)
  - **.network**: オンチェーン agent 向け soulbound identity + trust scoring + wallet tenure analysis(Web3 / DeFi 寄り)
  - **.xyz**: merchant checkout 時に AI shopping agent を verify する API。AID(Agent ID)、signed trace、Pre-Dispute Network を提供
- **主力プロダクト**: 上記の通り、それぞれ別組織
- **KYA 関連プロダクトの実在性**: ⚠️ Beta(両方とも実装ありだが採用規模 小、Web で確認できる商用顧客例 限定的)
- **顧客例**: **未確認**(.xyz は directory ページがあるが代表顧客名は確認できず)
- **資金調達ステージ**: **不明 / 非公開**(両ドメインとも公式 funding 発表なし、推定 pre-seed / seed)
- **AgentCore との関係**: **不明**
- **深掘り価値(KYA Project 視点)**: **★(低)〜★★(中)**
- **推奨アクション**: **watch list**(理由: ニッチ。但し .xyz の「Pre-Dispute Network = チャージバック前介入」は KYA Project の dispute mediation コンセプトと直接重なる。**先行者として disputes 領域のメンタルモデルを学ぶ**)
- **主要ソース**:
  - [knowyouragent.network](https://knowyouragent.network/)(アクセス 2026-05-20)
  - [knowyouragent.xyz](https://knowyouragent.xyz/)(アクセス 2026-05-20)
  - [knowyouragent.xyz docs](https://knowyouragent.xyz/docs)(アクセス 2026-05-20)

---

## 10. (隣接で重要) Skyfire — 用語のオリジネーター

スコープ外だが、サーベイ過程で **KYA という用語の originator** であることが確定したため記録:

- **website**: https://skyfire.xyz/
- **製品**: **KYAPay protocol**(USDC stablecoin settlement、agent-to-agent micropayments、2025-06 launch)+ **KYA framework**(provider review + operational policy review + purpose verification + security check で KYA-verified agent ID 発行)
- **顧客 / パートナー**: **Visa Intelligent Commerce(2025-12 PoC)**、Anthropic / Cohere / Replicate / Hugging Face で metered billing 実験
- **投資家**: Evolution、DCVC、a16z CSX、Coinbase Ventures、Neuberger Berman、Brevan Howard Digital
- **標準化動向**: **IETF draft-skyfire-kyapayprofile-01**(KYAPay Profile を IETF datatracker に投稿、推定 2025 後期)
- **KYA Project への含意**: **W3 の full profile 候補に追加すべき強い理由あり**。Skyfire が用語のオリジネーター + IETF 標準化に動いている。「KYA Layer の中立配管」を目指す KYA Project は Skyfire を上流 protocol として **採用 / 互換 / 拮抗** のいずれかを早期に決める必要がある
- **主要ソース**:
  - [Skyfire KYAPay product page](https://skyfire.xyz/product/)(アクセス 2026-05-20)
  - [Skyfire + Visa Intelligent Commerce demo 2025-12](https://www.businesswire.com/news/home/20251218520399/en/Skyfire-Demonstrates-Secure-Agentic-Commerce-Purchase-Using-the-KYAPay-Protocol-and-Visa-Intelligent-Commerce)(アクセス 2026-05-20)
  - [IETF draft-skyfire-kyapayprofile-01](https://datatracker.ietf.org/doc/draft-skyfire-kyapayprofile/)(アクセス 2026-05-20)

---

## 総合判定

### KYA Layer の密度評価

**「KYA Layer は既に著しく混雑している」**。本サーベイの結論は、W1 で前提とした「L3 が空いている」仮説に対する **強い反証材料** を提供する。

- **製品化済みプレイヤー(GA / 商用提供あり)**: **6 社**
  - Trulioo(KYA framework + Digital Agent Passport、Worldpay + Google AP2 にバンドル)
  - Sumsub(AI Agent Verification、Agent-to-Human Binding、2026-01-29 GA)
  - Vouched(KYA Suite + MCP-I → KYA-OS を DIF へ donate)
  - Skyfire(KYAPay protocol、Visa PoC、用語のオリジネーター)
  - ATXP(agent identity + payments を統合製品化、$19.2M Seed)
  - Microblink(Know Your **Actor** リブランド、Identity Intelligence OS)

- **主に marketing / blog レベル**: **2 社**
  - Persona(blog 多数 + Case Review Agents は Early Access、専用 KYA SKU なし)
  - Stellagent(隣接 commerce 製品、KYA は解説者ポジ)

- **標準提案 / 仕様レベル**: **2 件**
  - AgentFacts(arXiv 論文 + Apache 2.0 spec、商業基盤薄)
  - knowyouragent.network / .xyz(2 つの独立スタートアップ、規模小)

### 業界構造のサプライズ発見

1. **オープン標準化が既に始まっている**:
   - **DIF + Vouched の KYA-OS**(2026-03、DID + VC ベース)
   - **IETF + Skyfire の draft-skyfire-kyapayprofile-01**
   - **AgentFacts の Apache 2.0 spec**
   - つまり「KYA はベンダー固有」ではなく「**業界標準として固まりつつある**」ステージ

2. **既存 KYC ユニコーンが KYA に総出動**:
   - Trulioo($1.75B 評価、Google AP2 + Worldpay)
   - Sumsub($1.1B+ 評価、AI Agent Verification GA)
   - Persona($2B 評価、blog + Case Review Agents)
   - **累計 $5B+ 評価の既存ベンダー** が KYA レイヤーに資金 / ブランドを投入済み

3. **配管側との bundling が進行**:
   - Trulioo × Worldpay × Google AP2(merchant 側)
   - Skyfire × Visa Intelligent Commerce(card rails 側)
   - ATXP は Stripe / Coinbase 出身者が創業 + Stripe / Coinbase Ventures が出資
   - **AWS x402 ecosystem だけが KYA レイヤーで明確なバンドルパートナーをまだ宣言していない** = **唯一の戦略的余白**

4. **Persona 2026-02 セキュリティ事案** は識別情報 verification 領域のレピュテーションリスクとして要監視。**KYA Project が PII を直接保持しない設計** で差別化できる根拠材料

### KYA Project ポジショニング仮説への影響

**判定: 「L3 が空いている」仮説は ⚠️ 修正必要(棄却ではない)**。

#### なぜ完全棄却でないか

- **AWS x402 ecosystem + KYA レイヤーの公式バンドル** はまだ未締結。Google AP2 側は Trulioo がほぼ占有したが、AWS x402 側は空いている
- **multi-cloud + multi-protocol(x402 / AP2 / ACP / MPP)横断の中立配管** は誰も完全には埋めていない:
  - Trulioo は Google AP2 寄り
  - Skyfire は KYAPay 独自
  - Vouched / DIF は MCP-I / KYA-OS で MCP 寄り
  - ATXP は自己プロトコル
- **規制 attestation(EU AI Act + 各国 KYC/AML 監督への audit 提出 packaging)** は Trulioo / Sumsub の延長線上だが、**multi-cloud SDK としての packaging** はまだ未着手

#### なぜ修正が必要か

- 「KYA という用語の創造者」ポジションは既に **Skyfire** に取られている
- 「standard をリードする」ポジションは既に **DIF + Vouched(KYA-OS)** に取られている
- 「KYC ユニコーンの延長で KYA 化」ポジションは **Trulioo / Sumsub** が押さえている
- **KYA Project が "KYA framework の提唱者" を狙うのは不可能**

#### 新ポジショニング案(コタ判断材料)

| 案 | 内容 | 評価 |
|----|------|------|
| **A. KYA-OS 実装 SDK ベンダー** | DIF KYA-OS 標準に準拠した multi-cloud SDK を提供。日本市場 + 規制提出 packaging で差別化 | ✅ オープン標準に乗る分、リスク低 / 利益も限定的 |
| **B. AWS x402 ecosystem 専用 KYA レイヤー** | Trulioo が Google AP2 を取った逆を取る。AWS Marketplace で SDK 配布、Coinbase / Stripe / Privy と直接統合 | ⚠️ AWS 側に Trulioo / Sumsub が後から入る可能性高 |
| **C. 規制 attestation packaging 特化** | KYC ベンダーは持っていない「監督官庁提出形式 audit trail」を multi-cloud で生成。日本 FSA / EU AI Act / SEC 監督対応に特化 | ★ 唯一 Trulioo / Sumsub が触っていない領域。**最有力候補** |
| **D. Drop / Path D** | L3 が既に過密、撤退 | 検討余地あり |

#### Path D(drop)を検討すべきか

**結論: 即時 drop は推奨しない、ただし W4-W6 で再判定が必要**。

- 6 社が GA、$5B+ 既存ベンダー、3 つのオープン標準 = 過密ではあるが、**multi-cloud + 規制 attestation packaging + 日本市場** という三軸の交差点は埋まっていない
- W3 の full profile(Trulioo、Sumsub、Vouched、+ Skyfire / ATXP のどちらか)で **「彼らが日本市場 / multi-cloud / 規制 attestation を狙っているか」を精査**
- 狙っていれば Path D も含めて再判定。狙っていなければ 案 C(規制 attestation packaging 特化)で 6-9 ヶ月の戦略空間が残る

### 来週 W3 で full profile 化すべき上位 3 社

優先順:

1. **Trulioo**(★★★)— **最強の競合**。Google AP2 + Worldpay バンドル済み、Series D $394M、KYA を framework として完全製品化。**KYA Project が日本市場で勝てるか** は Trulioo の日本展開状況に直結
2. **Sumsub**(★★★)— Agent-to-Human Binding コンセプトが KYA Project の human delegation audit と直接重複。Permira / IVP / Accel バック、$1.1B+ valuation。GA 製品との詳細比較必須
3. **Vouched + DIF KYA-OS**(★★★)— **オープン標準の rationale**。$22M しか資金調達していないが、DIF を経由した standard donate で **長期的支配力は最大級**。KYA Project が「KYA-OS 準拠実装」を選ぶか「対抗仕様を出す」かの戦略判断材料

**次点(W3 後半 / W4 候補)**:
4. **Skyfire**(★★★)— 用語のオリジネーター + IETF draft、Visa との PoC。**Skyfire との競合 / 互換性が KYA Project の最大の戦略変数**
5. **ATXP**(★★★)— Stripe 出身 + Coinbase / Solana 資本構造、AWS x402 ecosystem への parallel play

### 重要な発見(decision-doc.md §0 §3 §5 反映候補)

#### §0(エグゼクティブサマリ反映候補)

- 「KYA レイヤーは 2026 W2 時点で **6 社 GA、$5B+ 既存ベンダー、3 つのオープン標準** = 過密」。当初仮説の "L3 が空いている" は **修正が必要**
- 競合不在を前提とする戦略は撤回。**差別化軸は (1) AWS x402 ecosystem 側のパートナー空白、(2) 規制 attestation packaging、(3) 日本市場 + multi-cloud** の三点交差

#### §3(競争環境)反映候補

- KYA 用語のオリジネーター: **Skyfire**(2024 創業、2025-06 KYAPay launch)
- オープン標準化トリオ: **DIF KYA-OS**(Vouched donate)、**IETF KYAPay Profile**(Skyfire)、**AgentFacts**(arXiv / Apache 2.0)
- 既存 KYC ユニコーン陣営: Trulioo($1.75B)、Sumsub($1.1B+)、Persona($2B)
- 配管バンドル状況:
  - Google AP2: **Trulioo が占有**
  - Visa Intelligent Commerce: **Skyfire が占有**
  - AWS x402 + Bedrock AgentCore: **空白(戦略的余白)**

#### §5(戦略オプション)反映候補

- 「KYA framework の提唱者」を狙う path は **不可能**(Skyfire / Trulioo / Sumsub / Vouched に既取り)
- 案 A: KYA-OS 実装 SDK / 案 B: AWS x402 ecosystem 専用 / 案 C: 規制 attestation packaging 特化 / 案 D: drop の 4 択を W4-W6 で精査
- **案 C(規制 attestation packaging)が最有力候補**。理由: Trulioo / Sumsub が触っていない領域 + コタの個人資産(QSB / PQC 知見)が将来 audit trail 改ざん防止に応用可能 + 日本 FSA と組める可能性

---

## W3 アクション

- [ ] Trulioo full profile(5-dim)— 特に日本市場での顧客 / 拠点 / 規制 attestation 製品の有無
- [ ] Sumsub full profile(5-dim)— Agent-to-Human Binding の technical detail + 日本市場ステータス
- [ ] Vouched + DIF KYA-OS full profile — KYA-OS Task Force の Working Draft 取得、参加メンバー企業
- [ ] (W3 後半)Skyfire full profile — IETF draft-skyfire-kyapayprofile-01 一次資料、Visa PoC 詳細
- [ ] (Track B にも反映)Trulioo / Sumsub が日本 FSA、欧州 EBA、米国 FinCEN に対してどんな attestation packaging を提供しているか
- [ ] (Track D にも反映)KYA レイヤーの monetization model(per-verification、per-attestation、subscription)を 6 社で比較

## 参考: 本サーベイの限界

- WebSearch ベースで一次資料(各社 docs、IETF draft 本文、DIF Working Draft)は未読
- AgentFacts / knowyouragent.* の商業基盤は推定多め
- 日本市場での Trulioo / Sumsub / Persona の展開状況は別途 W3 で深掘り必要
- 法律意見・投資推奨ではない。最終判断は弁護士確認
