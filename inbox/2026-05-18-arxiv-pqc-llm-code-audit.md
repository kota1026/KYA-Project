---
type: paper
source: arXiv cs.CR
url: https://arxiv.org/abs/2604.00560
date_published: 2026-04-01
fetched: 2026-05-18
relevance: medium
suggested_track: C
suggested_destination: tracks/C-tech-trends/pqc-migration-tooling.md
---

# [arXiv 2604.00560] LLM 支援による静的解析と量子リスクスコアリングを用いた PQC 移行コード監査

## 要約（3-5 文）
NIST が 2024 年に FIPS 203（ML-KEM）・FIPS 204（ML-DSA）・FIPS 205（SLH-DSA）を標準化したにもかかわらず、既存コードベースのクラシック暗号使用状況を自動インベントリし量子リスクで優先度付けするツールが不足していると指摘する論文（2026-04 提出）。LLM 支援の静的解析と量子リスクスコアリングを組み合わせ、暗号利用パターン検出と依存関係グラフから移行コストを定量評価するフレームワークを提案する。

## なぜ KYA に関係あるか
KYA の認証インフラは中長期的に PQC への移行が必要。LLM 支援移行ツールは実装コストを大幅に下げる可能性があり、Track C のロードマップ評価に有用。NIST 2035 年廃止予定に向けた移行計画の具体化に直結する。

## 推奨アクション
- [ ] そのまま track に統合
- [ ] subagent に詳細リサーチ依頼（tech-trend-watcher: PQC migration tooling）
- [ ] watch list に追加して様子見
