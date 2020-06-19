# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Users table
| Column        | Type    | Options                   |
| ------------- | ------- | ------------------------- |
| nickname      | string  | null: false, unique: true |
| email         | string  | null: false, unique: true |
| password      | string  | null: false, default: ""  |
| birthday      | date    | null: false               |
| prefecture_id | integer | null: false               |
| bike_name     | string  |                           |
| avatar_image  | string  |                           |
| bike_image    | string  |                           |
### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to_active_hash :prefecture


## posts table
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| title         | string     | null: false       |
| text          | text       | null: false       |
| user          | references | foreign_key: true |
### Association
- belongs_to :user
- has_many   :images, dependent: :destroy
- has_many   :comments, dependent: :destroy
- has_many   :tags, through: :post_tags
- has_many   :post_tags, dependent: :destroy


## Images table
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| image         | string     | null: false       |
| post          | references | foreign_key: true |
### Association
- belongs_to :post


## comments table
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| comment       | text       | null: false       |
| user          | references | foreign_key: true |
| post          | references | foreign_key: true |
### Association
- belongs_to :user
- belongs_to :post


## tags table
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| tag           | string     |                   |
| post          | references | foreign_key: true |
### Association
- has_many :posts, through: :post_tags
- has_many :post_tags, dependent: :destroy


## post_tags table
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post          | references | foreign_key: true |
| tag           | references | foreign_key: true |
### Association
- belongs_to :post
- belongs_to :tag