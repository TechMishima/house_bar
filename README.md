# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| bar                | string | null: false               |
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
| base_id     | integer    | null: false                    |
| type_id     | integer    | null: false                    |
| Ingredient  | text       |                                |
| tool        | text       |                                |
| recipe      | text       |                                |
| user        | references | null: false, foreign_key: true |
※カクテル画像はActiveStorageで追加（任意）

### Association

- belongs_to :user
- has_many :likes

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