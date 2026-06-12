---
type: paper
source: IETF Datatracker
url: https://datatracker.ietf.org/doc/draft-ni-wimse-ai-agent-identity/
date_published: 2026-06-01
fetched: 2026-06-12
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/ietf-standards-watch.md
---

# IETF draft-ni-wimse-ai-agent-identity-02: WIMSE の AI エージェント適用

## 要約
IETF WIMSE WG が AI エージェントへの適用を定義する -02 版ドラフトを公開（有効期限 2026-09-01）。AIエージェントが人間・デバイスとは独立した独自のアイデンティティと認証情報を持つべきとする原則を定め、エージェントとオーナーの識別子・公開鍵を暗号的に束ねる「Dual-Identity Credential」を導入。OAuth 2.0 互換の委任フローへの接続も規定している。

## なぜ KYA に関係あるか
WIMSE(Workload Identity in Multi-System Environments)は既存クラウドインフラ(AWS/GCP/Azure)が採用するワークロードID標準であり、AI エージェントへの拡張は KYA の実装基盤になり得る。Track C 技術スタックのコア規格として優先度 high でマッピングが必要。Track B の規制論点(エージェント証明書の発行主体)にも接続する。

## 推奨アクション
- [ ] Track C IETF standards-watch ページに追記
- [ ] tech-trend-watcher subagent に詳細分析依頼（Dual-Identity Credential の実装影響）
