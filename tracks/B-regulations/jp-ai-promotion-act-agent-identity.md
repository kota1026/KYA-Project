---
topic: 日本 AI 推進法 + 金融庁 AI ガバナンス + 資金決済法 が Agent Identity / KYA 相当の義務を課すか
slug: jp-ai-promotion-act-agent-identity
last_updated: 2026-06-01
jurisdictions: [JP]
relevance_to_kya: high
status: draft
disclaimer: これは法律意見ではない。リサーチドキュメント。最終判断は弁護士確認必須。
---

# 論点: 日本で Agent Identity / KYA 相当の義務を課す規制があるか(2026-06 時点)

## TL;DR(結論先出し)

| 設問 | 答え | 根拠条文 / 文書 |
|------|------|----------------|
| 日本に **Agent Identity を明示的に義務化** する規制はあるか? | **No(明示義務なし)** | AI 推進法、金融庁 AIDP 1.1、犯収法 / 資金決済法のいずれにも "agent identity" "AIエージェント識別子" の定義語なし |
| **間接的に同等の義務** を課す枠組みはあるか? | **Yes(グレー寄り Yes、ソフトロー積層)** | AI 推進法 7 条(活用事業者の努力義務)、AI 事業者ガイドライン v1.2(2026-03-31)の **Human-in-the-Loop 要件**、金融庁 AIDP 1.1(2026-03-03)の "規制ギャップ" 記述、犯収法 4 条(取引時確認)、資金決済法 37 条(資金移動業) |
| KYA Layer は **そのまま compliance solution として位置取れる** か? | **Yes(条件付き、ただし EU より売り込みは難)** | AI 事業者ガイドライン v1.2 が agent の human-in-the-loop / トレーサビリティ / 最小権限を明文要求 → KYA はそのツール化として売れる。**ただしソフトロー = 強制力なし**、買い手の自発性に依存 |
| **PayPay が KYA SDK を使う時、PayPay 側で追加届出が必要か?** | **原則 No(設計次第)**、ただし **業務委託先に該当する設計**にすると関東財務局への業務委託届出が必要(資金移動業者監督指針 II-3) | KYA SDK を「PayPay 内部処理の補助ツール」として位置付けるか「KYA Project が独立して KYC/取引時確認を代行」するかで分岐 |
| 日本法人を設立する場合の MTL 相当負担 | **KYA Layer 単独なら不要**(資金移動業も暗号資産交換業も該当せず)、ただし **顧客のために確認業務を代行 / 預り金が発生する瞬間に資金移動業登録が必要化** | 銀行法 2 条 2 項、資金決済法 37 条 / 63 条の 2 |

**1 行で**: **日本は AI Agent 規制でほぼ無風(2026-06 時点)、ただしソフトロー(AI 事業者ガイドライン v1.2 + AIDP 1.1)が agent の human-in-the-loop / トレーサビリティ / 最小権限を明文要求 → KYA は技術ソリューションとして売り込み可能。法人設立国としての日本は「規制負担が EU より圧倒的に軽い + PayPay 等の最初の顧客と物理的に同居できる」点で最有力候補(推定、確度: 高)。**

---

## 1. 論点の定義

**問い**: AI Agent が API・他 Agent・人間に対して自律的に支払いを行う時、日本の現行法・ソフトローは agent の身元(identity)、人間との binding、capability attestation、audit trail を **明示的に義務化** しているか? また、KYA Project の SDK を組み込んだ PayPay 等のサービス提供者に、新たな規制負担が発生するか?

**なぜ KYA に関係するか**: `synthesis/decision-doc.md` §1(法人設立国)で **EU 域外スタート + 日本 / SG / UAE のいずれかが初期法人候補** と暫定方向性確定済み。日本は **PayPay = 最初の paying customer の所在国** でもあり、Path C(Hybrid)成立のための **最重要法域**。

**今回のスコープ**: 日本単一法域に絞った深掘り。US / EU / SG / UAE は別ファイル。

---

## 2. 日本法域マッピング(時系列で「現状(2026-06) → 2027 以降」)

### 2.1 適用法体系

| 規制 | 略称 | 適用日 | KYA への関係 |
|------|------|--------|--------------|
| 人工知能関連技術の研究開発及び活用の推進に関する法律(令和 7 年法律第 53 号) | **AI 推進法 / AI 新法** | 2025-06-04 公布、2025-09-01 全面施行 | Agent 開発者・活用事業者の努力義務 / 国の指導(罰則なし) |
| AI 事業者ガイドライン 第 1.2 版(経産省 + 総務省) | **AI 事業者 GL v1.2** | 2026-03-31 公表 | **AI エージェントへの Human-in-the-Loop 義務(ソフトロー)** |
| AI ディスカッションペーパー 第 1.1 版(金融庁) | **AIDP 1.1** | 2026-03-03 公表 | 金融機関 AI 活用の論点整理、規制ギャップ検出枠組み |
| 資金決済法(平成 21 年法律第 59 号) | **資金決済法** | 既施行(都度改正) | 為替取引、第二種資金移動業、暗号資産交換業、前払式 |
| 銀行法(昭和 56 年法律第 59 号) | **銀行法** | 既施行 | 為銀主義(4 条 1 項)、電子決済等代行業(52 条の 61 の 2 以下) |
| 犯罪による収益の移転防止に関する法律 | **犯収法 / 犯防法** | 既施行、2027-04-01 施行規則改正予定(マイナンバーカード公的個人認証一本化) | 取引時確認(4 条)、確認記録(6 条)、疑わしい取引届出(8 条) |
| 個人情報保護法 | **個情法** | 既施行、3 年ごと見直し検討中(法案提出時期未公表) | 仮名加工情報、匿名加工情報、個人関連情報 |
| 金融商品取引法 | **FIEA** | 既施行 | 投資助言業 / 投資運用業の登録 |
| 電気通信事業法 | — | 既施行 | Agent が能動的に通信する場合の論点 |
| 自主規制 | JVCEA / JCBA | 既施行 | 暗号資産業界、適格機関投資家向け販売規則(2025-03-26)等 |

### 2.2 AI 推進法の段階施行スケジュール

