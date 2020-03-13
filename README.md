# README


## Application Name
    Memo Space

## Overview ##
    In this application, text and images can be recorded and linked to multiple tags for management.
    By performing a search using AND conditions with multiple tags, you can easily find desired memo from a large number of memos.

## Functions ##
    This application has following functions.
  * Posting memos.
  * Listing memos posted by user.
  * Display detail view of posted memo.
  * Register user.
  * Login as registered user.
  * Controlling transaction.
  * Uploading images.

## Technical elements ##
  * Carrierwave gem for uploading images.
  * Devise gem for user management.
  * Heroku as deploy environment.
  * MySQL as database on developping envoronment.
  * Postgresql on production environment.
  * Relation between Tag and Memo are many to many.

## Database Design -

###  users table

* Table Definition
  |Column|Type|Options|
  |------|----|-------|
  |email|string|null: false|
  |password|string|null: false|
  |name|string|null: false, index: true|

* Association
  has_many :memos
  has_many :tags

###   memos table

* Table Definition
  |Column|Type|Options|
  |------|----|-------|
  |title|string|null: false|
  |text|string||
  |image|string||
  |user|references|null: false, foreign_key: true|
  |tag|references|null: false, foreign_key: true|
* Association
  has_many :tag_memos
  has_many :tags, through: tag_memos
  belongs_to :user

###   tags table

* Table Definition
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false, index: true|
  |user|references|null: false, foreign_key: true|
* Association
  has_many :tag_memos
  has_many :memos, through: tag_memos
  belongs_to :user

###   tag_memos table

* Table Definition
  |Column|Type|Options|
  |------|----|-------|
  |memo|references|null: false, foreign_key: true|
  |tag|references|null: false, foreign_key: true|

* Association
  belongs_to :memo
  belongs_to :tag