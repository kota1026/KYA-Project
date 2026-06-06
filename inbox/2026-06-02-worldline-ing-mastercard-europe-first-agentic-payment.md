---
type: news
source: Mastercard Newsroom / Worldline Global
url: https://www.mastercard.com/news/europe/en/newsroom/press-releases/en/2026/worldline-ing-and-mastercard-complete-a-live-end-to-end-european-agentic-payment-in-production/
date_published: 2026-06-02
fetched: 2026-06-06
relevance: high
suggested_track: A
suggested_destination: tracks/A-competitors/worldline-ing-mastercard-agentic-payment.md
---

# Worldline・ING・Mastercard、欧州初の本番環境エンドツーエンド agentic payment を完了

## 要約（3-5文）
2026年6月2日、Money20/20 Europe（アムステルダム）にて Worldline・ING・Mastercard の3社が、欧州初の本番環境でのエンドツーエンド agentic payment トランザクションを完了したと発表した。ユースケースはオランダ国内のING口座保有者が商品購入を行うもので、マーチャント側のAIエージェントが予算内でコンサートチケットを提案し、消費者が明示的に承認した後に決済が完了する形式。Worldline が issuing/acquiring 両面のエンドツーエンド処理を担い、決済はMastercardネットワーク上で処理された。トランザクションにはエージェント起源を示す識別子が付与されており、発行銀行が全経路を可視化できる。

## なぜ KYA に関係あるか
欧州の本番環境で「消費者→エージェント→マーチャントエージェント→発行銀行」の承認・認証フローが実証された初の事例。エージェント起源識別子と消費者の明示承認の組み合わせは KYA の「委任バインディング」に直接対応する実装パターン。Track A 競合マッピング（Mastercard の agentic 戦略）と Track D ビジネスモデル（欧州での決済フロー）の両方に関連。

## 推奨アクション
- [x] Track A に Worldline/ING の agentic payments プロフィールとして統合
- [ ] Mastercard の既存プロファイルに本事例を追記（Track A）
- [ ] 「エージェント起源識別子」の技術仕様を詳細リサーチ（subagent 依頼）
