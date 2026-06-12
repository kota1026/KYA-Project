---
type: paper
source: IETF Datatracker
url: https://datatracker.ietf.org/doc/draft-drake-agent-identity-registry/
date_published: 2026-04-11
fetched: 2026-06-12
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/ietf-standards-watch.md
---

# IETF draft-drake-agent-identity-registry-00: ハードウェア固定型エージェント ID レジストリ

## 要約
C. Drake(2026-04-11 提出)が提案する Standards Track ドラフト。自律エンティティ(AI エージェント・ロボット等)に対し、TPM 2.0/PIV/セキュアエンクレーブに物理アンカーされた永続 ID を URN "aid:" 名前空間で発行するフェデレーテッドレジストリ構造を定義。TPM の Endorsement Key を起点に証明書チェーンを検証し、Sybil 攻撃を防ぐ設計。有効期限 2026-10-13。

## なぜ KYA に関係あるか
KYA の根本課題「エージェントの成りすまし防止」に対する最もハードな解答。ハードウェアルートオブトラストを使った Agent ID は、ノンカストディ型ウォレットの署名鍵管理とも直結する。Track C 技術評価の「Hardware vs. Software root of trust」比較軸として必須。Track B 規制側がこのドラフトを参照する可能性も高い。

## 推奨アクション
- [ ] Track C に追記(Hardware Attestation 節を新設検討)
- [ ] tech-trend-watcher subagent に PTV draft との比較依頼
