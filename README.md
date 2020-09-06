# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.7.0
* System dependencies
  -
* Configuration
  -
* Database creation

* Database initialization

* How to run the test suite

* Debug
  bundle exec rdebug-ide --host 127.0.0.1 --port 1234 --dispatcher-port 26162 -- bin/rails s

#初期構築
##1 gemファイル作成
```
$ mkdir ~/[プロジェクト名]
$ cd ~/[プロジェクト名]   // ここにgemfile追加
```
##2 node.jsインストール
- https://nodejs.org/en/download/  
    zipファイルからダウンロードする場合は、展開後、path通して。
    ```
    $ node -v   //インストールチェック
    $ npm -v   //インストールチェック
    ```
##3 yarnインストール
- cmdを再度開いて、以下コマンドを実行  
    ```
    $ npm install -g yarn  
    $ yarn -v ->インストールチェック
    ```  
##4 bundleインストール
- (非推奨)~~$ bundle install --path vendor/bundle~~
    ```
    $ bundle config set path 'vendor/bundle'
    $ bundle binstubs --path=vendor/bin  
    $ bundle install
    // 上記コマンド実行後はプロジェクトは以下でbundle [ exec | install | ... ]が省略できる。
    ```
##5 webpackerインストール
```
$ bundle exec rails install:webpacker
$ bundle exec rails webpacker:install:vue
```
##6 railsプロジェクト作成
`$ bundle exec rails new . -d mysql --skip-turbolinks --skip-test`
##7 jQuery & BootStrap導入
- https://qiita.com/kazutosato/items/d47b7705ee545de4cb1a
##8 DBインストール
- 必要なDBをインストール
プロジェクト作成後に以下を実行  
`rails db:create`
###8.1 mongoDBインストール
- 詳細手順 -> https://qiita.com/yoh-nak/items/f0c429f10347ae7ec98b
`mkdir C:\mongodb\data C:\mongodb\logs`  
パス通す -> C:\mongodb\bin  
`mongod --dbpath c:\mongodb\data --logpath c:\mongodb\logs\mongodb.log`
####mongoidコマンド
create_database
```
$ rails destroy scaffold [モデル名]
$ bundle exec rails g scaffold [モデル名] [カラム名:型名 カラム名:型名...] --timestamps
```
###8.2 sqlite3
- 以下windowsダウンロードリンク  
    https://www.sqlite.org/download.html
    - [32bit版](https://www.sqlite.org/2020/sqlite-dll-win32-x86-3320300.zip)  
    - [64bit版](https://www.sqlite.org/2020/sqlite-dll-win64-x64-3320300.zip)  
    - [共通インストールツール](https://www.sqlite.org/2020/sqlite-tools-win32-x86-3320300.zip)
 - インストールが終わったらzip内のファイルをC:\sqlite3\に移動してpath通す
###8.3 mysql
 - 普通にインストールするとruby2.7に対応していないためここを参照
 https://github.com/brianmario/mysql2#windows
 （簡単に言うとlibmysql.dllのパスが見つかんないからvender/bundle/libmysql.dllにコピーしてって感じ）
##9 debug
- bundle exec rdebug-ide --host 127.0.0.1 --port 3000 --dispatcher-port 26162 -- bin/rails s -p 3000
##10 normal
bundle exec rails s
* node
- .\node_modules\.bin\webpack
- .\node_modules\.bin\yarn
##11 Administrate
gem 'administrate', '0.12.0'  
`$ bundle exec rails generate administrate:install`  
`$ bundle exec rails generate administrate:dashboard Model名`  
yarn add flatpickr