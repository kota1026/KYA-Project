---
type: paper
source: IETF Internet-Draft / datatracker.ietf.org
url: https://datatracker.ietf.org/doc/draft-sharif-agent-payment-trust/
date_published: 2026-03-25
fetched: 2026-06-17
relevance: medium
suggested_track: C
suggested_destination: tracks/C-tech-trends/ietf-agent-payment-standards.md
---

# IETF draft-sharif-agent-payment-trust-00 — AI エージェント決済のトラストスコアリング標準草案

## 要約
CyberSecAI Ltd の R. Sharif が2026年3月提出の IETF Standards Track Internet-Draft。MPP 等を使う AI エージェントの決済において、トラストスコアリング・本人確認・支出上限強制を標準化するプロトコルを定義。"Agent Passport"(暗号委任証明書)で人間の事前承認を記録。npm パッケージ(@proofxhq/agentpass)と iOS SDK で参照実装あり。PCI DSS 12 要件に対応した設計とされる。

## なぜ KYA に関係あるか
KYA の技術実装における「トラストスコアリング」が IETF 標準として提案された初の事例(推定)。Agent Passport 概念は Track B 規制の KYA 委任証明要件にも直接援用可能。

## 推奨アクション
- [ ] Track C: IETF agent 標準ファイルに追記(既存 WIMSE 関連ファイルと並置)
- [ ] Track B: Agent Passport の法的位置づけを規制マッピングで検討
