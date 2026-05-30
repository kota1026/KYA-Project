---
type: paper
source: arXiv cs.CR
url: https://arxiv.org/abs/2605.11781
date_published: 2026-05-12
fetched: 2026-05-27
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/protocols/x402-security-analysis.md
---

# arXiv:2605.11781 — Five Attacks on x402 Agentic Payment Protocol

## 要約
Ohio State / CSIRO / Manchester の共著。x402 プロトコルを形式的に解析し、認可・バインディング・リプレイ保護・Web レイヤーにまたがる 5 つの具体的攻撃を実証。Base Sepolia および本番エンドポイントで再現可能なテストベッドを構築。オープンソース SDK 3 件も監査済み。HTTP 支払いプロトコルとブロックチェーン決済の境界でクロスレイヤー攻撃面が生まれることを示す。

## なぜ KYA に関係あるか
KYA プラットフォームが x402 を決済レールとして採用する場合、今回指摘された認可バイパス・リプレイ攻撃は直接リスク。ノンカストディ設計でもウォレット委任フローに同様の脆弱性が潜む可能性あり。Track C の x402 評価に必須の一次資料。A402 原子性論文(2026-05-26)と並べて参照すると技術選定の判断材料が揃う。

## 推奨アクション
- [ ] Track C の x402 技術評価ファイルにセキュリティ脆弱性セクションを追記
- [ ] decision-doc.md の技術スタック選定でリスク欄に記載
- [ ] tech-trend-watcher に x402 vs AP2 の安全性比較を依頼
