---
type: paper
source: arXiv cs.CR
url: https://arxiv.org/abs/2603.07974
date_published: 2026-03-01
fetched: 2026-06-11
relevance: medium
suggested_track: C
suggested_destination: tracks/C-tech-trends/papers/zk-ace-pqc-agent-auth.md
---

# [arXiv:2603.07974] ZK-ACE: Identity-Centric Zero-Knowledge Authorization for Post-Quantum Blockchain Systems

## 要約（3-5 文）
ZK-ACE は、ブロックチェーン上のトランザクション認可をトランザクション本体に署名オブジェクトを添付する方式から「アイデンティティに束縛された ZK ステートメント」に置き換えるフレームワーク。署名者は対応するオンチェーンコミットメントと整合するアイデンティティを保有していることをゼロ知識で証明する。PQC（post-quantum）署名を直接展開した場合と比較してトランザクションあたりの認可データを桁違いに削減（ベンチマーク: 従来比 1/10 以下）。最終版は2026年5月28日更新。

## なぜ KYA に関係あるか
Track C（技術動向）の ZK Proof × PQC 交差領域に直接対応。AI エージェントの「アイデンティティ証明」と「量子安全」を同時に解決するアプローチとして、KYA インフラの暗号基盤候補。エージェントが毎回フルサイズの PQC 署名をチェーンに乗せるコスト問題を緩和するため、スケーラブルな KYA にとって重要な設計参照。QSB（Quantum Secure Bridge）と技術的に関連する可能性あり（推定）。

## 推奨アクション
- [ ] そのまま track に統合（tracks/C-tech-trends/papers/ に paper-summarizer で評価）
- [ ] tech-trend-watcher に impact rating 付き要約を依頼（PQC × ZK の組み合わせは 5 段階で 4 相当と推定）
- [ ] watch list に追加して引用論文を追跡
