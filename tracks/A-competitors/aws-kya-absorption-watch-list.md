---
topic: AWS KYA absorption early warning signals
purpose: AgentCore Payments を出した AWS が KYA レイヤーを自前で吸収するシナリオを早期検知する
last_updated: 2026-05-20
review_cadence: monthly(毎月 1 日)+ re:Invent 開催月は週次
owner: kota
---

# AWS KYA Absorption Early Warning Watch List

## 監視の目的

AWS は 2026-05-07 に Bedrock AgentCore Payments(L2 Payment Rails)を Preview launch した。
**L3 の KYA Layer を AWS が自前で吸収するシナリオ** は、KYA Project にとって最大級のリスク。
このリスクを **早期検知して対応する時間を確保する** ための監視ルーティンを定義する。

リスク評価の文脈: `synthesis/decision-doc.md` §6、`tracks/A-competitors/aws-bedrock-agentcore-payments.md`「警戒すべき動き」セクション。

## 監視シグナル(優先度順)

### Tier 1: 直接シグナル(発見即 decision-doc 反映、戦略再評価トリガー)

#### 1.1 re:Invent 2026 関連
- **CFP / 採択セッション** — タイトル/abstract に "Agent Identity", "Agent Compliance", "Know Your Agent", "Agentic Commerce Trust", "AgentCore Identity Federation", "AgentCore Attestation" 等のキーワードあるか
- **基調講演スピーカー** — Anthropic / Coinbase / Stripe / Privy 以外の identity 系企業(Okta / Auth0 / Ping Identity / SailPoint)が登壇するか
- **新サービス発表** — `AWS AgentCore <X>` 形式の identity / compliance 系発表
- **開催**: 2026 年 12 月初旬(過去パターン: 11 月末-12 月初)
- **採択スケジュール**: 通常 CFP は夏(7-8 月)、採択は秋(9-10 月)、セッション一覧公開は 11 月

確認方法:
- https://reinvent.awsevents.com/ の Session catalog を 11 月から週次チェック
- AWS What's New(https://aws.amazon.com/about-aws/whats-new/)を毎月チェック

#### 1.2 AWS 求人タイトル
監視タイトル例(LinkedIn / amazon.jobs):
- "Principal Engineer, Agent Identity"
- "Senior PM, Agentic Commerce Compliance"
- "Identity Engineer, AgentCore"
- "Trust & Safety, AI Agents"
- "Senior Counsel, Agentic Payments Compliance"

確認方法:
- https://amazon.jobs/en/teams/aws での新規ポスト
- LinkedIn 検索: `Amazon AWS "agent identity" OR "agentic compliance"`(月次)

#### 1.3 USPTO / EPO 特許出願
監視キーワード:
- "agent identity verification"
- "agentic commerce attestation"
- "machine-to-machine payment authorization"
- "autonomous agent delegation"
- "AI agent know-your-agent"

確認方法:
- USPTO Public PAIR / Google Patents で Amazon Technologies Inc. を assignee として月次検索
- 出願公開は出願から 18 ヶ月後 → 今すぐ出願していれば 2027 末以降に見えるため、**間接シグナル**

#### 1.4 AWS が KYA 系スタートアップを買収/出資
監視対象(Track A density survey の結果次第で更新):
- ATXP
- Trulioo
- Persona
- Vouched
- AgentFacts
- Stellagent
- Microblink
- その他 W3 density survey で「製品化済み」と判定されたプレイヤー

確認方法:
- Crunchbase の Amazon Web Services / Amazon.com Inc 投資先(月次)
- TechCrunch / Axios Pro Rata / The Information M&A ニュース
- 該当企業の press release(競合プロファイル更新時に自動的に拾う)

### Tier 2: 間接シグナル(月次レビュー)

#### 2.1 AWS Marketplace
- AgentCore Payments の Marketplace に identity / compliance 系 ISV が増えるか
- AWS 自身が "Compliance Add-on" を出すか

#### 2.2 AWS パートナーネットワーク
- Coinbase / Stripe / Privy 以外に identity 専業パートナーが追加されるか

#### 2.3 AWS Architecture Blog / Big Data Blog
- "Know Your Agent" "Agent Identity verification" の言及が出てくるか

#### 2.4 AWS 公式 docs の更新
- `bedrock-agentcore/latest/devguide/identity*.html` の change log
- `payments-concepts.html` への "human oversight" "delegation chain" "attestation" 用語追加

### Tier 3: コンテキストシグナル(四半期レビュー)

#### 3.1 標準化動向
- ERC-8004(Trustless Agents)に AWS / Amazon の貢献者が現れるか
- IETF SCITT WG / W3C DID WG に AWS 関係者が参加するか
- NIST agent identity 標準化(NIST IR 8546 系)への AWS 寄稿

#### 3.2 AWS 経営層発言
- Werner Vogels / Swami Sivasubramanian / Matt Wood の発言
- re:Invent 2026 / Code with Claude 2026 / AWS Summit 系イベント

## トリガー → アクション

| シグナル | 検知時アクション |
|---------|------------------|
| Tier 1 のどれか発見 | 即 `inbox/YYYY-MM-DD-aws-kya-signal-<slug>.md` 作成 → `tracks/A-competitors/aws-bedrock-agentcore-payments.md` 更新 → `synthesis/decision-doc.md` §6 リスク更新 → コタに **24 時間以内** に通知 |
| Tier 2 のシグナル蓄積(月次で 2 件以上) | `synthesis/weekly/` で論点化、re-positioning の必要性を critic subagent でレビュー |
| Tier 3 のシグナル | 四半期レビューでまとめて評価 |

## 自動化案

- `/loop 7d /aws-watch-scan`(W3 以降に実装) — re:Invent 期間中(11-12 月)は週次、それ以外は月次
- AWS What's New RSS feed の購読 → inbox 自動 drop(Phase 1 で実装)

## 監視を止める条件

以下のいずれかで本ファイルは凍結 → archive:

1. AWS が KYA Layer を自前で出した(=戦略再評価必須)
2. Phase 0 終了時に Path D(drop)を選択した
3. KYA Project が AWS に買収された(冗談、でも一応)

## ソース

- [AWS Blog: Agents that transact(2026-05-07)](https://aws.amazon.com/blogs/machine-learning/agents-that-transact-introducing-amazon-bedrock-agentcore-payments-built-with-coinbase-and-stripe/)
- [AgentCore Payments dev guide](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/payments.html)
- [AgentCore Identity overview](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/identity-overview.html)
- [AWS What's New(全般 RSS)](https://aws.amazon.com/about-aws/whats-new/recent/feed/)
- [re:Invent 公式](https://reinvent.awsevents.com/)
- [Amazon Jobs(AWS)](https://amazon.jobs/en/teams/aws)

## 変更履歴

| 日付 | 変更 |
|------|------|
| 2026-05-20 | 初版作成(W2 着手時、AWS AgentCore Payments launch を受けて) |
