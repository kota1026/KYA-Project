---
topic: ERC-8004 × AWS AgentCore Identity glue feasibility
last_updated: 2026-05-20
domain: [did, vc, zk-proof, agent-identity, pqc]
overall_feasibility: medium
impact_rating: 5/5
poc_6mo_feasibility: yes (limited scope)
---

# ERC-8004 と AWS AgentCore Identity の統合可能性

> **要旨**: ERC-8004 は **on-chain ERC-721 NFT による agent identifier**、AWS AgentCore Identity は **OAuth 2.0 / OIDC ベースの workload access token**。両者は層も信頼モデルも違うが、**KYA Layer が両者を「橋」として吸収する戦略空間は存在する**。Feasibility は **Medium**(技術的には可能だが、ERC-8004 仕様空間に "human ↔ agent binding" の primitive がなく、KYA SDK 側で補う必要がある)。

---

## 1. ERC-8004 現状

### ステータス・著者・タイムライン

| 項目 | 内容 |
|------|------|
| Status | **Draft**(EIP repo)。仕様としては Stable 寄り(2026-01-29 mainnet 配備済) |
| 提案日 | 2025-08-13 |
| Mainnet deployment | 2026-01-29(Ethereum mainnet + 主要 L2) |
| Authors | Marco De Rossi(MetaMask)、Davide Crapis(Ethereum Foundation)、Jordan Ellis(Google)、Erik Reppel(Coinbase) |
| Reference impl | `github.com/erc-8004/erc-8004-contracts`(Solidity、ライセンス CC0、TypeScript デプロイスクリプト同梱、**audit 公開なし**) |
| 対応チェーン | Ethereum / Base / Arbitrum / Optimism / Polygon / Scroll / Linea / Mantle / Avalanche / BSC / Celo / Gnosis / Taiko / Hedera 他多数(mainnet + testnet 両方デプロイ済み) |

### 著者構成の戦略的意味

**MetaMask + Ethereum Foundation + Google + Coinbase という組み合わせは、x402(Coinbase 主導)・A2A(Google 主導)・MCP との「同盟」を強く示唆する**。Anthropic は ERC-8004 著者リストに不在 — これは KYA Project が Anthropic 文脈で動く場合、ERC-8004 を採用しつつも fully aligned でない柔軟性を保てるという意味で機会。

### Agent identifier 表現方式

**重要**: ERC-8004 は **W3C DID method を採用していない**。Identifier は以下の形式:

```
agentRegistry: {namespace}:{chainId}:{identityRegistry}  // CAIP-10 ベース
例:               eip155:1:0x742...                       // EVM chainId=1
tokenId:          uint256                                 // ERC-721 token ID
```

- **基盤**: ERC-721(NFT)+ URIStorage extension
- **portable / transferable**: NFT として transfer 可能(これは agent identity を売買可能にする両刃の剣)
- **agentURI**: IPFS / HTTPS / base64 data URI で登録ファイルを指す
- **endpoints**: 登録ファイル内で A2A agent card / MCP endpoint / ENS / **DID(オプショナル)** / wallet address を宣言できる

つまり ERC-8004 は **"primary identifier は NFT ID、DID は付随的な endpoint の一つ"** という設計思想。**W3C DID 標準を adopt しているわけではない**(あくまで registry 内のオプショナルフィールド)。

### Trust Models(3 つの pluggable layer)

1. **Reputation Registry**: int128 固定小数点 feedback。on-chain aggregation + off-chain detail。Sybil mitigation は外部 reviewer reputation に依存
2. **Crypto-Economic Validation**: stake-secured re-execution(validator が collateral を積む)
3. **TEE Attestation**: TEE oracle が computation の cryptographic proof を提示

→ KYA Layer 視点では **3 つすべて "agent 行動の正しさ" のための trust であり、"agent と人間の binding" や "規制 attestation" は未カバー**。これがコタさんの戦略空間。

### 関連 EIP

- ERC-721 (基盤)
- EIP-712 (EOA 署名)
- ERC-1271 (smart contract wallet 署名)
- EIP-155 (chain ID)
- **EIP-7702** (gas sponsorship、agent payment UX 向け)
- ERC-7683 (cross-chain intent。ERC-8004 とは独立だが agentic payment 文脈で並走)

