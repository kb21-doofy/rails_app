# Rails App

Ruby on Rails アプリケーション（Docker 開発環境）

## 技術スタック

| 項目 | バージョン |
|------|-----------|
| Ruby | 3.3 |
| Rails | 8.0 |
| DB | PostgreSQL 16 |
| Cache/Queue | Redis 7 |

## 前提条件

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) がインストールされていること

## セットアップ

### 1. Railsアプリの新規作成（初回のみ）

```bash
# 1. イメージをビルド（Gemfile / Gemfile.lock が必要）
docker compose build

# 2. コンテナ内で rails new を実行（既存ファイルを上書き）
docker compose run --rm app rails new . --database=postgresql --force

# 3. database.yml を設定後、再ビルド
docker compose build
```

### 2. database.yml の設定

`config/database.yml` を以下のように更新する：

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  url: <%= ENV["DATABASE_URL"] %>

development:
  <<: *default

test:
  <<: *default
  url: postgresql://postgres:password@db:5432/app_test

production:
  <<: *default
```

### 3. 起動

```bash
docker compose up --build
```

ブラウザで http://localhost:3000 にアクセス。

## よく使うコマンド

```bash
# コンテナ起動（バックグラウンド）
docker compose up -d

# コンテナ停止
docker compose down

# Rails コンソール
docker compose exec app bin/rails console

# マイグレーション実行
docker compose exec app bin/rails db:migrate

# マイグレーション作成
docker compose exec app bin/rails generate migration AddColumnToTable

# テスト実行
docker compose exec app bin/rails test

# ログ確認
docker compose logs -f app

# Gemfile 変更後に bundle install
docker compose exec app bundle install

# コンテナを破棄してボリュームも削除
docker compose down -v
```

## ディレクトリ構成

```
rails_app/
├── Dockerfile
├── docker-compose.yml
├── README.md
├── Gemfile
├── Gemfile.lock
└── ...（Rails標準ディレクトリ）
```
