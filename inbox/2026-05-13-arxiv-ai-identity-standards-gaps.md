---
type: paper
source: arXiv cs.CR / cs.AI
url: https://arxiv.org/abs/2604.23280
date_published: 2026-04-28
fetched: 2026-05-13
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/papers/2026-04-ai-identity-standards-gaps.md
---

# "AI Identity: Standards, Gaps, and Implementation" (arXiv 2604.23280)

## 要約（3-5 文）
2026-04-28 投稿の arXiv 論文。AI エージェント向け DID（W3C 準拠）＋ Zero-Knowledge Proof による選択的開示の組み合わせを提案する。ZKP によりエージェントは verifier が要求する属性だけを提示でき、クロスコンテキストでの相関を防止する。Zero-Trust Identity Framework ではモデルパラメータ・ソフトウェアバージョンをハッシュ化して DID ドキュメントに埋め込み、鍵ペアだけでなく特定モデルインスタンスに資格情報を束縛する。

## なぜ KYA に関係あるか
KYA のコア問題（エージェント同一性の証明、モデルバージョンへの束縛、プライバシー保護）に直接対応する論文。「モデルパラメータを DID に埋め込む」というアーキテクチャは KYA 実装の技術選択肢として最重要候補。Track C の基幹文献になる。

## 推奨アクション
- [ ] Track C: `paper-summarizer-with-impact-rating` スキルで詳細要約・影響度評価を実施
- [ ] Track A: 競合他社（Trulioo・Sumsub）の KYA 実装との比較軸を検討
