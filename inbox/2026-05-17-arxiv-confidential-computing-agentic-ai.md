---
type: paper
source: arXiv (cs.CR)
url: https://arxiv.org/abs/2605.03213
date_published: 2026-05-04
fetched: 2026-05-17
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/tee-confidential-computing-agents.md
---

# arXiv 2605.03213 — "When Agents Handle Secrets: A Survey of Confidential Computing for Agentic AI"

## 要約
Forough・Kogias・Haddadi による調査論文（2026-05-04）。エージェント AI が資格情報・プロセスコンテキスト・シークレットを扱う際の脅威モデルを整理し、Intel SGX/TDX・AMD SEV-SNP・ARM CCA・NVIDIA H100 CC の 6 TEE プラットフォームを比較。プロンプトインジェクション・コンテキスト漏洩・エージェント間メッセージ改ざんへの対策として Remote Attestation を中心に据える。LLaMA-3 8B の部分シールドが鍵再利用脆弱性を持つことを実証した 2026 年結果も引用。

## なぜ KYA に関係あるか
KYA の「実行中エージェントが宣言した ID を保持しているか」を保証するには TEE + Remote Attestation が有力な技術経路。Track C の zkTLS/PQC 軸に TEE を追加し、実装コストとトレードオフを整理する素材になる。

## 推奨アクション
- [x] そのまま track に統合
- [ ] subagent に詳細リサーチ依頼
- [ ] watch list に追加して様子見
