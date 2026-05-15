---
type: paper
source: arXiv
url: https://arxiv.org/html/2505.19301v1
date_published: 2026-05
fetched: 2026-05-15
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/papers/2505.19301-zero-trust-identity-agentic.md
---

# arXiv 2505.19301 — "A Novel Zero-Trust Identity Framework for Agentic AI: Decentralized Authentication and Fine-Grained Access Control"

## 要約
エージェントAI向けゼロトラスト・アイデンティティフレームワークを提案（May 2026）。モデルパラメータとソフトウェアバージョンを DID ドキュメントにハッシュとして埋め込み、モデル改変時に ID が無効化される仕組みを実装。ZKP により選択的開示とポリシー準拠証明をプライバシーを保ちつつ実現。きめ細かなアクセス制御とアテステーションを統合。

## なぜ KYA に関係あるか
「エージェントのモデルバージョンを ID に紐付ける」設計はKYAの根幹的要件に対応。モデルアップデート時の再認証フローやノンカストディ実装の鍵管理と組み合わせる際の参照実装として価値が高い。

## 推奨アクション
- [x] Track C に統合（ZKP/DID セクション）
- [ ] subagent に技術的実現可能性・PQC 耐性の詳細評価依頼
- [ ] watch list に追加して様子見
