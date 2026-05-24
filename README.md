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
