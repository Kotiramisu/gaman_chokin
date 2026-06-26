# 我慢貯金箱

## 概要
このアプリは日々の節約したこと、我慢したことを可視化するためのアプリです。
節約したことなどを追加、その金額額の合計値を可視化することができます。

## 使用技術
- Ruby 3.2.3
- Rails 7.1.2
- PostgreSQL 16
- Docker / Docker Compose

## セットアップ
\```bash
#　リポジトリをクローン
git clone git@github.com:Kotiramisu/gaman_chokin.git

# コンテナのビルドと起動
docker compose up --build

# データベースの作成
docker compose exec web rails db:create

# マイグレーションの実行
docker compose exec web rails db:migrate
\```

## 開発環境へのアクセス
http://localhost:3000

## 機能一覧

## 今後の追加予定機能
