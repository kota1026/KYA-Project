---
type: paper
source: arXiv cs.CR
url: https://arxiv.org/abs/2504.16108
date_published: 2025-04-17
fetched: 2026-05-26
relevance: medium
suggested_track: C
suggested_destination: tracks/C-tech-trends/papers/2504.16108-esim-telco-agent-identity.md
---

# arXiv 2504.16108「Trusted Identities for AI Agents: Leveraging Telco-Hosted eSIM Infrastructure」

## 要約

著者 Sebastian Barros が、通信事業者(MNO)がホストする eSIM インフラ(eUICC/HSM)を AI エージェントの Root of Trust として活用する概念アーキテクチャを提案。API キー・証明書・アプリ層クレデンシャルはライフサイクル管理とインターオペラビリティに限界があると指摘し、通信グレードの信頼基盤によりエージェント固有の eSIM プロファイルを発行・失効できる設計を示す。エージェントはクリプト API または ID ゲートウェイ経由でリモート認証する。cs.CR/cs.NI カテゴリ、25 ページ。

## なぜ KYA に関係あるか

ノンカストディ型 KYA のハードウェア信頼基盤として、eSIM/MNO モデルは HSM や TEE と並ぶ選択肢になりえる。KYA の「誰がエージェントを認可したか」を通信インフラ層で証明できれば規制適合性が高まる可能性。Track C の identity root-of-trust 比較(eSIM vs TEE vs HSM vs software-only VC)論点として重要。

## 推奨アクション

- [ ] Track C の identity root-of-trust 比較ファイルに追記
- [ ] tech-trend-watcher に eSIM/MNO モデルの詳細リサーチを依頼検討
- [ ] watch list: 通信事業者が KYA インフラに参入するシナリオを Track A に追記
