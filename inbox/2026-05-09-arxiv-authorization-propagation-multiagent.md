---
type: paper
source: arXiv
url: https://arxiv.org/abs/2605.05440
date_published: 2026-05-06
fetched: 2026-05-09
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/papers/2605.05440-authorization-propagation.md
---

# arXiv 2605.05440: Authorization Propagation in Multi-Agent AI Systems

## 要約
著者: Krti Tallam（2026-05-06提出）。マルチエージェント環境でエージェントが委任・データ取得・結果合成を行う際、認可不変条件を維持する「Authorization Propagation」問題を形式化。RBAC/ABAC/ReBAC等の古典的アクセス制御モデルでは解けないと主張。3つのサブ問題（Transitive Delegation・Aggregation Inference・Temporal Validity）と、認可アーキテクチャが満たすべき7つの構造要件を導出。

## なぜ KYA に関係あるか
KYAが解くべき「エージェントチェーン内での権限委譲の連鎖検証」問題の理論的基盤を提供。Track C（技術動向）の核心論文候補。7つの構造要件はKYAシステム設計のチェックリストとして直接活用可能。

## 推奨アクション
- [ ] そのまま track に統合（Track C 論文リストへ）
- [ ] tech-trend-watcher で 7 構造要件の詳細要約を依頼
- [ ] decision-doc.md の技術選定セクションに引用
