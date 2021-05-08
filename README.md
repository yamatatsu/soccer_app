# ラクカツ

担当競技経験が浅い or 未経験の中学校教職員による部活動負担の軽減も目的とした一元管理サービスです。
主に部活動は"選手の指導"と”試合等のチーム運営"の 2 つに分けられますが、
これらの負担を軽くするために当サービスでは日々の練習内容の共有や試合相手募集、予定管理が行えます。
また、ユーザ間での DM 機能もあるため、学外での人脈形成を容易に行えます。
なお、レスポンジブ対応しておりますので、スマホからもご確認いただけます。

# 使用技術

- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 5.6
  (以下予定)
- Nginx
- Puma
- AWS
  - VPC
  - EC2
  - RDS
  - Route53
- Docker/Docker-compose
- CircleCi CI/CD
- Capistrano3
- RSpec

# 機能一覧

- ユーザー登録、ログイン機能(devise)
- ユーザ編集機能
- 練習内容投稿機能
  - 複数枚画像投稿
  - 複数タグ付機能
  - インクリメンタルリサーチ機能(Ajax)
  - 文字カウント機能(Ajax)
- 投稿編集機能
- 投稿削除機能
- スライドショー機能(Slick)
- コメント機能(Ajax)
- 試合募集機能
- 試合削除機能
- 試合申し込み機能
- いいね機能(Ajax)
  - ランキング機能
  - 自己いいね一覧機能
  - いいね数表示機能
- コメント機能(Ajax)
  - コメント数表示機能
- フォロー機能(Ajax)
  - フォロー一覧機能
  - フォロワー一覧機能
- ページネーション機能(kaminari)
- パンくずリスト機能(gretel)
- 検索機能(複数ワード対応)
- 通知機能
  - コメント通知
  - フォロー通知
  - いいね通知
- リアルタイム DM 機能（ActionCable）
  - 未読件数表示機能
  - 既読表示機能
- カレンダー機能(SimpleCalendar ※モバイルの場合、表として表示)
  - 予定追加機能
- レスポンシブ対応

# DB 設計

![er_soccer_app](https://user-images.githubusercontent.com/81346474/117126305-8bcc6680-add5-11eb-8d7e-52ce81d2ab46.png)
<img width="1400" alt="スクリーンショット 2020-05-07 0 06 18" src="https://user-images.githubusercontent.com/81346474/117126305-8bcc6680-add5-11eb-8d7e-52ce81d2ab46.png">

# テスト

- RSpec
  - 単体テスト(model)
  - 機能テスト(request)
  - 統合テスト(system)
## 開発環境構築

### 準備

1. dockerをインストールする  
   https://docs.docker.com/get-docker/
1. build docker image  
   `docker-compose build`
1. create database  
   `docker-compose run --rm web rails db:create`

### サーバーの起動
`docker-compose up`

### db migration
`docker-compose run --rm web rails db:migrate RAILS_ENV=development`
