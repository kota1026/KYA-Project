---
type: news
source: IBS Intelligence / ANI News / PYMNTS
url: https://ibsintelligence.com/ibsi-news/pine-labs-launches-ai-payment-protocol-for-agent-led-upi-transactions/
date_published: 2026-06-11
fetched: 2026-06-11
relevance: high
suggested_track: B
suggested_destination: tracks/B-regulations/IN/pine-labs-p3p-upi-agentic.md
---

# Pine Labs、P3P プロトコル発表——UPI マンデートを拡張しAIエージェントが無人決済を実行（インド）

## 要約（3-5 文）
インドの加盟店プラットフォーム Pine Labs は2026年6月11日、AI エージェントが UPI 決済を人間認証なしで完結させる「P3P（Pine Labs Payments Protocol）」を発表した。P3P は既存の UPI Single Block Multiple Debit（SBMD）/ One Time Mandate（OTM）フレームワークを拡張し、ユーザーが一度だけ上限額と有効期限を事前承認すればエージェントが自律執行できる。身元確認・委任認可・支出制限・監査ログは Grantex が担い、HTTP 402 標準を機械可読な決済リクエスト層として採用。第一の本番事例は金デジタル積立アプリ Gullak で、目標価格到達時に AI エージェントが自動購入する機能が稼働済み。

## なぜ KYA に関係あるか
Track B（規制）のインド法域において、UPI フレームワーク内でのエージェント委任モデルが初めて商用実装された。NPCI 規制下で KYA 的な「事前承認 + 支出制限 + 監査ログ」アーキテクチャが採用されており、ノンカストディ型の仮置き前提とも整合する。日本（J-Debit/口座振替）・EU（PSD2 mandate）との比較対象として重要。Grantex の identity/authorization 機能は競合プロファイルとして Track A にも要記録（推定：未確認詳細あり）。

## 推奨アクション
- [ ] そのまま track に統合（tracks/B-regulations/IN/ を新規作成）
- [ ] regulation-mapper で UPI SBMD/OTM × KYA 論点の法域比較（IN / JP / EU）を依頼
- [ ] Grantex 社を Track A 競合リストに追加・watch