### Security Considerations(EIP-8004 自身が明記)

- **Sybil attack**: "Possible, inflating reputation of fake agents" — mitigation は外部依存
- **Capability verification 不可**: プロトコル自身は agent の機能や malicious 行動を暗号学的に検証できない、と明示。**これは KYA Layer が埋めるべき空間そのもの**
- **Audit trail**: on-chain pointer は immutable

---

## 2. W3C DID v1.1 / VC v2.0 との関係

### W3C DID v1.1 ステータス

- **Candidate Recommendation Snapshot**: 2026-03-05
- Recommendation(REC)への昇格は 2026 後半見込み(推定)

### ERC-8004 ↔ W3C DID のマッピング

ERC-8004 は DID method を adopt していないが、**仮想的に `did:erc8004` method を定義する余地はある**。最も自然なマッピング:

```
did:erc8004:eip155:1:0x742...:1234
            └ namespace        └ tokenId
            └ chainId
            └ identityRegistry
```

ただし **現時点で did:erc8004 method の standard 提案・実装は存在せず**(2026-05-20 確認)、これは KYA Project が **first-mover として did method を提案・実装する戦略的余白**。

**より既存・実用的な代替案**:
- **did:pkh** : agent の wallet address を直接 DID 化(Spruce ID 実装あり、W3C CCG draft)
- **did:ethr** : EthereumDIDRegistry contract 経由(Spruce / Veramo 実装あり、key rotation 対応)
- **did:web** : `did:web:agent.example.com:agents:1234` のように HTTPS endpoint に DID Document を置く(最も実装簡単、cloud workload と相性良し)

→ **KYA SDK の暫定推奨**: **did:web を primary、ERC-8004 token ID を agentURI に書き込む二層構造**。

### VC v2.0 / SD-JWT VC との互換性

| 形式 | 標準化ステータス | ERC-8004 との互換性 | 推奨度 |
|------|------------------|---------------------|--------|
| W3C VC Data Model v2.0 | W3C Rec(2025) | agentURI 内に格納可能 | ◯ |
| SD-JWT VC | IETF draft-16(2026-04-24)、RFC publication 間近 | JWT として agent token に同梱可能 | ◎ |
| BBS+ / SD-BBS | W3C CCG draft | ZKP friendly だが実装成熟度低 | △(v2 検討) |
| mdoc / mDL(ISO 18013-5) | ISO 標準済(eIDAS 2.0 mandated) | EU agent identity に必須化の可能性 | ◯(EU 向け必須) |

