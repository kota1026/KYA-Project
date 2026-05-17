---
type: paper
source: arXiv (cs.CR)
url: https://arxiv.org/abs/2605.14932
date_published: 2026-05-14
fetched: 2026-05-17
relevance: medium
suggested_track: C
suggested_destination: tracks/C-tech-trends/agent-security-architecture.md
---

# arXiv 2605.14932 — "Toward Securing AI Agents Like Operating Systems"

## 要約
Pirch・Horlboge 他（TU Berlin, 2026-05-14）。LLM ベースエージェントのセキュリティ課題は OS と構造的に同型（リソース隔離・権限分離・通信仲介）であるとする論文。オープンソースエージェント群の調査から統一アーキテクチャを導出し、攻撃ベクタを体系的に整理。ブロードなツール使用・サードパーティスキル統合がエントリポイントになると指摘。

## なぜ KYA に関係あるか
OS セキュリティモデルの転用は、KYA における権限委任モデル（どのエージェントがどのスコープで動作するか）の設計に理論的根拠を与える。Track C の agent security architecture セクションに追加。

## 推奨アクション
- [x] そのまま track に統合
- [ ] subagent に詳細リサーチ依頼
- [ ] watch list に追加して様子見
