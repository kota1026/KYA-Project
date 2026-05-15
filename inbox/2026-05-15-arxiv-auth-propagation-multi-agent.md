---
type: paper
source: arXiv
url: https://arxiv.org/html/2605.05440v1
date_published: 2026-05
fetched: 2026-05-15
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/papers/2605.05440-auth-propagation-multi-agent.md
---

# arXiv 2605.05440 — "Authorization Propagation in Multi-Agent AI Systems: Identity Governance as Infrastructure"

## 要約
マルチエージェントシステムにおける認可伝播の課題を体系化した論文（May 2026）。OIDC-A（OpenID Connect for Agents 1.0）を提案し、エージェント識別子・委任チェーン検証・アテステーション・ケイパビリティベース認可を OIDC 拡張として定義。エージェントが別エージェントを委任する際の信頼チェーン維持と最小権限原則の実装パターンを議論。

## なぜ KYA に関係あるか
KYA の核心「誰が何を委任したか」の技術的実装として OIDC-A は重要な参照アーキテクチャ。非中央集権型 DID との補完関係、ノンカストディ型ウォレットの認可モデル設計に直接活用可能。

## 推奨アクション
- [x] Track C に統合（DID/Auth セクション）
- [ ] subagent に OIDC-A 仕様の詳細技術評価依頼
- [ ] watch list に追加して様子見
