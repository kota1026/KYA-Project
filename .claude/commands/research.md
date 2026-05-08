---
description: 企業 or 論点 or 論文 を深堀りリサーチ。引数の内容を判定して適切な subagent(competitor-researcher / regulation-mapper / tech-trend-watcher)に振り分ける。
argument-hint: <企業名 | 論点 | 論文URL | 質問>
---

ユーザーから次のリサーチ対象が指定された:

```
$ARGUMENTS
```

以下の手順で進めること:

1. **対象判定**:
   - 企業名・サービス名 → `competitor-researcher` subagent
   - 規制・法域・コンプライアンス論点 → `regulation-mapper` subagent
   - 論文URL・技術領域(DID/ZK/PQC等) → `tech-trend-watcher` subagent
   - 判定不能なら 1 つ確認質問してから振り分け

2. **subagent 起動**:
   - Agent ツールで該当 subagent を起動
   - 引数の内容をそのまま渡す
   - 並行リサーチが意味ある場合は複数 subagent を並列起動(例: 企業名 + 規制スタンス両方)

3. **完了後**:
   - subagent からの報告を 5-10 行で要約
   - 関連 track ファイルへのリンクを示す
   - 次のアクション提案 1-2 個

**守ること**:
- subagent に丸投げしない。コタが何を求めているかを判定するのは自分の責任。
- 引数が曖昧なら確認する(例: "Skyfire" だけ来たら「会社プロファイル全体? 直近の調達のみ? 規制スタンスのみ?」と聞く)。
