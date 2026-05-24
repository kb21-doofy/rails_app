# README

## Docker で起動する

### 初回起動

```bash
docker compose up --build
```

### 2回目以降

```bash
docker compose up
```

### バックグラウンドで起動

```bash
docker compose up -d
```

### 停止

```bash
docker compose down
```

### データも含めてリセットして起動

```bash
docker compose down -v
docker compose up --build
```

起動後、http://localhost:3000 でアクセスできます。

## Git 運用

### ブランチ構成

| ブランチ | 役割 |
|---|---|
| `main` | 本番環境。直接コミットしない |
| `dev` | 開発の統合ブランチ。mainと同じ環境を維持する |
| `feature/xxx` | 作業ブランチ。機能・修正ごとに作成する |

### 基本的な作業の流れ

**1. 作業ブランチを作る（必ず dev から）**
```bash
git switch dev
git pull origin dev
git switch -c feature/作業名
```

**2. 作業・コミット**
```bash
git add .
git commit -m "変更内容のメモ"
```

**3. dev にマージ**
```bash
git switch dev
git merge feature/作業名
git push origin dev
```

**4. 作業ブランチを削除**
```bash
git branch -d feature/作業名
```

### main へのマージ

dev で動作確認が取れたら main にマージする。

```bash
git switch main
git merge dev
git push origin main
```
