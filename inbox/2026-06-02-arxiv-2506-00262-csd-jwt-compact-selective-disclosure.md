---
type: paper
source: arXiv cs.CR
url: https://arxiv.org/abs/2506.00262
date_published: 2026-06-02
fetched: 2026-06-06
relevance: medium
suggested_track: C
suggested_destination: tracks/C-tech-trends/papers/2506.00262-csd-jwt-selective-disclosure.md
---

# arXiv:2506.00262 — CSD-JWT: Compact and Selective Disclosure for Verifiable Credentials

## 要約（3-5文）
暗号アキュムレータを用いてVerifiable Credentials（VCs）のクレームをコンパクトな一意表現にエンコードする CSD-JWT メカニズムを提案。SD-JWT と比べてメモリ使用量を最大46%削減し、Verifiable Presentation サイズを27〜93%縮小することを実証。Self-Sovereign Identity（SSI）を背景に、EU Digital Identity Wallet など実装例が2026年に本格化する中でのタイムリーな提案。ACSAC 2025（Annual Computer Security Applications Conference）に採択済み。

## なぜ KYA に関係あるか
KYA の実装において、エージェントが必要最小限の属性のみを提示する「Selective Disclosure」は中核機能。本論文の CSD-JWT は既存 SD-JWT の改良版であり、ハードウェアウォレット等の resource-constrained デバイスへの適用にも言及。Track C の ZK/VC 動向および Track B の EUDI Wallet 規制実装の両方に参照できる。

## 推奨アクション
- [ ] Track C 論文サマリーとして impact rating 付きで統合（paper-summarizer-with-impact-rating skill を使用）
- [ ] SD-JWT / BBS+ / CSD-JWT の比較節を Track C に追記
- [ ] Track B EUDI Wallet 節への参照リンクを追加
