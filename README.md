# アプリケーション名
家bar (house_bar)

# アプリケーション概要
インスタグラム + カクテル
- 自分で作成したカクテルを写真をつけて投稿できる
- 投稿されているカクテルを検索できる

# URL
https://house-bar.onrender.com

# テスト用アカウント
- Basic認証パスワード : 2222
- Basic認証ID : admin
- メールアドレス : test@test
- パスワード : qwe123

# 利用方法

## ユーザー管理機能

### ユーザー新規登録
1. トップページから新規登録ボタンを押す。
2. 必要事項を入力し、新規登録を押す。
3. トップページからユーザー編集を押す。
4. プロフィールを編集する。

### ログイン
1. トップページからLoginボタンを押す。
2. 必要事項を記入して、ログインを押す。

## カクテル投稿機能

### カクテル投稿
1. ログインする。
2. トップページの右下の作成するボタンを押す。
3. 必要事項を入力、SENDボタンを押すと投稿できる。

### カクテル編集
1. 投稿したカクテルの画像を押す。
(ユーザー詳細ページ、カクテル検索ページ、トップページなど)
2. 編集ボタンを押す。
3. 必要情報を入力して更新する。

### カクテル削除
1. 投稿したカクテルの画像を押す。
(ユーザー詳細ページ、カクテル検索ページ、トップページなど)
2. 削除ボタンを押す。

## カクテル検索機能

### ベース検索(未ログインでも使用可)
1. トップページの「ベースで検索」を押す。
2. モーダルウィンドウのプルダウンメニューからベースを選択して、Searchボタンを押す。

### 割り材料検索(未ログインでも使用可)
1. トップページの「割り材料で検索」を押す。
2. モーダルウィンドウの空欄に材料の名前を入力し、Searchボタンを押す。

### フォロー検索
- フォローする
1. カクテル,プロフィールにフォローするボタンがあるので押す。
2. フォロー中になったら完了です。

- 検索する
1. トップページの「フォローで検索」を押す。
2. 自分がフォローしているユーザーが表示されるので、ユーザーを押す。
3. ユーザー詳細ページに遷移するので、投稿したカクテルから探す。

### お気に入り検索
- お気に入りする
1. カクテル詳細ページに「お気に入りする」ボタンがあるので押す。
2. 「お気に入り済」になったら完了です。

- 検索する
1. トップページの「お気に入り」を押す。
2. 自分がお気に入りしているカクテルが表示される。

# アプリケーションを作成した背景
お酒が好きでプログラミングスキルのアウトプットの場として作成しました。

お酒が好きなチームメンバーにカクテルについてお伺いしたところ、あまり関心がないことが判明した。
原因を分析したところ、「カクテルに触れるきっかけ」が無いのだと仮説をたてました。
そこで、「インスタグラム + カクテル検索」をかけ合わせたアプリを開発することにしました。

- 受動的 : 検索機能
検索するきっかけを持ってもらうため、複数の検索機能を持たせる。
好きなお酒や、好みが似ている人、好きなノンアルコールで検索できるようにする。
- 能動的,創作的 : 投稿機能
カクテルの創作はハードルが高いイメージがあるので、自分のオリジナルカクテルを作成して写真と共に投稿してもらう形式にする。

# 洗い出した要件

# 実装した機能について(学習内容)
- ActiveHashで検索
- 好きな文字列で検索
- お気に入り機能
- フォロー機能
- エラーメッセージの日本語化
- カクテル投稿(ActiveStorage)
- ユーザー管理機能(Devise)

- ボタンの非同期処理(CSS) ※jajaaan!
- 画像の非同期処理(JavaScript)
- 画像のグラデーション(CSS gradient)
- GoogleFont
- ロゴの作成 ※Canva

- Renderでのデプロイ
- AWS S3で画像のリンク切れ対処

# 実装予定の機能
- カクテル表示数の制限変更(現在は4)
- カクテル表示の際に、スクロールバーを実装

# データベース設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| bio                | text   | null: false               |
※アイコン画像はActiveStorageで追加（任意）

### Association

- has_many :cocktails
- has_many :Likes

- follow
has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
has_many :followings, through: :active_relationships, source: :follower
has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
has_many :followers, through: :passive_relationships, source: :following

## cocktails テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| description | text       |                                |
| alcohol_id  | integer    | null: false                    |
| type_id     | integer    | null: false                    |
| ingredient  | text       |                                |
| tool        | text       |                                |
| recipe      | text       |                                |
| user        | references | null: false, foreign_key: true |
| like        | references | null: false, foreign_key: true |
※カクテル画像はActiveStorageで追加（任意）

### Association

- belongs_to :user
- has_many :likes

- belongs_to :alcohol ※ActiveHash
- belongs_to :type ※ActiveHash

## likes テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| cocktail | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :cocktail

## relationships テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| following | references | null: false, foreign_key: true |
| follower  | references | null: false, foreign_key: true |

### Association

- follow
belongs_to :following, class_name: "User"
belongs_to :follower, class_name: "User"

# 画面遷移図

# 開発環境
Ruby,RubyOnRails,JavaScript,CSS,HTML,MySQL,Render(PosgreSQL),AWS(S3)

# 工夫したポイント
- 投稿機能 : 
画像と共に投稿できるようにActiveStrageを実装した。

- 検索機能 : 
カクテルに興味を持ってもらうきっかけを持ってもらう為、検索方法を増やした。
ベース、材料、フォロー、お気に入りでの検索機能を実装。

# 改善点
- 画面の大きさによって可読性に欠ける
- 画像付きのユーザー登録の際に、新規登録して編集しないといけない
- インスタグラムみたいに華やかなフロントではない
- JavaScriptの発火条件の修正（Roadだけでは足りない）

# 制作時間
約2週間 (適宜 追加実装)