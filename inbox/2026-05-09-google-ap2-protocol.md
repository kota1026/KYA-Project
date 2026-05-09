---
type: news
source: Google Cloud Blog / Computer Weekly
url: https://cloud.google.com/blog/products/ai-machine-learning/announcing-agents-to-payments-ap2-protocol
date_published: 2026-04-09
fetched: 2026-05-09
relevance: high
suggested_track: A
suggested_destination: tracks/A-competitors/google-ap2-protocol.md
---

# Google Agent Payments Protocol (AP2) 発表

## 要約
GoogleがAP2（Agent Payments Protocol）をオープンプロトコルとして発表。Adyen・American Express・Coinbase・Mastercard・PayPal・Visaなど60社超が参加。中核はMandate（改ざん防止の暗号署名付きデジタル契約）とVerifiable Credentials（VC）を組み合わせた決済認可フロー。A2AプロトコルおよびMCPの拡張として設計。リアルタイム購入とデリゲートタスクの2シナリオをサポート。

## なぜ KYA に関係あるか
AP2の「Mandate = VCで署名された権限証明」はKYAの認証・認可アーキテクチャと直接競合・補完する。エージェントの権限範囲をVCで明示するアプローチはTrack C（DID/VC技術）とTrack A（競合地図）の両方に影響。

## 推奨アクション
- [ ] subagent に詳細リサーチ依頼（AP2のVC仕様 vs DIF/W3C標準との差異を tech-trend-watcher で調査）
- [ ] Track A: google-ap2-protocol.md として統合
- [ ] Track C: AP2 Mandate ↔ W3C VC 仕様比較メモ追加
