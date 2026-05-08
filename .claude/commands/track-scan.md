---
description: Track 全体を一気にスキャン。指定 Track の README / 既存ファイル / 未着手項目を読み、優先順位付きの作業リストを返す。
argument-hint: A | B | C | D
---

引数:

```
$ARGUMENTS
```

Track $ARGUMENTS の現状をスキャンする。

## 手順

1. **Track 確認**: A=competitors, B=regulations, C=tech-trends, D=business-models
2. **README 読込**: `tracks/<X>-*/README.md`
3. **既存ファイル一覧**: Glob で配下の .md を全部
4. **進捗評価**:
   - long-list / 論点リスト の埋まり具合(完了 / 進行中 / 未着手)
   - 直近 2 週間で更新されたファイル
   - 古いファイル(>4 週間更新なし)
5. **クロスリファレンス整合性チェック**:
   - 他 Track からの参照がきれていないか軽く確認
6. **アクション提案**:
   - 次にやるべき 3-5 個(優先度順)
   - それぞれどの subagent / Skill / command で進められるか明示

## 出力

```markdown
# Track <X> Scan — YYYY-MM-DD

## 進捗
- 完了: <件数 / 全体>
- 進行中: <件数>
- 未着手: <件数>

## 最近の動き(直近 2 週間)
- <ファイル名>: <変更要点>

## ギャップ
- <未着手項目>
- <情報不足項目>

## 次にやるべき 3-5 個
1. **<優先度1>** — `/research <target>` または subagent: <name>
2. ...

## 関連 Track への波及
- Track <Y>: <影響>
```

**守ること**:
- 1500 字以内
- アクション提案は 5 個まで
- subagent / Skill / command を明示し、コタがすぐ実行できるようにする