**結論**: **SD-JWT VC を primary、mdoc を EU 対応で併設**。SD-JWT VC が draft-16(2026-04-24)で実質 RFC stable phase に到達しており、ML-DSA-44 を含む PQC algorithm への切替も研究フェーズで検証済([TechRxiv 2025-10](https://www.techrxiv.org/users/973090/articles/1346363-post-quantum-cryptography-for-verifiable-credentials-comprehensive-performance-evaluation-including-selective-disclosure))。

---

## 3. AWS AgentCore Identity 連携設計案

### AgentCore Identity の primitive

| 項目 | 内容 | ソース |
|------|------|--------|
| 認証プロトコル | OAuth 2.0 / OIDC / API Key | AWS docs |
| inbound auth | OIDC discovery URL(`.well-known/openid-configuration`)を持つ任意の IdP の JWT を validate(issuer + signature)| docs/runtime-oauth |
| 対応 IdP | Amazon Cognito、Okta、Microsoft Entra ID、Custom OIDC providers | AWS docs |
| outbound | Token exchange(推定 RFC 8693 ベース)で third-party API への authorized call | docs |
| Workload Access Token | inbound token の iss + sub を抽出し、AgentCore Identity が独自に発行する access token(format 詳細未公表)| docs/get-workload-access-token |
| 標準準拠 | OAuth 2.0 / OIDC | confirmed |
| 非対応 | **W3C DID method、SPIFFE/SPIRE、ERC-8004 — すべて言及なし** | confirmed by absence(2026-05-20 確認) |

**重要な確認事項**(未確認、W3 で一次資料精査):
- Workload Access Token の正確な claim 構造(JWT format / 署名アルゴリズム RS256 vs ES256 / JWKS endpoint URI / 外部 verifier の offline verify 可否)
- AgentCore Identity 自身が OIDC provider として `iss` URL を publish するか
- Token exchange が RFC 8693 準拠か独自実装か

### Glue Bridge Architecture(KYA SDK 提案案)

```
                         [Human User]
                              │
                              │ OAuth login(Cognito / Okta / Entra ID 等)
                              ▼
                  ┌──────────────────────┐
                  │  External OIDC IdP   │
                  │  (issuer = idp.example) │
                  └──────────────────────┘
                              │ id_token (JWT)
                              ▼
                  ┌──────────────────────────────────┐
                  │  AWS AgentCore Identity           │
                  │  - inbound JWT validate           │
                  │  - issue WorkloadAccessToken      │
                  │    (iss=AWS, sub=user, aud=agent) │
                  └──────────────────────────────────┘
                              │ WorkloadAccessToken (JWT)
                              ▼
        ┌─────────────────────────────────────────────────────┐
        │  KYA Bridge (★ コタさんの SDK が提供する箇所)         │
        │                                                       │
        │  Step 1: WorkloadAccessToken の sub/iss を抽出       │
        │  Step 2: did:web:agent.kya.example/agents/<uuid> 発行 │
        │  Step 3: agentURI に ERC-8004 Identity Registry 登録  │
        │  Step 4: VC 発行(SD-JWT VC):                        │
        │           - issuer: did:web:kya.example              │
        │           - subject: did:web:agent.kya.../<uuid>     │
        │           - claims:                                   │
        │             * humanBindingHash(sub の hash)         │
        │             * delegationChain([user, agent])          │
        │             * regulatoryAttestations([...])           │
        │             * spendingLimit, validityPeriod           │
        │  Step 5: x402 / AP2 リクエスト時に VC を提示          │
        │  Step 6: 7年保存(audit trail、PQC migrationable)    │
        └─────────────────────────────────────────────────────┘
                              │
                              ▼
                  ┌──────────────────────┐
                  │ Payment Rails (x402,  │
                  │ AP2, Stripe Agentic)  │
                  └──────────────────────┘
```

### 既存実装の有無

**2026-05-20 現在、AWS AgentCore Identity と ERC-8004 を統合した一次実装は存在しない**(WebSearch 確認)。

- **Privado ID(旧 Polygon ID)**: ZK-based VC platform、Polygon 上で動作するが AgentCore 統合は未確認(統合 SDK / blog / docs ともに発見できず)
- **Spruce ID**: did:pkh / did:ethr / did:web を含む multiple DID method 実装(`spruceid/ssi` library)。SSI library として最も成熟。**AgentCore 直接統合はないが、Bridge の most natural foundation**
- **cheqd**: did:cheqd method、credential payment 対応。AgentCore 統合言及なし

→ **戦略含意**: Bridge を実装した第一号になれる **6-12 ヶ月の window**。Spruce ID の OSS library を基盤に bridge を書くのが最短経路。

---

## 4. ZK / Selective Disclosure 統合

### ZK ライブラリの現状比較(agent identity 用途、2025-2026)

| Library | 強み | 弱み | agent identity 適合度 |
|---------|------|------|----------------------|
| **Halo2**(zcash / pse) | 成熟、production-tested、recursion 強い | circuit DSL 学習コスト高 | ◯ |
| **Plonky3**(Polygon) | 最速 STARK 系、SP1 の基盤 | 直接利用は ergonomics 弱 | △(SP1 経由推奨) |
| **SP1**(Succinct) | **zkVM、Rust コードをそのまま prove 可能、最速クラス** | proof size がやや大、Groth16 wrap で吸収 | ◎ |
| **Risc Zero** | 同じく zkVM、ecosystem 大 | SP1 比でやや遅い | ◯ |

### 重要ベンチマーク(SP1 Hypercube、2025-10〜2026)

| 指標 | 値 | 環境 | 出典 |
|------|----|----|------|
| Ethereum block 完全 prove 時間(p95)| **10 秒**(95.4% of blocks)| 16 × NVIDIA RTX 5090 | [SP1 Hypercube 16 GPUs blog](https://blog.succinct.xyz/real-time-proving-16-gpus/) |
| Ethereum block 完全 prove 時間(p99.7)| 12 秒 | 同上 | 同上 |
| GPU 効率改善 | **12.5x**(6 ヶ月で 200 GPU → 16 GPU)| 2025-04 → 2025-10 | [SP1 2025 recap](https://blog.succinct.xyz/succinct-2025-recap/) |
| Initial avg prove time | 10.3 秒 | 2025-05 初公開時 | [SP1 Hypercube intro](https://blog.succinct.xyz/sp1-hypercube/) |

**含意**: Ethereum block 全体(数百万 gas、複数 tx)が 10 秒で proof 化できる。**KYA の agent attestation は計算量で言えば「hash + signature verify + 数本の VC claim 開示」程度**(Ethereum block の 1/1000 〜 1/10000 の計算量)。→ **agent identity 用 ZK proof は理論的に 10ms-100ms オーダーで生成可能**(推定、要 PoC で実測)。

### VC + ZKP のベンチマーク(SD-JWT VC + PQC)

| 指標 | 値 | アルゴリズム | 出典 |
|------|----|------------| ----|
| 検証速度 | **ML-DSA-44 > Ed25519** | ML-DSA-44(FIPS 204)| [TechRxiv 2025-10](https://www.techrxiv.org/users/973090/articles/1346363-post-quantum-cryptography-for-verifiable-credentials-comprehensive-performance-evaluation-including-selective-disclosure)(具体数値は本文 Table 参照、未取得) |
| 署名サイズ | 大(ML-DSA-44 ≈ 2.4KB、Ed25519 = 64B) | ML-DSA-44 vs Ed25519 | NIST FIPS 204 |
| SD-JWT 形式 | JSON-friendly、HTTP header 経由配布可 | SHA-256 hash + JWT | [SD-JWT VC draft-16](https://datatracker.ietf.org/doc/draft-ietf-oauth-sd-jwt-vc/) |

**前提・セキュリティ仮定**:
- 上記 ZK benchmark は **trusted setup なし**(Plonky3 / SP1 共に transparent)
- ML-DSA-44 は **NIST security level 2**(128-bit classical / quantum 相当)
- 上記 prover time は specialized hardware(RTX 5090 × 16)前提。**consumer hardware(M2 Macbook Pro)では現時点で 5-20x 遅い見込み**(推定)

### 推奨スタック(暫定)

| レイヤー | 推奨 | 理由 |
|---------|------|------|
| 即時 production | **SD-JWT VC(Ed25519)+ ML-DSA-44 を併走発行**(crypto-agility) | RFC 化目前、実装ライブラリ豊富、PQC migration 切替 1 行変更 |
| ZK selective disclosure | **SP1**(Rust で書ける、Groth16 でラップして on-chain verify 可)| zkVM ergonomics 最強、agent SDK が Rust 主体なら直接利用 |
| v2 検討 | BBS+ / SD-BBS | ZK friendly な signature scheme。signature 自体に ZKP 性質、ただし PQC 移行が未確立 |

---

## 5. PQC migration 性

### ERC-8004 の PQC 対応

- **ERC-8004 仕様内に PQC 言及は無い**(2026-05-20 確認)
- 基盤 ERC-721 / EIP-712 / ERC-1271 はすべて **secp256k1 / Ed25519 系**(古典 ECDSA)
- Ethereum L1 自身が EVM signature scheme として ML-DSA を採用するロードマップ(EIP として)は **2026 時点で未提出**(推定)

**含意**: ERC-8004 の identifier 部分(NFT ID)は PQC 移行できる(NFT 自身は ID 文字列、署名スキームから独立)。一方、**agent の wallet 署名(EIP-712 / ERC-1271)は古典 ECDSA に固着**。これは agent 鍵が量子計算機で解読される 2035-2040 シナリオ(推定)で問題化。

### KYA Layer の PQC migration 戦略

KYA Project は **L3(認証・attestation 層)** にいるので、L2 の wallet 署名(古典 ECDSA)が破れた瞬間、**L3 の VC 内に保存した hashed-binding を PQC ハッシュで再 attest し直すことで救済可能**。

**設計原則(decision-doc.md §3 に追加推奨)**:
1. **VC 署名は crypto-agile**: SD-JWT VC の `alg` field を ML-DSA-44 / Ed25519 同時発行
2. **長期 audit trail(7 年)は SHA-3 / SHAKE / SLH-DSA(FIPS 205)で再 hash 可能な状態で保存**
3. **PQC 即時実装はしない**。但し **migration-able 構造を Day 1 で確保**
4. AWS KMS の ML-DSA preview([AWS PQC plan](https://aws.amazon.com/blogs/security/aws-post-quantum-cryptography-migration-plan/))を統合候補として watch

### NIST FIPS 採用ロードマップ

| FIPS | アルゴリズム | KYA 適用箇所 | 想定採用時期 |
|------|----------|------|------|
| FIPS 203 | ML-KEM | TLS / agent-to-agent encrypted channel | 2027-2028 |
| **FIPS 204** | **ML-DSA** | **VC 署名 / agent identity 署名** | **2026-2027(crypto-agility 実装、即時)** |
| FIPS 205 | SLH-DSA(hash-based)| 7 年保存 audit trail の long-term sig | 2028-2030 |

---

## 6. 統合 feasibility 総合評価

### Overall: **Medium feasibility** (lean toward "high if scope is limited")

| 評価軸 | 判定 | 根拠 |
|--------|------|------|
| 技術プリミティブの互換性 | ◯ | 両者とも OAuth/JWT を理解。Bridge は SDK レイヤーで吸収可能 |
| 標準仕様の安定性 | ◯ | ERC-8004 は mainnet 配備済、AgentCore Identity は GA preview |
| 既存実装の有無 | △ | Bridge を最初に書く必要あり(Spruce ID OSS が良い基盤) |
| AWS の協力可能性 | × | AWS は DID / ERC-8004 に公式コミットしていない。Bridge は AgentCore 外で動かす設計が必須 |
| PQC migration | ◯ | KYA Layer 側で crypto-agile 設計可能 |
| ZK 統合 | ◯ | SP1 が production ready、agent attestation 規模なら overkill 性能 |

### 6 ヶ月で PoC 可能か: **Yes(スコープを絞れば)**

**最小 PoC スコープ(6 ヶ月以内)**:
1. ✅ AWS AgentCore Identity で agent を起動
2. ✅ WorkloadAccessToken を取得し、`sub` / `iss` を抽出
3. ✅ Spruce ID(`spruceid/ssi`)を使い did:web を発行
4. ✅ SD-JWT VC を発行(issuer = did:web:kya-bridge、subject = agent)
5. ✅ ERC-8004 Identity Registry に agentURI として登録(testnet:Sepolia / Base Sepolia)
6. ✅ x402 リクエスト時に VC を HTTP header に同梱
7. ⏸ ZK selective disclosure は v2 まわし(SP1 hello-world のみ、production 統合は後)

**6 ヶ月で達成困難**:
- ❌ Mainnet deployment(gas、セキュリティ監査必要)
- ❌ PQC 切替の実稼働(crypto-agility 配線のみ実装、ML-DSA 実署名は v2)
- ❌ ZK の production 統合(SP1 PoC レベルのみ)
- ❌ Multi-cloud(Azure / GCP)対応(AWS-first で開始)

### 主要技術リスク

1. **AgentCore Identity の Workload Access Token format が非公開**: 外部 verifier が JWKS で検証できない場合、Bridge は AWS API 呼び出しに依存(レイテンシ + 障害点)。一次資料での精査 必須(W2-W3)
2. **ERC-8004 の "human binding" primitive 不在**: ERC-8004 の Identity Registry には "owner address" しかなく、人間の identity 情報を格納する slot がない。KYA Bridge が VC として外付けする設計を貫く必要(これは戦略上の機会でもある)
3. **AWS の囲い込みリスク**: AWS が re:Invent 2026(2026-12)で "AgentCore Identity Federation with DID" を発表すれば KYA Layer の差別化が消える。**12 月までに PoC 公開 + 標準化議論への参加が戦略的に重要**
4. **ERC-8004 NFT の譲渡可能性**: agent identity が転売可能 → 規制 attestation の "発行先" が変わる問題。KYA VC は agent NFT に縛らず、人間 ↔ agent binding に縛る設計で回避可能
5. **AWS WorkloadAccessToken 仕様の安定性**: GA preview 段階。GA 時に breaking change の可能性(W4 で再確認)

### 主要技術機会

1. **`did:erc8004` method の標準化提案**: W3C CCG / DIF への提案で、KYA Project が DID + ERC-8004 を橋渡しする立場を確立(影響度大)
2. **SD-JWT VC + ERC-8004 reference impl の OSS 公開**: GitHub に最初に公開すれば事実上のリファレンスになる
3. **multi-cloud KYA SDK**: AWS / GCP / Azure すべてで動く bridge は他社が作っていない(GCP は Managed Workload Identity を SPIFFE ベースで作っているので別ブリッジ必要)
4. **PQC-migratable VC OSS**: ML-DSA-44 + Ed25519 dual-sig SD-JWT VC を OSS で出すと標準化議論で leverage 取れる

---

## 7. KYA Project への含意

### decision-doc.md §3 への確定/暫定追加項目

以下を §3 の確定項目に追加推奨(W11 確定までに再検証):

| 項目 | 暫定推奨 | 確度 | 根拠 |
|------|----------|------|------|
| DID 基盤 | **did:web を primary、did:erc8004(独自提案)を experimental** | High | ERC-8004 が DID 標準を未採用、did:web は最も実装簡単で cloud workload 親和性高い |
| ZK ライブラリ | **SP1(zkVM、Rust)を primary、Halo2 は将来検討** | Medium-High | SP1 Hypercube ベンチマーク証明済、Rust SDK 親和性 |
| VC format | **SD-JWT VC(IETF draft-16)を primary、mdoc を EU 向け補完** | High | RFC 化目前、selective disclosure 標準実装 |
| PQC | **migration-able のみ Day 1 で確保(crypto-agility)、ML-DSA-44 dual-sig 実装は v2(2027)** | High | NIST FIPS 204、AWS KMS preview と歩調合わせる |
| AgentCore 連携 | **WorkloadAccessToken → did:web → ERC-8004 agentURI の三層 bridge** | Medium | Bridge 実装の reference は存在しない、最初に書く |
| 互換層 | **x402(Coinbase / AWS)+ AP2(Google)+ Stripe Agentic 三方向対応**(L3 として中立)| Medium | プロトコル乱立期の中立性が KYA の差別化 |
| 署名長期保存(7 年)| **SHA-3 / SHAKE で再 hash 可能な audit trail、即時実装は Ed25519 / ML-DSA-44 dual-sig** | High | チャージバック保管要件 + PQC migration |

### Bridge 実装の難易度評価

| コンポーネント | 難易度 | 工数(推定) |
|--------------|--------|------------|
| AgentCore WorkloadAccessToken の取得・parse | Low | 1-2 週 |
| did:web 発行(Spruce ID 利用)| Low | 1 週 |
| SD-JWT VC 発行ライブラリ統合 | Low-Medium | 2-3 週 |
| ERC-8004 Identity Registry への on-chain 書き込み | Medium | 3-4 週(gas optimization 含む) |
| 7 年保存 audit storage | Medium | 3 週(S3 + WORM + KMS) |
| x402 / AP2 リクエスト時の VC 同梱 | Medium | 3-4 週 |
| ZK selective disclosure(SP1 PoC レベル)| **High** | 6-8 週(v2 まわし) |
| PQC dual-sig 配線 | Low(配線のみ)| 1-2 週 |
| **合計(ZK 抜き、PoC レベル)** | — | **約 4 ヶ月、6 ヶ月以内で完全 PoC 可能** |

---

## 8. ソース

### 一次資料

- **ERC-8004 official spec**: [EIP-8004 on eips.ethereum.org](https://eips.ethereum.org/EIPS/eip-8004) — Status: Draft、Authors: Marco De Rossi / Davide Crapis / Jordan Ellis / Erik Reppel(アクセス 2026-05-20)
- **ERC-8004 reference impl**: [github.com/erc-8004/erc-8004-contracts](https://github.com/erc-8004/erc-8004-contracts) — Solidity、CC0、multichain deployment(アクセス 2026-05-20)
- **W3C DID v1.1 spec**: [Decentralized Identifiers (DIDs) v1.1](https://www.w3.org/TR/did-1.1/) — Candidate Recommendation Snapshot 2026-03-05
- **W3C VC Data Model v2.0**: [Verifiable Credentials Overview](https://w3c.github.io/vc-overview/)
- **SD-JWT VC draft-16**: [draft-ietf-oauth-sd-jwt-vc-16](https://datatracker.ietf.org/doc/draft-ietf-oauth-sd-jwt-vc/) — 2026-04-24
- **AWS AgentCore Identity overview**: [docs.aws.amazon.com/bedrock-agentcore/.../identity-overview.html](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/identity-overview.html) — アクセス 2026-05-20
- **AWS AgentCore Workload Access Token**: [docs.../get-workload-access-token.html](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/get-workload-access-token.html)
- **AWS AgentCore Inbound JWT authorizer**: [docs.../inbound-jwt-authorizer.html](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/inbound-jwt-authorizer.html)
- **AWS AgentCore Runtime OAuth**: [docs.../runtime-oauth.html](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/runtime-oauth.html)
- **AWS Security Blog AgentCore Identity**: [aws.amazon.com/blogs/security/securing-ai-agents-with-amazon-bedrock-agentcore-identity/](https://aws.amazon.com/blogs/security/securing-ai-agents-with-amazon-bedrock-agentcore-identity/)
- **AWS PQC migration plan**: [AWS PQC blog](https://aws.amazon.com/blogs/security/aws-post-quantum-cryptography-migration-plan/)

### 著者・解説

- **Marco De Rossi(MetaMask)**: [The Story Behind ERC-8004 & Next steps](https://medium.com/survival-tech/the-story-behind-erc-8004-next-steps-ec46c18d1879)
- **Quicknode 解説**: [ERC-8004: A Developer's Guide](https://blog.quicknode.com/erc-8004-a-developers-guide-to-trustless-ai-agent-identity/)
- **Cobo 解説(x402 + ERC-8004)**: [Cobo: ERC-8004 + x402](https://www.cobo.com/post/erc-8004-on-chain-identity-standard-for-ai-agents-the-future-of-agentic-wallets)
- **ChainUp: x402 と ERC-8004**: [ChainUp blog](https://www.chainup.com/blog/x402-erc8004-ai-agent-payments-agentic-web/)
- **AWS Heroes DEV: AgentCore Identity Part 1**: [dev.to AWS Heroes](https://dev.to/aws-heroes/amazon-bedrock-agentcore-identity-part-1-introduction-and-overview-di1)
- **CCN(mainnet date)**: [ERC-8004 Nears Mainnet](https://www.ccn.com/news/crypto/erc-8004-agents-standard-nears-mainnet-as-ethereum-teases-rollout/)

### ZK / PQC ベンチマーク

- **SP1 Hypercube intro**: [blog.succinct.xyz/sp1-hypercube/](https://blog.succinct.xyz/sp1-hypercube/) — 10.3s avg, 93% blocks < 12s
- **SP1 Hypercube 16 GPUs**: [Real-Time Proving with 16 GPUs](https://blog.succinct.xyz/real-time-proving-16-gpus/) — 95.4% < 10s on RTX 5090 × 16
- **SP1 Hypercube mainnet**: [SP1 Hypercube Now Live](https://blog.succinct.xyz/sp1-hypercube-is-now-live-on-mainnet/)
- **Succinct 2025 recap**: [Succinct 2025 recap](https://blog.succinct.xyz/succinct-2025-recap/) — 12.5x GPU efficiency improvement
- **Polygon Plonky3**: [Polygon Plonky3](https://polygon.technology/plonky3)
- **PQC for VC perf evaluation**: [TechRxiv 2025-10](https://www.techrxiv.org/users/973090/articles/1346363-post-quantum-cryptography-for-verifiable-credentials-comprehensive-performance-evaluation-including-selective-disclosure) — ML-DSA-44 > Ed25519 verification speed

### DID method 関連

- **did:pkh draft (W3C CCG)**: [w3c-ccg/did-pkh](https://github.com/w3c-ccg/did-pkh/blob/90b28ad3c18d63822a8aab3c752302aa64fc9382/did-pkh-method-draft.md)
- **did:ethr resolver (Spruce)**: [ethr-did-resolver spec](https://github.com/decentralized-identity/ethr-did-resolver/blob/master/doc/did-method-spec.md)
- **Spruce ID SSI lib**: [spruceid/ssi](https://github.com/spruceid/ssi)
- **DID Method Rubric v1.0**: [w3c.github.io/did-rubric/](https://w3c.github.io/did-rubric/)

---

## 9. W2-W3 追跡 TODO

- [ ] **AWS AgentCore Identity Workload Access Token の JWT format / 署名アルゴリズム / JWKS endpoint の一次資料精査**(`runtime-oauth.html` 直接アクセス、ブラウザで確認)
- [ ] **`spruceid/ssi` ライブラリのコード実検証**(did:web + SD-JWT VC 発行の API を確認)
- [ ] **ERC-8004 `register()` 関数のシグネチャと gas cost ベンチマーク**(testnet で実測)
- [ ] **did:erc8004 method draft の標準化前例調査**(W3C CCG mailing list アーカイブ)
- [ ] **SP1 を agent attestation サイズの circuit で実測**(M2 Macbook Pro / cloud GPU 比較)
- [ ] **ML-DSA-44 SD-JWT VC のサンプル実装**(`walt.id` / `spruceid/ssi` の対応状況)
- [ ] **Privado ID / Spruce ID / cheqd の AgentCore 統合公式アナウンス監視**(週次)
- [ ] **re:Invent 2026 CFP の "DID" / "agent identity federation" 採択監視**(2026-11)

---

## 10. Impact Rating

**5/5** — Phase 0 §3(技術アーキテクチャ基本方針)の **核心** を決める論点。W1 暫定の Multi-cloud KYA Layer ポジショニング全体の技術的実現性を担保する。**今すぐ decision-doc.md §3 の暫定確定項目に組み込むべき**。

### KYA SDK のどのコンポーネントに直結するか

1. **Bridge コンポーネント**: AgentCore WorkloadAccessToken ↔ did:web ↔ ERC-8004 agentURI(SDK コアの 50% 以上を占める想定)
2. **VC Issuer モジュール**: SD-JWT VC 発行 + ML-DSA-44 dual-sig
3. **Audit Storage**: 7 年保管、PQC migration ready
4. **Verifier**: x402 / AP2 / Stripe Agentic 三方向で VC を提示・検証

---

## 11. クロスリファレンス

- `tracks/A-competitors/aws-bedrock-agentcore-payments.md` §(a)(b) — AgentCore Identity の machine identity 限界と KYA 戦略空間
- `synthesis/decision-doc.md` §0(Executive Summary)、§3(技術アーキテクチャ)、§6(AWS 後出しリスク)
- (今後)`tracks/C-tech-trends/domains/did-vc.md` — did:web / did:erc8004 詳細
- (今後)`tracks/C-tech-trends/domains/zk-proof.md` — SP1 / Halo2 / Plonky3 比較
- (今後)`tracks/C-tech-trends/domains/pqc.md` — ML-DSA-44 / SLH-DSA migration
- (今後)`tracks/C-tech-trends/key-people.md` — Marco De Rossi / Davide Crapis / Jordan Ellis / Erik Reppel / Wayne Chang(Spruce ID)/ Daniel Buchner(DIF)

---

## 12. 法律意見・投資推奨ではない

本ドキュメントは技術リサーチであり、法律意見・投資推奨ではない。実装着手前に弁護士・セキュリティ監査人の確認が必要。
