# 本アプリについて

公開先URL：http://52.198.83.48

### 本アプリの概要
コンセプトは「サッカーの選手採点共有サイト」です。私はサッカーの試合観戦や情報収集が好きです。特に選手採点という形式の記事を見るのが好きなのですが、それをサッカー好きと共有できるサイトがあったら楽しいなと考え、作成しました。

## 機能一覧ならびに使用技術
### フロントエンド
- Haml/Sassでマークアップ
- materialize-sassを使ってデザイン

### サーバーサイド
- Ruby/Ruby on Railsを使用
- ユーザー登録機能（devise）
- ユーザー画像登録機能（carrierwave）
- 試合レビュー投稿機能
- ページネーション機能（kaminari）
- 管理者機能（rails_admin）
- 自動スクレイピング機能（mechanize,whenever）
- 単体テスト（RSpec）
- 統合テスト

### インフラ
- AWS EC2サーバー
- Amazon S3にユーザー画像を保存
- capistranoによる自動デプロイ設定

## 今後改善していきたい機能について
### フロントエンド
メディアクエリを使用してレスポンシブ化
### サーバーサイド
game_memberとplayer_reviewを紐づける。

## 参考画像
![スクリーンショット 2019-09-30 17 49 56-min](https://user-images.githubusercontent.com/52983810/65863496-2f0ffb00-e3ab-11e9-81ec-2bbef3e13563.png)
![スクリーンショット 2019-09-30 17 50 16-min](https://user-images.githubusercontent.com/52983810/65863529-42bb6180-e3ab-11e9-92af-36467dd35eb6.png)