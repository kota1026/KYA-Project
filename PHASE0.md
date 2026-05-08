# Phase 0 — リサーチ・ファースト(8-12週間)

> 「ビジネスの上流要件 → 外部環境 → 方向性 → 方法論」の流れで Agent Payments / KYA の戦略意思決定を行う。
> エンジニアリング先行で失敗するStartupパターンを避ける。

## ゴール

12週間後、以下3つのドキュメントを揃え、Phase 0 終了時点で意思決定する。

1. **競合・先行投資ランドスケープ**(60-90頁、英文、GitHub publishable)
2. **規制・コンプライアンス・マッピング**(主要5法域、責任分界点と「抜け道」の現状)
3. **戦略意思決定文書**(15-20頁、`synthesis/decision-doc.md`)
   - 法人設立国
   - ビジネスモデル(5つのうち1-2つ選択)
   - 技術アーキテクチャの基本方針(ノンカストディ確定の前提で、DID/ZK/PQCをどう束ねるか)
   - 最初の3顧客候補
   - PayPay内R&D化を狙うか、完全独立か、Hybridか

## 大原則

- **12週間で必ず止める**。完璧でなくても意思決定する。
- **Daily scan は自動 / 週次レビューは人間が必ず通す**(Checkpointed運用)
- 出力言語は **日本語ファースト**、ただし Track A の最終 publishable doc は英文

## 4 Track 並走

### Track A: 既存プレイヤーと先行投資の地図化
**仮説**: VISA・PayPal は先行リサーチして既にスタートアップに投資している
**対象**: Skyfire / Payman / Crossmint / Halliday / Catena Labs / Nevermined / Atoma / Coinbase Developer Platform x402チーム周辺 / Google AP2 ecosystem / Shopify Agent Commerce ecosystem / Anthropic Builders Program 関連 など 20-30 社
**カンファレンス**: Money 20/20 USA・Europe / Sibos / Consensus / Stripe Sessions / Code with Claude / Coinbase State of Crypto / BIS Innovation Hub / FATF Plenary / JFSA勉強会
**成果物**: `tracks/A-competitors/` 60-90頁

### Track B: 規制・コンプライアンスの「抜け道」マッピング
**仮説**: ノンカストディWallet型の自己責任ニュアンスで潜るのが正しい(規制は最低5年遅れる)
**法域**: US(MTL/BSA/FinCEN) / EU(PSD3/MiCA/AMLR) / Japan(資金決済法/FIEA/犯収法) / UK(FCA Sandbox) / Singapore(MAS) / UAE(VARA)
**論点**: ノンカストディWallet開発者の地位 / Tornado Cash 判例後の解釈 / Agent Payments固有の責任分界点
**成果物**: `tracks/B-regulations/` 主要5法域

### Track C: 隣接技術の動向と統合可能性
**論点**: KYA と DID と ZK と PQC をどう束ねるか
**領域**: W3C DID v1.1 / ERC-8004 / ERC-7683 / Cheqd / Dock / Spruce ID / Privado ID / Halo2 / Plonky3 / Risc Zero / Succinct SP1 / Aleo / Polygon ID / TLSNotary / zkTLS / NIST FIPS 203/204/205
**コミュニティ**: Identity at the Edge / IIW / ETHGlobal / a16z Crypto School / ZK Summit / FROST WG / IETF SCITT WG
**成果物**: `tracks/C-tech-trends/` + 追うべきキーパーソン3-5名リスト

### Track D: ビジネスモデルの選択肢列挙
**選択肢**:
1. SDK ライセンス(B2B、200-1,000万円/社/年)
2. Hosted Audit/Dispute Backend(SaaS、月100-500万円)
3. Conformance Test / Certification
4. Insurance Layer 代理店
5. Hybrid: OSS コア + 商用エンタープライズ機能
**Phase 0 の最終出力**: 1-2つを選ぶ判断材料
**成果物**: `tracks/D-business-models/`

## 12週スケジュール(目安)

| 週 | Track A | Track B | Track C | Track D |
|----|---------|---------|---------|---------|
| W1-2  | Skill整備、企業 long-list | 法域選定、論点列挙 | 領域 mapping | 5モデル定義 |
| W3-4  | 上位10社プロファイル | US + EU 一次資料 | DID 領域深堀り | モデル別経済性試算 |
| W5-6  | 残り10-20社 + ラウンド整理 | JP + UK + SG + UAE | ZK 領域深堀り(論文10本) | 顧客インタビュー仮説 |
| W7-8  | カンファレンス transcript | 抜け道分析 | PQC migration 戦略 | (進捗統合) |
| W9-10 | 戦略的含意の再編 | 弁護士確認用ドラフト | キーパーソンリスト | 顧客3社特定 |
| W11   | publishable 化 | 法域別最終マップ | 統合論点 | 最終モデル選定 |
| W12   | **意思決定 → `synthesis/decision-doc.md` 確定** | | | |

## 自律運用フロー(Checkpointed)

```
[Daily 自動]
  /daily-scan → inbox/ に新規ニュース・論文・調達ラウンドを drop
        ↓
[Weekly レビュー(人間)]
  /weekly-digest → synthesis/weekly/YYYY-WW.md 生成 → コタが目を通す
        ↓
[必要時(人間トリガー)]
  /research <target>      Track A/C 個別深堀り
  /track-scan <A|B|C|D>   Track 全体スキャン
  /update-decision-doc    意思決定文書の更新
```

## Phase 0 後の分岐

- **Path A**: 独立プロジェクト化(法人設立、SDK実装、シードラウンド)
- **Path B**: PayPay R&D 化(社内上申、本業の一部に)
- **Path C**: Hybrid(個人開発、PayPay にライセンス供与)
- **Path D**: Drop(Phase 0 の結果次第、損失ではない)
