# Track A — 既存プレイヤーと先行投資の地図化

## 仮説

VISA・PayPal は先行リサーチして既に Agent Payments スタートアップに投資している。

## 構造

```
A-competitors/
├── <company-slug>.md           # 個社プロファイル(competitor-profile-builder Skill 使用)
├── conferences/                # カンファレンス transcript 分析
│   └── <conference>-<year>.md
└── funding/                    # 投資ラウンド・投資家追跡
    └── <entity-slug>.md
```

## 対象 long-list(W1-W2 で確定)

### Agent Wallet / Agent Identity 専業
- [ ] Skyfire
- [ ] Payman
- [ ] Crossmint
- [ ] Catena Labs
- [ ] Halliday
- [ ] Nevermined
- [ ] Atoma

### 決済プロトコル + Compliance Layer
- [ ] Coinbase Developer Platform(x402 周辺)
- [ ] Google AP2 ecosystem
- [ ] Shopify Agent Commerce ecosystem
- [ ] Anthropic Builders Program 投資先(Agent Payments関連)

### 戦略投資家 ポートフォリオ
- [ ] Visa Ventures
- [ ] Mastercard Start Path
- [ ] PayPal Ventures
- [ ] Stripe(投資 + 自社プロダクト)
- [ ] American Express Ventures
- [ ] a16z crypto
- [ ] Paradigm
- [ ] Coinbase Ventures

### カンファレンス追跡
- [ ] Money 20/20 USA 2025
- [ ] Money 20/20 Europe 2025
- [ ] Sibos 2025
- [ ] Consensus 2025
- [ ] Stripe Sessions 2025
- [ ] Code with Claude 2025
- [ ] Coinbase State of Crypto Summit
- [ ] BIS Innovation Hub Conference
- [ ] FATF Plenary Sessions
- [ ] JFSA イノベーション勉強会

## 進め方

1. **W1-W2**: long-list 確定、上位10社を `competitor-profile-builder` で生成
2. **W3-W4**: 上位10社プロファイル完成
3. **W5-W6**: 残り10-20社 + ラウンド整理(`investment-round-tracker`)
4. **W7-W8**: カンファレンス transcript 分析(`conference-transcript-analyzer`)
5. **W9-W10**: 戦略的含意の再編、competitive moat の特定
6. **W11**: publishable な英文 landscape doc(60-90頁)に統合

## アーキテクチャ思想の分岐(重要)

「Agent Wallet」「Agent Identity」を専業にしている会社と、決済プロトコル(x402, AP2, Stripe Agentic)に乗せて Compliance Layer を作っている会社で、**アーキテクチャ思想が分岐している**。
**KYAプロジェクトがどちら側に立つか** の戦略判断は、この地図ができてから決める。

## クロスリファレンス

- 規制スタンスは `tracks/B-regulations/` と整合
- 技術選択は `tracks/C-tech-trends/` と整合
- ビジネスモデル分布は `tracks/D-business-models/` と整合
