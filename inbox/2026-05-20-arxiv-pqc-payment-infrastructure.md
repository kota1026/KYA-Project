---
type: paper
source: arXiv
url: https://arxiv.org/abs/2605.02276v1
date_published: 2026-05
fetched: 2026-05-20
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/papers/2605.02276-pqc-payment-infra.md
---

# [arXiv 2605.02276] PQC Migration in Australian Real-Time Payment Infrastructure

## 要約
Australian NPP（New Payments Platform）を対象に NIST FIPS 204/205 署名スキーム（ML-DSA・SLH-DSA・Falcon）のパフォーマンスを Monte Carlo シミュレーション（1,000 日×8,000 万イベント）で検証。ML-DSA と Falcon は全構成で SLA 100% 達成、最悪 p99 オーバーヘッドは 1.57 ms（ML-DSA-87）と低水準。SPHINCS+ のみ高負荷時に SLA 超過。CDI（Crypto Dilution Index）という新評価指標を提案。

## なぜ KYA に関係あるか
KYA が発行する agent identity credential に PQC 署名が必要になる将来に備えた技術根拠。ML-DSA/Falcon が高頻度決済でも実用的と示された点は KYA credential の実装設計に直結。Track C の PQC migration 節に追加。

## 推奨アクション
- [x] Track C に統合
- [ ] tech-trend-watcher subagent で深堀り（Falcon vs ML-DSA 選定基準）
