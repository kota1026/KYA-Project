---
type: paper
source: IACR ePrint
url: https://eprint.iacr.org/2026/959
date_published: 2026-05-28
fetched: 2026-05-31
relevance: medium
suggested_track: C
suggested_destination: tracks/C-tech-trends/PQC/
---

# IACR ePrint 2026/959：金融インフラにおける PQC TLS の自動構成プロファイリングと展開

## 要約（3-5 文）
銀行の TLS エンドポイント全体（Web サーバー・API ゲートウェイ・ロードバランサー・リバースプロキシ）に PQC ハイブリッド鍵交換（X25519-ML-KEM-768 等）を展開するための構成解析フレームワークを提案。ボトルネックは「アルゴリズムではなく運用面」と診断し、ベンダー固有設定ファイルの解析・継承セマンティクス解決・正規化出力生成を自動化するツールを提供。主要 Web サーバー技術（nginx・Apache 等）に対応した反復可能な PQC 有効化手法を示す。(推定) 日付は IACR ePrint 2026 シリーズ番号から推定。

## なぜ KYA に関係あるか
AI エージェントが TLS で通信する際の量子安全性は中長期的に必須。KYA 通信インフラの PQC 対応設計判断の実用的参考資料。金融セクター固有の運用上のボトルネックを具体的に指摘している点でアプローチの実現性評価に有用。Track C PQC 移行セクションに追加。

## 推奨アクション
- [ ] Track C の PQC セクションに統合
- [ ] 原文確認で正確な publication date を確認のこと（推定: 2026-05）
