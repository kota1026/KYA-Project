# Track B — 規制・コンプライアンスの「抜け道」マッピング

## 仮説

ノンカストディWallet型の自己責任ニュアンスで潜るのが正しい。

**根拠**:
1. 規制は最低5年遅れる(仮想通貨が15年かかった)
2. ノンカストディアル Wallet(MetaMask等)、Self-Sovereign Identity 製品で構造実証済み
3. 責任は「ソフトウェアを使う側」が負う構造で、KYAは「インフラ提供者」として登録不要を狙う

## 構造

```
B-regulations/
├── <topic-slug>.md             # 論点ごとに法域横断比較(regulation-comparator Skill)
└── regulator-statements/        # 当局者発言ログ(将来規制の予兆)
    └── <source-slug>.md
```

## 法域

- US(MTL/BSA/FinCEN)
- EU(PSD3/MiCA/AMLR)
- Japan(資金決済法/FIEA/犯収法/為銀主義)
- UK(FCA Sandbox)
- Singapore(MAS Payment Services Act)
- UAE(VARA / DFSA / ADGM)

## 主要論点(順次作成)

- [x] `eu-ai-act-agent-identity-mandate.md` — EU AI Act が Agent Identity / KYA を規制必須化するか(W2、EU 単独深堀り)
- [ ] `non-custodial-wallet-developer-status.md` — ノンカストディWallet開発者の規制エンティティ性
- [ ] `tornado-cash-implications.md` — Tornado Cash判例(Roman Storm)後の解釈
- [ ] `agent-payments-responsibility-allocation.md` — Agent Payments の責任分界点
- [ ] `kya-kyb-agent-integration.md` — 既存 KYC/KYB と Agent identity の統合義務
- [ ] `dispute-resolution-and-chargeback.md` — Agent 誤発注時の責任主体
- [ ] `agent-payments-license-mapping.md` — 各法域での必要ライセンス
- [ ] `data-protection-and-zk-proof.md` — GDPR / 個人情報保護法と ZK proof
- [ ] `cross-border-payment-flow.md` — 国際送金規制との関係
- [x] `eidas-2-eudi-wallet-agent-delegation.md` — eIDAS 2.0 + EUDI Wallet ARF + EBW の agent delegation ロードマップ(W3、EU 単独深堀り、**EBW = COM(2025) 838 final 発見**で W2 仮説を 12-24 ヶ月に拡大)
- [ ] `eu-business-wallet-implementing-acts-watch.md` — EBW(COM 2025/838)Implementing Acts プロセス監視(2027-Q1〜 stakeholder consultation、agentic AI Recital 28 委任の追跡、本稿派生)
- [ ] `we-build-consortium-engagement.md` — WE BUILD non-paper(2026-03)精読 + メンバー連携経路(本稿派生、Track A クロスリファレンス候補)
- [ ] `eidas-qtsp-vs-non-qualified-eaa-decision.md` — QTSP 認定 vs non-qualified EAA Provider の事業選択深堀り(本稿派生、Phase 2 判断材料)
- [ ] `amlr-2027-casp-agent-cdd.md` — AMLR 2027 で CASP が agent 経由 transaction の CDD を満たす技術要件(同上派生)
- [x] `us-ai-act-agent-identity-mandate.md` — US 側の同論点(W3、連邦 NIST/FTC/FinCEN/SEC/OCC-Fed-FDIC/CFPB + 州 CO/CA/TX/NY/NYC 二層構造、Trump EO 2025-12 + FTC AI Policy Statement 2026-03 + Tornado Cash 判決を統合)
- [x] `jp-ai-promotion-act-agent-identity.md` — 日本 AI 推進法 + 金融庁 AIDP 1.1 + 資金決済法 + 犯収法 の agent 扱い(W3、JP 単独深掘り)
- [ ] `jp-jpki-did-integration-roadmap.md` — 2027-04 改正犯収法施行規則(JPKI 一本化)と KYA DID 戦略の統合ロードマップ(W3 派生)
- [ ] `jp-payment-agent-license-mapping.md` — AI Agent 支払い発火時の登録業(資金移動業 / 暗号資産交換業 / 電子決済等代行業 / 銀行業)判定フレーム(W3 派生)
- [ ] `jp-jvcea-agent-trading-self-regulation-watch.md` — JVCEA / JCBA の AI Agent 自動取引自主規制ルール進行監視(W3 派生)
- [ ] `nist-ai-agent-io-profile-watch.md` — NIST AI Agent Standards Initiative(2026-02-17 launch、Q4 2026 v1 release)の追跡(`us-ai-act-agent-identity-mandate.md` §2.2 サブ論点 1 から派生、KYA SDK の reference implementation 戦略の核)
- [ ] `us-tornado-cash-retrial-watch.md` — 2026-10 開始予定 Roman Storm retrial 追跡 + KYA SDK 刑事リスク評価更新(`us-ai-act-agent-identity-mandate.md` §4.2 から派生)
- [ ] `us-genius-act-stablecoin-issuer-kya-bridge.md` — GENIUS Act 施行(2027-01-18 or 規則 +120 日)で stablecoin issuer が agent 経由 transaction の BSA / KYC を満たす技術要件(`us-ai-act-agent-identity-mandate.md` §2.2 サブ論点 4 から派生)
- [ ] `web-bot-auth-rfc-9421-agent-identity.md` — Cloudflare Web Bot Auth + IETF RFC 9421 HTTP Message Signatures + AWS Bedrock AgentCore integration を KYA SDK と統合する技術仕様検討(`us-ai-act-agent-identity-mandate.md` §5.4 + `tracks/C-tech-trends/` クロスリファレンス)

## 進め方

1. **W1-W2**: 主要論点 5-8 件確定、各論点で対象法域を選定
2. **W3-W4**: US + EU 一次資料を `regulation-comparator` で整理
3. **W5-W6**: JP + UK + SG + UAE
4. **W7-W8**: 「抜け道」の総合分析、リスク評価
5. **W9-W10**: 弁護士確認用ドラフト(Phase 1 で実際に法律事務所に渡せる粒度)
6. **W11**: 法域別最終マップ、法人設立国の判断材料を decision-doc.md に反映

## 重要な注意

- **これは法律意見ではない**。リサーチドキュメント。
- 一次資料(条文・ガイダンス)を必ず引用、該当パラグラフ番号まで
- 弁護士の意見と当局見解を区別
- 「現状」と「2027年以降の見通し」を分けて書く

## クロスリファレンス

- 各社の規制スタンスは `tracks/A-competitors/<company>.md` の (c) と整合
- ノンカストディ採用は `tracks/D-business-models/` のモデル選択を制約(Hosted Backend だとデータ預かり責任発生)