出典: [人工知能関連技術の研究開発及び活用の推進に関する法律 - eGov](https://laws.e-gov.go.jp/law/507AC0000000053)、[AI 法全面施行 - 内閣府(2025-10-03)](https://www.cao.go.jp/press/new_wave/20251003.html)、アクセス 2026-06-01

| 日付 | 適用範囲 |
|------|----------|
| 2025-05-28 | 参議院本会議で可決成立 |
| 2025-06-04 | 公布(令和 7 年法律第 53 号)、一部施行 |
| 2025-09-01 | **全面施行** |

→ 2026-06 時点ですでに **全面施行済み**。EU AI Act のような段階施行 / 高リスク義務延期(Omnibus)等の論点なし。**ただし罰則がない**ためエンフォースメント弱、規制リスクは EU より圧倒的に軽い。

### 2.3 サブ論点別の条文 / ガイドライン マッピング

#### サブ論点 1: AI 推進法は agent identity / 自律 AI を明示的に規制するか

**条文(一次資料 verbatim、WebSearch スニペット経由)**:

- **第 2 条(定義)**: AI 関連技術を「人工知能(人間と同等以上の知的処理能力を実現するソフトウェア…等)を活用した情報の処理、利用、提供等」と一般的に定義。**"AI エージェント" "自律型 AI" "重要 AI システム" の特別カテゴリ定義は存在しない**(推定、確度: 高 — 全 17 条構成の小規模法、特別カテゴリ条文なし)
- **第 7 条(活用事業者の責務)**: 「人工知能関連技術を活用した製品又はサービスの開発又は提供をしようとする者その他の人工知能関連技術を事業活動において活用しようとする者(以下「活用事業者」という。)は、**基本理念にのっとり、自ら積極的な人工知能関連技術の活用により事業活動の効率化及び高度化並びに新産業の創出に努めるとともに、第四条の規定に基づき国が実施する施策及び第五条の規定に基づき地方公共団体が実施する施策に協力しなければならない**」 — **「努力義務」、罰則なし**
- **第 11 条 - 第 17 条(国の基本的施策)**: 研究開発推進(11)、施設整備(12)、**適正性の確保(13)**、人材確保(14)、教育振興(15)、調査研究(16)、国際協力(17)
- **第 13 条(適正性の確保)**: 「国は、人工知能関連技術の研究開発及び活用が **国際的な規範に即して適正に行われる** ようにするため、必要な指針の整備その他の必要な施策を講ずるものとする」 — 指針整備が国の責務(具体的義務化なし)
- **第 16 条(指導等)**: 国が「**国民の権利利益の侵害が生じた事案を分析・検討し**」、その結果に基づいて研究開発機関や活用事業者に対し「**指導・助言・情報の提供等の必要な措置を講ずる**」

出典:
- [人工知能関連技術の研究開発及び活用の推進に関する法律(eGov)](https://laws.e-gov.go.jp/law/507AC0000000053)、アクセス 2026-06-01
- [AI 推進法 第 7 条(活用事業者の責務)- 富士修法律事務所](https://fujiosamu.com/ai-act-article-7/)、アクセス 2026-06-01
- [AI 推進法 第 13 条 – 適正性の確保 - 富士修法律事務所](https://law.fujiosamu.com/ai-act-article-13/)、アクセス 2026-06-01
- [日本版 AI 法の概要と企業への影響 - BUSINESS LAWYERS](https://www.businesslawyers.jp/articles/1475)、アクセス 2026-06-01
- [Japan "AI Promotion Act" - 小島法律事務所 JP-EN 参考訳(2025-09)](https://www.kojimalaw.jp/wp/wp-content/uploads/2025/09/Japan-AI-Promotion-Act-KOJIMA-LAW-OFFICES-jp-en-reference-translation.pdf)、アクセス 2026-06-01
- [AI 法案、柔軟規制で国会審議へ 罰則なし"ソフトロー"の狙いは(ASCII 2025)](https://ascii.jp/elem/000/004/254/4254565/)、アクセス 2026-06-01

**Agent identity への含意**:
- **明示的な agent identity 義務はゼロ**(条文に該当語なし、罰則なし)
- 努力義務(7 条)+ 国の指導権限(16 条)のみで、技術的要件は政令・主務省令でも未具体化
- **「適正性の確保」(13 条)経由で「人工知能関連技術の研究開発及び活用の適正性確保に関する指針」**が策定中 — agent identity がここに入る可能性は中-低(推定、AI 事業者 GL v1.2 と整合させる方向と推定)

#### サブ論点 2: AI 事業者ガイドライン v1.2(2026-03-31)の AI エージェント条項

**これが 2026-06 時点で実務上最重要のソフトロー**。

出典:
- [AI 事業者ガイドライン 第 1.2 版 PDF - 経産省(2026-03-31)](https://www.meti.go.jp/shingikai/mono_info_service/ai_shakai_jisso/pdf/20260331_1.pdf)、アクセス 2026-06-01
- [AI 事業者ガイドライン - 経産省告知ページ](https://www.meti.go.jp/shingikai/mono_info_service/ai_shakai_jisso/20260331_report.html)、アクセス 2026-06-01
- [森・濱田松本「AI 事業者ガイドライン第 1.2 版」ニュースレター](https://www.morihamada.com/ja/insights/newsletters/137701)、アクセス 2026-06-01
- [AI 事業者ガイドライン v1.2 と AI エージェント規制 - ailead Blog](https://www.ailead.app/blog/ai-governance-guideline-v12-agent-regulation-2026)、アクセス 2026-06-01
- [AI 事業者ガイドライン v1.2 公表 - 8and(2026-05-26)](https://8and.jp/2026/05/26/ai事業者ガイドライン-v1-2公表-経産省＋総務省、/)、アクセス 2026-06-01

**v1.2 の主要改訂点(二次資料の整理)**:

1. **AI エージェント定義の追加**: 「人間の指示に基づき、外部環境を認識し、自律的に計画を立案・実行し、目標達成のための行動を継続的に行う AI システム」
2. **Human-in-the-Loop(人間監視)義務化**: AI エージェントが **外部システムに自律的にアクションを取る場面** で人間の確認ステップを義務化。例: 「AI が顧客リストを見て自動でメール送信」「AI が在庫を見て自動で発注」では、**送信・発注の最終確認は人間が行う設計** にする必要
3. **最小権限原則**: エージェントがアクセスできるデータ・システム・機能を業務に必要な最小限に制限、定期的な権限棚卸し
4. **トレーサビリティ**: AI エージェントの行動ログを保持
5. **フィジカル AI への対応**: ロボット・自動運転への適用

**Agent identity への含意(KYA Project にとって重要)**:

- **これは事実上「KYA Layer の機能要件カタログ」になっている**:
  - Human-in-the-Loop → KYA の **delegation chain attestation**(誰が認可したかの記録)
  - 最小権限 → KYA の **capability scope VC**(SDK 提供する scope-bound credentials)
  - トレーサビリティ → KYA の **audit trail / agent identifier**
- **ただしソフトロー = 罰則なし** → 強制購買力は EU AI Act より弱い
- 売り方は「ガイドライン準拠を **証明可能な形で** パッケージ化」(=規制 attestation packaging の日本版)

**弁護士見解と当局見解の区別**:
- **当局見解(経産省 + 総務省告知)**: 「ガイドライン」であり法的拘束力なし、ただし「グッドプラクティス」として参照されるべき
- **弁護士見解(森濱田、TMI、ailead Blog 整理)**: 「**ガイドライン違反が直接の違法事由にはならないが、消費者保護法・不法行為責任の文脈で『相当の注意義務』水準として参照されるリスク**」(推定、確度: 高)
- **重要な留保**: 金融機関が AI エージェントを業務に使う場合、**金融庁監督指針 + AIDP 1.1 経由でガイドライン準拠が事実上の検査ポイントに昇格** する可能性(推定、確度: 中)

#### サブ論点 3: 金融庁 AI ディスカッションペーパー 第 1.1 版(2026-03-03)

**金融分野での agent 規制の起点**。

出典:
- [AI ディスカッションペーパー(第 1.1 版)告知 - 金融庁](https://www.fsa.go.jp/news/r7/sonota/20260303/aidp.html)、アクセス 2026-06-01(WebFetch 403、二次資料経由)
- [AI ディスカッションペーパー(第 1.1 版)PDF 直リンク](https://www.fsa.go.jp/news/r7/sonota/20260303/aidp_version1.1.pdf)、アクセス 2026-06-01
- [金融庁 AIDP 1.1 版の概要と内部監査への示唆 - PwC Japan](https://www.pwc.com/jp/ja/knowledge/column/ai-governance/ai-discussion-paper.html)、アクセス 2026-06-01
- [金融庁「AI 新ルール」徹底解説 - FinTech Journal(SBBit)](https://www.sbbit.jp/article/fj/184867)、アクセス 2026-06-01
- [【日本】金融庁、AIDP 第 1.1 版公表 - Sustainable Japan(2026-03-07)](https://sustainablejapan.jp/2026/03/07/fsa-ai-discussion-paper/122607)、アクセス 2026-06-01
- [金融庁 AI 官民フォーラム(第 3 回)議事要旨 - 2025-11-12](https://www.fsa.go.jp/singi/ai_forum/gijiyoshi/20251112.html)、アクセス 2026-06-01

**AIDP 1.1 の主要内容(二次資料整理)**:

1. **「2025 年は AI エージェント元年」と位置付け** → 2026 以降の金融サービスへの実装ユースケースを整理
2. **顧客対応生成 AI の「4 つの観点」整理**: 公平性 / 説明可能性 / 透明性 / 説明責任
3. **法令解釈の明確化**: **非公開情報伝達規制** との関係、業務委託先管理(監督指針)、犯収法との関係
4. **AI エージェント等の活用ユースケース展開**: 自動化業務、エージェント間連携
5. **目的志向のデータ管理重視**
6. **規制ギャップへの方針**: 「**重大な規制上のギャップが特定された場合には、法令上の対応も排除されるものではない**」(=現時点ではソフトローで対応、ギャップが顕在化したら新規立法の含み)

**重要な公式スタンス(金融庁)**:
- AIDP 1.1 は **「初期的な論点整理」であり「規制文書」ではない**(直ちに対応を求めるものではない)
- ただし **金融庁検査(オフサイト・モニタリング)で参照される蓋然性は高い**(弁護士見解 PwC / 中野秀俊氏)
- **アジャイル・ガバナンス**: 既存の枠組みでリスクに十分対応できているかを継続検証

**Agent identity / KYA への含意**:
- **agent identity を明文要求する条項はない**(推定、確度: 高、二次資料整理から)
- ただし **「業務委託先管理」「非公開情報伝達」「犯収法との関係」が論点化** → 金融機関が AI エージェント(または KYA SDK)を導入する際の **検査ポイント** になる
- これは KYA Project にとって **両刃の剣**:
  - **Pro**: 金融機関が「監督指針対応のため」KYA を導入する動機が生まれる
  - **Con**: KYA Project 自体が「業務委託先」扱いされると、PayPay 等の顧客側に追加の管理態勢義務(SLA、監査権、再委託管理)が降りる

#### サブ論点 4: 資金決済法 / 為銀主義 / 銀行法と agent payments

**問い**: AI Agent が transaction を発火する時、誰が「為替取引」を行ったことになるか?

**条文(一次資料の引用、WebSearch スニペット経由)**:

- **銀行法 2 条 2 項 2 号**: 「為替取引を行うこと」が銀行業の定義。「**顧客から、隔地者間で直接現金を輸送せずに資金を移動する仕組みを利用して資金を移動することを内容とする依頼を受けて、これを引き受けること、又はこれを引き受けて遂行すること**」(最高裁平成 13 年 3 月 12 日判決の定義)
- **銀行法 4 条 1 項**: 「銀行業は、内閣総理大臣の免許を受けた者でなければ、営むことができない」 — **為銀主義の中核**
- **資金決済法 37 条**: 「銀行等以外の者は、第二条第二項に規定する内閣府令で定めるところにより、内閣総理大臣の登録を受けたときは、為替取引(少額のものとして政令で定めるものに限る。)を業として営むことができる」 — **資金移動業の根拠**
- **資金決済法 36 条の 2(2021 改正)**: 第一種・第二種・第三種の 3 類型
  - **第一種(100 万円超)**: 業務実施計画の事前認可必須、滞留規制(送金関連性のない資金を滞留させない体制)
  - **第二種(100 万円以下)**: 登録のみ、滞留可
  - **第三種(5 万円以下)**: 登録のみ、より緩い

出典:
- [資金決済に関する法律(eGov)](https://laws.e-gov.go.jp/law/421AC0000000059)、アクセス 2026-06-01
- [銀行法(eGov)](https://laws.e-gov.go.jp/law/356AC0000000059)、アクセス 2026-06-01
- [銀行業と「為替取引」: 銀行規制の適用範囲のあり方 - 日本銀行リサーチラボ](https://www.boj.or.jp/research/wps_rev/lab/lab16j05.htm)、アクセス 2026-06-01
- [PayPay マネー 資金決済法に基づく表示 - PayPay 株式会社](https://about.paypay.ne.jp/terms/consumer/legal/money/)、アクセス 2026-06-01
- [資金移動業者関係 - 関東財務局](https://lfb.mof.go.jp/kantou/kinyuu/pagekt_cnt_20250516001sikinidou.html)、アクセス 2026-06-01
- [資金移動業の概要 - 日本資金決済業協会](https://www.s-kessai.jp/businesses/funds_transfer_overview.html)、アクセス 2026-06-01

**PayPay の登録区分**:
- **PayPay 株式会社 = 第二種資金移動業者(関東財務局長第 00068 号)**
- **PayPay 銀行 = 銀行(別法人)** で為替取引可能
- PayPay マネーは「銀行等が行う為替取引ではない」と明示

**Agent identity への当てはめ**:

| Agent のユースケース | 該当規制 | 判定 |
|---------------------|----------|------|
| AI Agent が PayPay 残高で支払う(ユーザー指示) | 既存の PayPay 資金移動業の範囲内 | **追加登録不要(設計次第)** |
| AI Agent が銀行口座から振込を起こす | 銀行 API 経由(電子決済等代行業) | **電子決済等代行業の登録要否を要検討** |
| AI Agent が複数 wallet 間で resource を移動する Bridge SDK(KYA Project) | KYA Project 自身が **資金の predicate を持たない** = 為替取引非該当 | **資金移動業登録不要(設計次第)** |
| AI Agent が暗号資産を売買・移動する | 資金決済法 2 条 7 項(暗号資産)、63 条の 2(暗号資産交換業) | **暗号資産交換業登録の論点(KYA Project が交換 / 預託しない限り非該当)** |

**為銀主義の論理(日本銀行リサーチラボ整理)**:
- 「銀行業」の中核は預金受入 + 与信 + 為替の 3 機能
- 為替の機能を **預金受入から切り離した類型** として資金移動業が 2010 年に導入
- 銀行法 4 条 1 項の免許主義はあくまで「銀行業」(預金+貸付+為替の総合)に対するもので、為替のみなら資金移動業で代替可能
- **AI Agent が「依頼を受けて引き受ける」主体になり得るか** は条文上未整理(推定、確度: 高 — 為替取引の主体は法人 / 自然人を前提)
- **KYA Project の設計指針**: agent はあくまで「**ユーザーの指示を伝達する技術的媒介**」であり、為替取引の主体は wallet 提供者(PayPay / 銀行)に保持 → 為銀主義の射程外を維持

#### サブ論点 5: 犯収法と Travel Rule

**条文(一次資料引用、WebSearch スニペット経由)**:

- **犯収法 4 条**: 特定事業者(金融機関、暗号資産交換業者、資金移動業者等)は「**特定取引を行うに際しては、顧客等について、本人特定事項その他の事項の確認を行わなければならない**」
- **犯収法 6 条**: 確認記録の作成・保存(7 年保管)
- **犯収法 8 条**: 疑わしい取引の届出
- **資金決済法 63 条の 10 + 内閣府令(2022 改正)**: 暗号資産交換業者の **Travel Rule** 義務(送付人・受取人情報の通知)

出典:
- [犯罪収益移転防止法(犯収法)とは - TrustDock](https://biz.trustdock.io/column/amlcft)、アクセス 2026-06-01
- [トラベル・ルールの監督におけるベスト・プラクティス - 金融庁(2025-06-27)](https://www.fsa.go.jp/inter/fatf/2025062702/2025062702.html)、アクセス 2026-06-01
- [マネー・ローンダリング等及び金融犯罪対策の取組と課題(2025-06) - 金融庁](https://www.fsa.go.jp/news/r6/20250627/01.pdf)、アクセス 2026-06-01
- [トラベルルールとは - bitFlyer](https://bitflyer.com/ja-jp/faq/5-20)、アクセス 2026-06-01

**重要な制度変更(2027-04-01 施行予定)**:
- **改正犯罪収益移転防止法施行規則**: 本人確認を **マイナンバーカードの公的個人認証サービス(JPKI)に原則一本化**(推定、確度: 高、複数二次資料一致)
- → これは **KYA Project の DID / VC 戦略に直接影響**:
  - JPKI のクライアント証明書 + 署名鍵を「日本固有の eIDAS 相当」として KYA Bridge SDK に組み込む必要性
  - did:jpki(仮称)のような method 拡張、または JPKI を VC issuer として利用する設計

**Agent identity への含意**:
- 犯収法上の「**取引時確認**」の主体はあくまで **特定事業者(PayPay / 銀行 / 暗号資産交換業者)** であり、**KYA Project 自体は特定事業者でない限り直接の確認義務を負わない**(推定、確度: 高)
- ただし KYA Project が PayPay 等の **業務委託先** として確認業務を代行する設計にすると、犯収法施行規則 32 条(委託先における確認実施の許容)経由で間接的義務が発生
- **KYA Project の設計指針**: 「**確認業務は委託しない、KYA はあくまで attestation の packaging / 検証ツール**」 → 犯収法の射程外を維持

#### サブ論点 6: 個人情報保護法(2025 改正検討中)

出典:
- [個人情報保護法 3 年ごと見直し - 個人情報保護委員会](https://www.ppc.go.jp/files/pdf/01-4_kisyahaifusiryou2.pdf)、アクセス 2026-06-01
- [2025 年個人情報保護法改正の動向 - 植野法律事務所](https://ueno.law/topics/【2025年】個人情報保護法改正の動向)、アクセス 2026-06-01
- [生成 AI の活用と法整備の現在 - 三浦法律事務所](https://note.com/miuraandpartners/n/n0949f5f0f022)、アクセス 2026-06-01

**現状(2026-06)**:
- 2025-03 時点で「3 年ごと見直し」の中間整理段階、**法案提出時期は公表されていない**(植野法律事務所整理)
- **仮名加工情報 / 匿名加工情報** の取扱見直しが検討中 → ZK proof / DID と整合性のある形での再設計余地
- **個人関連情報** の不適正利用規律強化検討

**Agent identity / KYA への含意**:
- KYA Project が **個人データを処理する場面** は限定的(human↔agent binding の証明データのみ)
- VC 内の personal claims は **「個人情報」該当の蓋然性高い** → 安全管理措置(20 条)+ 第三者提供制限(27 条)の論点
- **設計指針**: SD-JWT VC の Selective Disclosure で「最小開示」を強制、ZK proof で「保持しない検証」を提供 → 個情法対応の差別化要素

#### サブ論点 7: 電子決済等代行業との関係

**条文**: 銀行法 52 条の 61 の 2 以下(2017 改正で導入)

**該当ケース**:
1. **電子送金サービス**: 顧客の銀行に対する為替取引の依頼を伝達
2. **口座管理サービス**: 顧客の銀行口座情報を取得して顧客に提供

出典:
- [電子決済等代行業制度の概要 - 金融庁](https://www.fsa.go.jp/common/about/pamphlet/dendaigyo_start.pdf)、アクセス 2026-06-01
- [【オープン API】電子決済等代行業に該当しない行為について - 三宅法律事務所](https://www.miyake.gr.jp/notice/【オープンapi】電子決済等代行業に該当しない行為について/)、アクセス 2026-06-01

**Agent identity への当てはめ**:
- AI Agent が銀行 API 経由で送金を起こす場合、**Agent または KYA Bridge SDK 提供者が電子決済等代行業の登録を要する可能性**
- 三宅法律事務所整理によれば、「**単なる技術提供 / ホスティング**」で顧客の銀行接続を媒介しない場合は非該当
- **設計指針**: KYA SDK が銀行 API へのリクエストを **保持・転送しない**(顧客側で銀行接続、KYA は attestation のみ提供) → 電子決済等代行業の射程外

#### サブ論点 8: JVCEA / JCBA 自主規制

出典:
- [JVCEA 協会自主規制活動の概要(2025-07-31)](https://www.fsa.go.jp/singi/singi_kinyu/angoshisanseido_wg/gijishidai/20250731/05.pdf)、アクセス 2026-06-01
- [JVCEA 定款・諸規則](https://jvcea.or.jp/about/rule/)、アクセス 2026-06-01
- [JVCEA 適格機関投資家向け暗号資産の販売に関する規則(2025-03-26)](https://jvcea.or.jp/cms/wp-content/themes/jvcea/images/pdf/1011.pdf)、アクセス 2026-06-01

**現状**:
- JVCEA は 2022 以降、AML/CFT、システムリスク管理、利用者保護を 3 本柱に自主規制を継続強化
- **AI Agent による自動取引の自主規制ルールは現時点で存在せず**(検索結果より、推定確度: 高)
- 2025-04-10 金融庁ディスカッションペーパー「暗号資産に関連する制度のあり方等の検証」が議論進行中 → 2027 以降に法令レベル昇格の可能性

**Agent identity への含意**:
- 暗号資産分野は **2027 以降に AI Agent 専用ルールが追加される蓋然性高め**(推定、確度: 中)
- KYA Project にとって **先行優位を取りに行く論点**: JVCEA / JCBA のワーキンググループへの参加を Phase 1 で検討

### 2.4 規制ギャップ分析: KYA Layer の差し込み余地

EU AI Act の構造的ギャップ分析(`eu-ai-act-agent-identity-mandate.md` §3)と同じフレームを日本に適用:

| KYA Layer の機能 | 日本で対応する規制 | ギャップ評価 |
|------------------|---------------------|--------------|
| **Human-Agent binding(DID + delegation chain)** | AI 事業者 GL v1.2 の Human-in-the-Loop / トレーサビリティ | ガイドラインが要請、技術標準なし → **KYA の余地 大** |
| **Capability attestation(VC + ZKP)** | AI 事業者 GL v1.2 の最小権限原則 | ガイドラインが要請、技術標準なし → **KYA の余地 大** |
| **Audit trail(7 年保管)** | 犯収法 6 条(確認記録 7 年)、金融庁監督指針 | 既存規制ベース、AI agent 特化ではない → **KYA の余地 中** |
| **Dispute mediation** | 民事一般、消費者契約法 | AI 専用枠なし → **KYA の余地 中**(契約ベースの差別化) |
| **Cross-border federation** | 個人情報保護法 28 条(越境移転)、犯収法 Travel Rule | 既存規制ベース、agent 特化ではない → **KYA の余地 中** |

**結論**: 日本は **ソフトロー積層で KYA 機能を要請しつつ、技術標準を行政が指定しない** 構造 → KYA Project が **デファクト・スタンダード化** を取りに行ける環境(推定、確度: 中-高)。

---

## 3. KYA Project への戦略的含意

### 3.1 法人設立国としての日本の評価

| 評価軸 | 日本 | EU との比較 |
|--------|------|-------------|
| Agent identity 明示義務 | **なし**(ソフトローのみ) | EU = Article 14/26/50 でグレー要請 → 日本は EU より緩い |
| 罰則の有無 | **なし**(AI 推進法 16 条 = 指導のみ) | EU AI Act = GDPR 並の制裁(売上 7%) → 日本は圧倒的に軽い |
| MTL / 資金移動業負担 | **KYA Layer 単独なら不要** | EU = PSD3 で payment institution / agent ライセンス論点 |
| 暗号資産関連 | JVCEA 自主規制対応、2027 以降に法改正リスク | EU = MiCA で CASP 義務 |
| 顧客との物理的同居 | **PayPay と東京で同居可能** | EU = 顧客との時差 / 言語コスト |
| 投資家アクセス | 日本 VC + 米国 VC の併用可、JCB・楽天・Z Holdings 等 | EU 法人 → 米国 VC が嫌がる |
| 標準化コミュニティへの参加 | 国際標準は別途要参加、国内議論(JVCEA、AI 官民フォーラム)に物理的アクセス可 | EU = 標準化議論の中心(C-ITS、ETSI 等) |
| 税負担 | 法人税 23.2% + 地方税(実効税率 約 30%) | EU は加盟国ごと(アイルランド 12.5%、ハンガリー 9% 等) |

**判定**: **日本は法人設立国として「規制負担の軽さ」「PayPay との同居」で最有力候補**(推定、確度: 高)。ただし税負担と国際投資家アクセスでは UAE / SG に劣る。

### 3.2 PayPay が KYA SDK を利用する時の障壁

**判定**: **PayPay 側の追加届出は原則不要、ただし設計次第で 3 つの分岐**。

| 設計案 | PayPay 側の規制負担 | KYA Project の役割 |
|--------|---------------------|---------------------|
| **案 A: KYA = 内部処理の補助ツール(SDK 組込)** | **追加届出なし**、AI 事業者 GL v1.2 の Human-in-the-Loop 実装支援として位置付け | 純粋なソフトウェアベンダー |
| **案 B: KYA = 業務委託先(犯収法 32 条委託)** | **業務委託届出**(関東財務局)、再委託管理、SLA、監査権付与 | 業務委託先として PayPay の検査対象 |
| **案 C: KYA = 独立した特定事業者** | **PayPay 側は変わらず、KYA Project が資金移動業 / 暗号資産交換業の登録要否を独自に判定** | 独立した登録事業者 |

**Path C 戦略との整合性**:
- 案 A が最も望ましい(KYA Project 側の登録不要 + PayPay 側の管理コスト最小)
- 案 B は「PayPay の検査ポイントに KYA が直接組み込まれる」= 売り込みやすいが、再委託管理コストが他顧客に拡張する時のスケール阻害要因
- **Phase 1 で弁護士確認必須**: SDK ライセンス契約の文言で「業務委託」と認定されない設計(SLA は最小限、KYA は判定結果を返さず attestation packaging のみ提供)

### 3.3 EU / US との比較で日本側の特殊性

| 特殊性 | 含意 |
|--------|------|
| **罰則なしソフトロー文化** | エンフォースメントが行政指導 → コンプライアンス義務が「経営判断」に委ねられる、規制 attestation の「金融機関の自発的調達」依存 |
| **行政指導文化** | 監督指針の「グッドプラクティス」が事実上義務化される構造 → KYA が監督指針に取り入れられれば一気に標準化 |
| **為銀主義(銀行法 4 条 1 項)** | AI Agent が為替の主体になり得るかが未整理 → 「Agent は技術的媒介、為替主体は wallet 提供者」設計を維持しないと銀行業免許論点 |
| **マイナンバーカード(JPKI)一本化方針(2027-04 施行予定)** | 国家発行の electronic identity を犯収法上の唯一の確認手段とする方向 → KYA の DID 戦略は JPKI 統合が前提化 |
| **JVCEA / JCBA 自主規制** | 暗号資産分野は法令でなく自主規制に詳細義務が集約 → KYA は JVCEA ワーキンググループ参加が標準化への近道 |
| **金融庁の AIDP 1.1 アジャイル・ガバナンス姿勢** | 「ギャップが顕在化したら法令対応も排除しない」= 規制リスクの主な発火点が 2027-2028 に集中 |

### 3.4 「現状(2026-06) → 2027 以降」の見通し

**現状(2026-06)**:
- AI 推進法 = 全面施行済み、ただし罰則なし、agent identity 要求なし
- AI 事業者 GL v1.2 = ソフトローで Human-in-the-Loop 要求、KYA 売り込みの足場
- AIDP 1.1 = 金融機関に対して論点整理、検査での参照は始まりつつある
- 資金決済法 / 犯収法 = AI agent 特化条項なし、設計次第で射程外維持可能

**2027 以降の見通し**(推定):

| 時期 | 予想イベント | 確度 | 影響 |
|------|--------------|------|------|
| 2027-04-01 | 改正犯収法施行規則施行(JPKI 一本化) | 高 | KYA の DID 戦略への直接影響、did:jpki 設計の必要性 |
| 2027 中 | 「人工知能関連技術の研究開発及び活用の適正性確保に関する指針」の改訂 | 中-高 | AI 事業者 GL v1.2 を内閣府指針に格上げ、agent identity 言及の可能性 |
| 2027 後半 | 金融庁監督指針改正(AIDP 1.1 のフィードバック反映) | 中 | 業務委託先管理 + agent 経由取引のコンプライアンス要件が明文化 |
| 2027-2028 | 暗号資産制度の法令レベル昇格(金融庁 WG 結果反映) | 中 | JVCEA 自主規制の一部が資金決済法 / FIEA 直接規制化 |
| 2028 | AI 推進法の中間レビュー / 法改正検討開始の可能性 | 低-中 | 罰則導入の議論余地 |

---

## 4. リスク評価

| リスク | 内容 | 確度 | 影響 |
|--------|------|------|------|
| **JPKI 一本化の射程拡大リスク** | 2027-04 施行規則の解釈で「Agent identity 検証も JPKI 必須」と運用されると、国際標準(DID / SD-JWT VC)と衝突 | 中 | 大 |
| **業務委託先扱いリスク** | PayPay 等の顧客から KYA が「業務委託先」と認定され、検査対象に組み込まれる | 中 | 中 |
| **金融庁監督指針改正リスク** | AIDP 1.1 が監督指針に昇格、KYA の機能要件が事実上規制化 — Pro(売れる)/ Con(自由度低下) | 中 | 中(両面) |
| **「適正性確保指針」での技術標準指定リスク** | 内閣府指針で AI agent 識別子の技術標準が日本独自仕様で指定される(例: マイナポータル + JPKI ベース)→ 国際標準との非互換 | 低-中 | 大 |
| **為銀主義の解釈拡張リスク** | AI Agent が為替取引の「主体」と認定されると、Agent 提供者 = 銀行業免許論点に発展 | 低 | 大 |
| **AI 事業者 GL v1.2 違反 = 不法行為認定リスク** | 二次資料の弁護士見解通り「相当の注意義務」水準として参照されれば、KYA SDK 利用が事実上の安全港に | 中 | 中(KYA Pro) |

---

## 5. 「これは法律意見ではない」

このドキュメントは KYA Project の戦略立案のためのリサーチ整理であり、法律意見ではない。実際の法人設立、PayPay 等への SDK 提供、規制対応の最終判断は **日本の弁護士確認必須**。

特に下記は Phase 1 で弁護士確認を要する:
1. **KYA SDK 契約が「業務委託」と認定されない文言設計**(犯収法施行規則 32 条、資金移動業者監督指針 II-3)
2. **資金移動業 / 暗号資産交換業の射程外を維持する技術設計の妥当性**(資金決済法 37 条 / 63 条の 2、銀行法 4 条 1 項)
3. **電子決済等代行業の射程外を維持する技術設計の妥当性**(銀行法 52 条の 61 の 2)
4. **AI 事業者 GL v1.2 への準拠を「証明可能な形で」パッケージ化する妥当性**(消費者保護法、不法行為責任)
5. **JPKI 一本化(2027-04)への KYA Bridge SDK の統合設計**(犯収法施行規則改正、公的個人認証法)
6. **越境データ移転(個情法 28 条)と KYA の cross-border federation の整合性**

弁護士事務所候補(日本):
- **西村あさひ法律事務所**(AI Agents Legal Issues 2026-03 ニュースレター実績)
- **森・濱田松本法律事務所**(AI 事業者ガイドライン解説、AI 法案解説実績)
- **TMI 総合法律事務所**(EU AI 法セミナー、AI エージェントの法的留意点ブログ)
- **アンダーソン・毛利・友常法律事務所**(AI/Data/Digital プラクティス、ステーブルコイン法制実績)
- **長島・大野・常松法律事務所**(金融規制全般)
- **三宅法律事務所**(電子決済等代行業に強い)
- **小島法律事務所**(AI 推進法 JP-EN 参考訳公表、最先端 AI 規制)

---

## 6. 主要二次資料(整理)

| 著者 / 機関 | タイトル / 主題 | 公表日 | URL |
|------------|----------------|--------|-----|
| 西村あさひ | AI Agents: Legal Issues in Implementation and Key Considerations for Companies | 2026-03 | https://www.nishimura.com/en/knowledge/newsletters/robotics_artificial_intelligence_260312 |
| 西村あさひ | AI 新法を読み解く | 2025-04 | https://www.nishimura.com/en/knowledge/newsletters/robotics_artificial_intelligence_250402 |
| 森・濱田松本 | AI 事業者ガイドライン第 1.2 版 | 2026 | https://www.morihamada.com/ja/insights/newsletters/137701 |
| 森・濱田松本 | AI 関連のルールメイキングに関する近時の動向 | 2025-2026 | https://www.morihamada.com/ja/insights/newsletters/113326 |
| TMI 総合 | EU AI 法のルールと実務対応(日米欧中 AI 規制の最新動向含む) | 2026-02 | https://www.tmi.gr.jp/eyes/event/2026/17783.html |
| TMI 総合 | AI エージェントの法的留意点 ブログ | 2025-2026 | https://x.com/tmi_associates/status/1886603165119996397 |
| アンダーソン・毛利・友常 | AI, Data & Digital トレンドニュース | 2025-2026 | https://www.amt-law.com/insights/trending-news/publication_0028457_ja_001/ |
| アンダーソン・毛利・友常 | ステーブルコイン法制(政令・内閣府令案) | 2023-03-27 | https://www.amt-law.com/asset/pdf/bulletins2_pdf/230327.pdf |
| 小島法律事務所 | Japan "AI Promotion Act" JP-EN Reference Translation | 2025-09 | https://www.kojimalaw.jp/wp/wp-content/uploads/2025/09/Japan-AI-Promotion-Act-KOJIMA-LAW-OFFICES-jp-en-reference-translation.pdf |
| 三宅法律事務所 | 電子決済等代行業に該当しない行為について | — | https://www.miyake.gr.jp/notice/【オープンapi】電子決済等代行業に該当しない行為について/ |
| 骨董通り法律事務所 | 概説 AI 法 - 小山紘一 | 2025-09-24 | https://www.kottolaw.com/column/240924.html |
| トップコート国際 | 2025 年 9 月 AI 新法全面施行 | 2025-2026 | https://topcourt-law.com/ai-iot/new-ai-law-2025 |
| PwC Japan | 金融庁 AIDP 1.1 版の概要と内部監査への示唆 | 2026 | https://www.pwc.com/jp/ja/knowledge/column/ai-governance/ai-discussion-paper.html |
| 大和総研 | 金融ビジネス・金融 IT(AI ガバナンス関連) | 2026-04-15 | https://www.dir.co.jp/report/research/capital-mkt/it/20260415_025698.pdf |
| EY Japan | 2026 年度グローバル金融サービス規制の展望 | 2026 | https://www.ey.com/ja_jp/insights/financial-services/four-regulatory-shifts-financial-firms-must-watch-in-2026 |
| EY Japan | ステーブルコイン法規制の概要とポイント | — | https://www.ey.com/ja_jp/insights/financial-services/outline-and-points-of-laws-and-regulations-related-to-stablecoins |
| ABeam Consulting | ステーブルコインの可能性 — 改正資金決済法 | — | https://www.abeam.com/jp/ja/insights/stablecoin_potential/ |
| Deloitte Japan | 日本の AI 関連の法律、規制、ガイドライン | — | https://www.deloitte.com/jp/ja/services/audit-assurance/blogs/ai-governance-07.html |
| ailead Blog | AI 事業者ガイドライン v1.2 完全解説 | 2026 | https://www.ailead.app/blog/ai-governance-guideline-v12-agent-regulation-2026 |
| Fintech 協会 | AI エージェントが変革する金融・E コマース | 2026 | https://fintechjapan.org/japan-fintech-week-2026/jfwroundtable/session3/ |
| OpenID ファウンデーション・ジャパン | Identity Management for Agentic AI v1.1 | 2026 | https://www.openid.or.jp/Identity-Management-for-Agentic-AI-jp_v1.1.pdf |

---

## 7. 当局者発言 / 公式文書(一次資料)

| 機関 | 文書 | 公表日 | URL | 重要度 |
|------|------|--------|-----|--------|
| 内閣府 | AI 法全面施行 — 次なるフェーズへ | 2025-10-03 | https://www.cao.go.jp/press/new_wave/20251003.html | 高 |
| 内閣府 | 適正性確保に関する指針(案) | 2025 | https://www.kantei.go.jp/jp/singi/titeki2/ai_kentoukai/gijisidai/dai10/sanko1-4.pdf | 高 |
| 内閣府 | 適正性確保に関する指針骨子 | 2025 | https://www8.cao.go.jp/cstp/ai/ai_guideline/ai_gl_2025_draft.pdf | 高 |
| 内閣府 | AI 法案紹介 | 2025 | https://www8.cao.go.jp/cstp/ai/ai_act/ai_act.html | 高 |
| 衆議院 | AI 法案 法案本文 | 2025 | https://www.shugiin.go.jp/internet/itdb_gian.nsf/html/gian/honbun/houan/g21709029.htm | 高 |
| 経産省 + 総務省 | AI 事業者ガイドライン v1.2 PDF | 2026-03-31 | https://www.meti.go.jp/shingikai/mono_info_service/ai_shakai_jisso/pdf/20260331_1.pdf | **最高** |
| 経産省 + 総務省 | AI 事業者ガイドライン告知 | 2026-03-31 | https://www.meti.go.jp/shingikai/mono_info_service/ai_shakai_jisso/20260331_report.html | 高 |
| 金融庁 | AIDP 1.1 PDF | 2026-03 | https://www.fsa.go.jp/news/r7/sonota/20260303/aidp_version1.1.pdf | **最高** |
| 金融庁 | AIDP 1.1 告知 | 2026-03-03 | https://www.fsa.go.jp/news/r7/sonota/20260303/aidp.html | 高 |
| 金融庁 | AIDP 1.0(初版) | 2025-03 | https://www.fsa.go.jp/news/r6/sonota/20250304/aidp.pdf | 中 |
| 金融庁 | AI 官民フォーラム(第 1 回)事務局説明資料 | 2025-06-18 | https://www.fsa.go.jp/singi/ai_forum/siryou/20250618/01.pdf | 中 |
| 金融庁 | AI 官民フォーラム(第 3 回)議事要旨 | 2025-11-12 | https://www.fsa.go.jp/singi/ai_forum/gijiyoshi/20251112.html | 中 |
| 金融庁 | マネー・ローンダリング等及び金融犯罪対策の取組と課題 | 2025-06-27 | https://www.fsa.go.jp/news/r6/20250627/01.pdf | 高 |
| 金融庁 | FATF トラベル・ルール ベスト・プラクティス公表 | 2025-06-27 | https://www.fsa.go.jp/inter/fatf/2025062702/2025062702.html | 高 |
| 金融庁 | 暗号資産制度 WG 説明資料(2025-09-29) | 2025-09-29 | https://www.fsa.go.jp/singi/singi_kinyu/angoshisanseido_wg/gijishidai/20250929/04.pdf | 中 |
| 金融庁 | 暗号資産制度 WG 説明資料(2025-10-22) | 2025-10-22 | https://www.fsa.go.jp/singi/singi_kinyu/angoshisanseido_wg/gijishidai/20251022/04.pdf | 中 |
| 金融庁 | 暗号資産 DP「暗号資産に関連する制度のあり方等の検証」 | 2025-04-10 | https://www.fsa.go.jp/news/r6/sonota/20250410_2/01.pdf | 高 |
| 金融庁 | 資金移動業者監督指針 | — | https://www.fsa.go.jp/common/law/guide/kaisya/14.pdf | 高 |
| eGov | AI 推進法本文 | 2025 | https://laws.e-gov.go.jp/law/507AC0000000053 | **最高** |
| eGov | 資金決済法 | — | https://laws.e-gov.go.jp/law/421AC0000000059 | **最高** |
| eGov | 銀行法 | — | https://laws.e-gov.go.jp/law/356AC0000000059 | **最高** |
| eGov | 資金移動業者に関する内閣府令 | — | https://laws.e-gov.go.jp/law/422M60000002004 | 高 |
| 日銀リサーチラボ | 銀行業と「為替取引」: 銀行規制の適用範囲のあり方 | — | https://www.boj.or.jp/research/wps_rev/lab/lab16j05.htm | 高 |
| 関東財務局 | 資金移動業関係 | 2025-05-16 | https://lfb.mof.go.jp/kantou/kinyuu/pagekt_cnt_20250516001sikinidou.html | 中 |
| 個人情報保護委員会 | 3 年ごと見直し記者配布資料 | 2025 | https://www.ppc.go.jp/files/pdf/01-4_kisyahaifusiryou2.pdf | 中 |
| 個人情報保護委員会 | 仮名加工情報・匿名加工情報ガイドライン | — | https://www.ppc.go.jp/personalinfo/legal/guidelines_anonymous/ | 中 |
| JVCEA | 自主規制活動概要 | 2025-07-31 | https://www.fsa.go.jp/singi/singi_kinyu/angoshisanseido_wg/gijishidai/20250731/05.pdf | 中 |
| JVCEA | 定款・諸規則 | — | https://jvcea.or.jp/about/rule/ | 中 |
| PayPay | PayPay マネー 資金決済法に基づく表示 | — | https://about.paypay.ne.jp/terms/consumer/legal/money/ | 中 |
| PayPay | AI サービス利用規約 | — | https://about.paypay.ne.jp/terms/consumer/rule/ai/ | 高 |

---

## 8. decision-doc.md 反映候補

### §1(法人設立国)

W2 暫定方向性「**EU 域外スタート + EUDI Wallet 統合フェーズで EU 子会社検討**」を **W3 で日本側エビデンスで強化**:

- **日本は「規制負担最軽量 + PayPay 同居 + 標準化議論参加可能」で最有力候補**(KYA Layer 単独なら資金移動業 / 暗号資産交換業ともに登録不要、AI 推進法は罰則なし)
- **税負担と国際投資家アクセスを勘案して SG / UAE と比較継続**
- **2027-04 JPKI 一本化(改正犯収法施行規則)対応設計が日本法人成立後の主要な技術タスク**

### §2(ビジネスモデル)

- 「**規制 attestation packaging**」モジュールに **日本向け = AI 事業者 GL v1.2 + AIDP 1.1 + 犯収法 + JPKI 統合** を明示的に追加
- ソフトロー文化 = 顧客の自発的調達依存 → **SDK ライセンス価格は EU 顧客より 30-50% 低めの設定を初期想定**(推定、確度: 中)

### §5(PayPay との関係)

- **Path C(Hybrid)の前提条件確認**: PayPay 側に追加届出は原則不要(SDK 内部処理ツール位置付け)
- **設計上のレッドライン**: KYA SDK を「業務委託先」と認定されない契約文言、KYA は判定 / 確認業務を直接実行しない設計
- **Phase 1 弁護士確認 must-have リスト** を §5 に追加(本ドキュメント §5 参照)

### §6(リスク・前提条件)に追加候補

- [ ] **JPKI 一本化リスク(NEW W3)**: 2027-04 改正犯収法施行規則で本人確認が JPKI 一本化 → KYA の DID 戦略が国家 ID 統合前提化、国際標準との非互換リスク。確度: 中 / 影響: 大
- [ ] **業務委託先認定リスク(NEW W3)**: PayPay 等の顧客から KYA SDK が「業務委託」と認定されると、再委託管理コストが他顧客にスケールしない。確度: 中 / 影響: 中
- [ ] **金融庁監督指針 AIDP 昇格リスク / 機会(NEW W3)**: AIDP 1.1 のフィードバックが監督指針改正に反映されると、KYA 機能要件が事実上の検査ポイント化 → Pro(売れる)/ Con(自由度低下)の両面。確度: 中 / 影響: 中

### §7(Phase 1 ゲート判断)に追加

- [ ] 日本側弁護士事務所 1 社確保(西村あさひ / 森濱田 / TMI / AMT のいずれか)
- [ ] PayPay との SDK ライセンス契約のレッドライン文言ドラフト
- [ ] JPKI 統合の技術設計案(did:jpki(仮称)または JPKI VC issuer 設計)

---

## 9. クロスリファレンス

- `tracks/B-regulations/eu-ai-act-agent-identity-mandate.md`(W2 EU 単独深掘り、本ドキュメントのフォーマット元)
- `tracks/B-regulations/us-ai-act-agent-identity-mandate.md`(未着手、W4 候補)
- `tracks/A-competitors/kya-layer-density-survey-2026-w2.md`(W2、競合密度)
- `tracks/A-competitors/aws-kya-absorption-watch-list.md`(W2、AWS 後出しリスク監視)
- `tracks/C-tech-trends/domains/erc-8004-agentcore-glue.md`(W2、ERC-8004 連携)
- `synthesis/decision-doc.md` §1 / §2 / §5 / §6 / §7

## 10. 関連サブ論点(本ドキュメント派生で `README.md` 追加提案)

- [ ] `jp-jpki-did-integration-roadmap.md` — 2027-04 改正犯収法施行規則(JPKI 一本化)と KYA DID 戦略の統合ロードマップ
- [ ] `jp-payment-agent-license-mapping.md` — AI Agent が支払い transaction を発火する時の各登録業(資金移動業 / 暗号資産交換業 / 電子決済等代行業 / 銀行業)の判定フレーム
- [ ] `jp-jvcea-agent-trading-self-regulation-watch.md` — JVCEA / JCBA の AI Agent 自動取引自主規制ルール進行監視
