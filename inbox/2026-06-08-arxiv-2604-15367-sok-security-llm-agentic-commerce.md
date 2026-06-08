---
type: paper
source: arXiv cs.CR / cs.AI
url: https://arxiv.org/abs/2604.15367
date_published: 2026-04-15
fetched: 2026-06-08
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/papers/sok-security-llm-agentic-commerce.md
---

# SoK: Security of Autonomous LLM Agents in Agentic Commerce

## 要約（3-5 文）
自律型 LLM エージェントがアgentic commerce で直面するセキュリティリスクを体系化した SoK 論文（arXiv 2604.15367、2026-04 推定）。プロンプトインジェクション・認証バイパス・identity なりすましを主要脅威として分類。エージェントが支払い権限を委任された際の過剰承認（over-authorization）と不正支出のシナリオを詳述。既存の KYC/AML フレームワークがエージェント起点のトランザクションに対応できないギャップを指摘。

## なぜ KYA に関係あるか
KYA がカバーすべき脅威モデルの学術的根拠を提供。特にエージェント identity なりすましと over-authorization は、KYA フレームワークの必要要件として直接引用可能。Track C 基礎文献 + Track B（規制対応要件）両方に有用。

## 推奨アクション
- [ ] そのまま track に統合（tracks/C-tech-trends/papers/）
- [ ] subagent に詳細リサーチ依頼（脅威モデル → KYA 要件定義への落とし込み）
- [ ] watch list に追加して様子見
