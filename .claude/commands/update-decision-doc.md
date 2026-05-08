---
description: synthesis/decision-doc.md を最新の Track 情報で更新。各 § について暫定 → 確定 へ進められる項目があれば反映。critic subagent でチェック後 commit。
---

`synthesis/decision-doc.md` を最新情報で更新する。

## 手順

1. **現状把握**:
   - `synthesis/decision-doc.md` を Read
   - 過去 1 週間の `synthesis/weekly/*.md` を Read
   - 直近更新された `tracks/**/*.md` を git log で特定
2. **更新候補の抽出**:
   - §1 法人設立国: Track B の最新マッピングから根拠が増えた項目
   - §2 ビジネスモデル: Track A の競合分布、Track D の経済性試算
   - §3 技術アーキテクチャ: Track C の impact 4+ 論文、標準化動向
   - §4 最初の3顧客: Track A から接点ある企業
   - §5 PayPay との関係: コタの発言・状況変化
3. **更新の実施**:
   - "未決定" → "暫定" に上げる場合は理由を記載
   - "暫定" → "確定" は Phase 0 Week 11 以降のみ
   - 各 § の更新には日付付きで履歴
4. **critic subagent 起動**:
   - 更新後のファイルでギャップ・矛盾を検出
   - 重大な指摘があれば修正
5. **§8 変更履歴に追記**

## 出力

更新後、コタに以下を報告:
```markdown
# decision-doc 更新サマリ — YYYY-MM-DD

## 変更点
- §1: <変更前 → 変更後> (根拠: <Track ファイル>)
- ...

## critic レポート
- 重大: N 件 (<対応 / 残課題>)
- 中: N 件
- 軽微: N 件

## まだ未決定の §
- ...

## 次の更新タイミング推奨
- ...
```

**守ること**:
- 「確定」へ昇格は Week 11 以降のみ。それ以前は「暫定」止め。
- 変更には必ず根拠ファイル参照(path:line 形式)
- §8 変更履歴に1行追記必須
- critic で重大指摘が出たら commit 前に必ず修正
- コタの最終承認を待つ(自動 commit しない、diff だけ示して尋ねる)
