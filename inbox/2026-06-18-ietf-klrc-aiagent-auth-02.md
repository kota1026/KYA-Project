---
type: paper
source: IETF Datatracker
url: https://datatracker.ietf.org/doc/draft-klrc-aiagent-auth/
date_published: 2026-06-01
fetched: 2026-06-18
relevance: high
suggested_track: C
suggested_destination: tracks/C-tech-trends/ietf-ai-agent-auth-standards.md
---

# IETF draft-klrc-aiagent-auth-02: "AI Agent Authentication and Authorization"

## 要約
AWS・Zscaler・Ping Identity・OpenAI のエンジニアが共著した IETF ドラフト(v02、2026-06-01)。新プロトコルを定義するのではなく、WIMSE アーキテクチャと OAuth 2.0 ファミリーを AI エージェントの認証・認可ニーズに適用・拡張するベストプラクティスをまとめる。エージェント ID の peer-to-peer trust establishment、委任チェーン、スコープバインディングを中心に規定。並行して draft-singla-agent-identity-protocol-03(AIP: 分散型委任フレームワーク)も -03 に更新。

## なぜ KYA に関係あるか
KYA インフラの認証層に直結。WIMSE + OAuth2.0 ベースが業界標準になれば、独自プロトコルより既存スタック拡張で KYA を実装するパスが合理的になる。主要クラウドベンダー(AWS)と IdP ベンダー(Ping/Zscaler)が共著している点は adoption 速度の指標として重要。Track C の "標準化タイムライン" に追記すべき。

## 推奨アクション
- [ ] Track C: WIMSE/OAuth2.0 拡張 vs 独自プロトコル(ERC-8004 等)の比較表に本ドラフトを追加
- [ ] tech-trend-watcher subagent に klrc-aiagent-auth の詳細解析を依頼
- [ ] decision-doc §認証基盤選択 に "IETF 標準準拠" 優位性の根拠として引用
