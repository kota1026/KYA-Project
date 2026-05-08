# Track C — 隣接技術の動向と統合可能性

## 論点

KYA と DID と ZK と PQC をどう束ねるか — SDK の技術アーキテクチャを決める基盤。

## 構造

```
C-tech-trends/
├── papers/                  # 個別論文の要約+impact rating
│   └── <arxiv-id-or-slug>.md
├── domains/                 # 技術領域別マッピング
│   ├── did-vc.md
│   ├── zk-proof.md
│   ├── pqc.md
│   ├── zk-tls.md
│   └── selective-disclosure.md
└── key-people.md            # 追うべきキーパーソン3-5名
```

## 領域別追跡対象

### DID / Verifiable Credentials
- W3C DID v1.1
- ERC-8004(Trustless Agents)
- ERC-7683(Cross-chain Intent)
- Cheqd / Dock / Spruce ID / Privado ID 実装状況
- Agent向けに DID をどう発行するかの議論

### ZK Proof 系
- Halo2 / Plonky3 / Risc Zero / Succinct SP1 / Aleo
- Polygon ID / ZKsync Promise
- TLSNotary / zkTLS
- KYA での応用 = Selective Disclosure(本人性証明 / 個人情報非開示)
- 2024年比でzkVM コストが10-100倍下がっている

### PQC 統合
- NIST FIPS 203(ML-KEM)/ 204(ML-DSA)/ 205(SLH-DSA)
- ZK + PQC の研究は2025年から論文出始めた段階(まだ早い)
- Agent Payments での必要性: 署名長期保存(チャージバック保管7年要件、2030年代後半に移行)
- **方針**: 今すぐ実装ではなく、設計段階で「PQC migrationable」にしておく

### コミュニティ動向
- Identity at the Edge
- Internet Identity Workshop (IIW)
- ETHGlobal
- a16z Crypto School
- ZK Summit
- FROST Working Group
- IETF SCITT WG

## 進め方

1. **W1-W2**: 領域 mapping、追うべき会議・ML を特定
2. **W3-W4**: DID 領域深堀り、`paper-summarizer-with-impact-rating` で論文5-10本
3. **W5-W6**: ZK 領域深堀り、論文10本
4. **W7-W8**: PQC migration 戦略、署名長期保存の設計案
5. **W9-W10**: キーパーソン3-5名特定、彼らの発信を継続的に追う仕組み(`key-people.md`)
6. **W11**: 統合論点 → decision-doc.md の §3(技術アーキテクチャ基本方針)に反映

## Impact Rating 5/4 の論文は要 PoC 候補

- 5: 即座に SDK 設計に組み込むべき
- 4: 6-12ヶ月後の v2 で組み込み候補

## クロスリファレンス

- 各社の技術選択は `tracks/A-competitors/<company>.md` の (a) と整合
- 規制対応は `tracks/B-regulations/data-protection-and-zk-proof.md` と整合
