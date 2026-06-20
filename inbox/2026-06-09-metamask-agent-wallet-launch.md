---
type: news
source: CoinDesk / MetaMask
url: https://www.coindesk.com/tech/2026/06/08/metamask-launches-ai-agent-wallet-with-built-in-security-for-crypto-trades
date_published: 2026-06-08
fetched: 2026-06-09
relevance: high
suggested_track: A
suggested_destination: tracks/A-competitors/metamask-agent-wallet.md
---

# MetaMask、AI エージェント専用 self-custodial ウォレットをリリース（Early Access）

## 要約
MetaMask が2026年6月8日、AI エージェント向け自己管理型ウォレット "Agent Wallet" の Early Access（約200枠）を開始した。Ethereum・Base・Arbitrum 等10チェーンに対応し、スワップ・パープ・LP など DeFi 全機能をエージェントが自律実行できる。すべての取引はシミュレーション・脅威スキャン・MEV保護を経てから実行され、「悪意ある取引」または事前ポリシー（日次上限・許可リストプロトコル等）を逸脱した場合は人間の2FA承認が必須。MetaMask Transaction Protection により最大$10,000の補償が付く。一般提供は2026年夏を予定。

## なぜ KYA に関係あるか
AI エージェントに「ウォレット + 権限スコープ + 強制チェック」を組み込む実装として KYA の具体例。「エージェントはポリシー内で自律動作するが、逸脱したら人間が止める」設計はノンカストディ型 KYA の参照アーキテクチャになりうる。Track A 競合プロファイルに追加し、Track C 技術動向（権限デリゲーション実装）とクロスリファレンスする価値が高い。

## 推奨アクション
- [x] そのまま track に統合（Track A: MetaMask 競合プロファイル新規作成）
- [ ] subagent に詳細リサーチ依頼（competitor-researcher で Consensys/MetaMask の KYA ポジション深堀り）
- [ ] watch list に追加して様子見
