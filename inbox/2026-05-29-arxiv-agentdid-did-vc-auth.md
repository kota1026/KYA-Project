---
type: paper
source: arXiv (cs.CR / cs.AI)
url: https://arxiv.org/abs/2604.25189
date_published: 2026-04-28
fetched: 2026-05-29
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/did-vc-agent-identity.md
---

# AgentDID: Trustless Identity Authentication for AI Agents（arXiv 2604.25189）

## 要約（3-5文）
DIDとVerifiable Credentials（VC）をAIエージェントの自律的ID管理に適用したフレームワーク論文。エージェントIDを「出自（Provenance）・ケイパビリティ・コンプライアンス」の3次元で構造化し、チャレンジ・レスポンス機構でインタラクション時の実行状態まで検証可能とする。既存IAMが前提とする「永続的識別子・集中型登録・静的実行環境」はAIエージェントでは成立しないと問題定式化し、オンデマンドな生成・プラットフォーム横断移動・同時大量インタラクションに対応する設計を提示。W3C DID標準との互換を意識した実装検討も含む。

## なぜ KYA に関係あるか
KYAの核心要素「エージェントDID」の実装論文として最重要文献の一つ。3次元ID構造（出自・ケイパビリティ・コンプライアンス）はKYAプロファイルの設計原則に直接転用可能。Track C の DID/VC サブトピックで必読扱いにすべき。

## 推奨アクション
- [ ] Track C tech-trends/did-vc-agent-identity.md に要約統合
- [ ] `/research AgentDID arXiv 2604.25189` で詳細分析
- [ ] 既存 did:trail（2604.23280）との比較マトリクスを作成
