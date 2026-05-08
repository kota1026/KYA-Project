---
description: 週次 digest を生成。inbox/ と tracks/ 直近7日分を読んで `synthesis/weekly/YYYY-WW.md` にまとめる。synthesis-curator subagent を起動。月曜朝のレビュー想定。
---

`synthesis-curator` subagent を起動して週次 digest を生成する。

## 手順

1. 現在の ISO 週番号を確認(date コマンドで `date +%G-W%V`)
2. Phase 0 の何週目かを計算(2026-05-08 が W0、以降 +1 週ずつ)
3. Agent ツールで `synthesis-curator` subagent を起動。プロンプトは:

```
週次 digest を生成してください。

現在: <週番号>(Phase 0 W<N>)
対象期間: 過去 7 日

inbox/ と tracks/ 配下の直近変更を読み、`synthesis/weekly/YYYY-WW.md` を生成してください。

重要:
- トップ 3 は decision-doc.md への影響度で選ぶ
- 当局者発言があれば必ず抜粋
- アクション提案は 3-5 個に絞る
- 1500 字以内
```

4. subagent 完了後、生成された digest を Read して 5-10 行で要点をコタに伝える
5. 「次のアクション」セクションを音読(コタが「やる/やらない」を即決できるよう)

## 完了後

- `synthesis/weekly/<YYYY-WW>.md` のパス
- トップ 3 の見出しのみコピー
- decision-doc.md への反映候補があれば「`/update-decision-doc` を走らせるか?」と提案
