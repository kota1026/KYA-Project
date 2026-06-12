---
type: paper
source: IETF Datatracker
url: https://datatracker.ietf.org/doc/draft-anandakrishnan-rats-ptv-agent-identity/
date_published: 2026-04-01
fetched: 2026-06-12
relevance: medium
suggested_track: C
suggested_destination: tracks/C-tech-trends/ietf-standards-watch.md
---

# IETF draft-anandakrishnan-rats-ptv-agent-identity: PTV プロトコルによる AI エージェント認証

## 要約
IETF RATS WG の新ドラフト。"Prove-Transform-Verify" の 3 フェーズでエージェントが「認可モデルを実行中であること」をハードウェア RoT(TPM 2.0/Secure Enclave)に基づいて証明するプロトコルを定義。機密データを開示せずにポリシー準拠を証明できる設計で、ソフトウェアのみの Attestation は高保証ユースケースに不推奨とする。

## なぜ KYA に関係あるか
PTV は「エージェントが改ざんされていないか」を第三者検証機関(Verifier)に証明する仕組みであり、KYA の「継続的コンプライアンス検証」要件に対応する。drake ドラフト(静的 ID 登録)と PTV(動的ランタイム証明)を組み合わせることで KYA の完全なライフサイクル管理が実現できる可能性がある。(推定)

## 推奨アクション
- [ ] Track C に追記(drake ドラフトと対応付け)
- [ ] watch list に追加——RATS WG の進捗を quarterly で確認
