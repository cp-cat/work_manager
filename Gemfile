source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# search gem -> https://www.ruby-toolbox.com/
ruby '2.6.6'

gem 'rails', '5.2.3'

# DB
gem 'mysql2'

# front
gem 'bootsnap', '>= 1.4.2', require: false
gem 'sass-rails'
gem 'slim-rails'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'devise-bootstrap-views', '~> 1.0'
#sprockets4 with a babel processor
gem 'babel-transpiler'
# 認証
gem 'devise'
gem 'devise-i18n'
# 管理画面
# gem 'activeadmin'
# ページネート
gem 'kaminari'
gem 'ransack'
# 画像アップロード
gem 'refile'
# PDF
gem 'wicked_pdf'
# Excel
gem 'rubyXL'
# コメント補助
gem 'annotate'

gem 'nokogiri'#, '~> 1.11.0.rc1'

###########

gem 'puma', '~> 4.1'
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

##########

group :development, :test do
  # メール（localhost:1080）
  # gem 'mailcatcher'
  gem "letter_opener"
  # エラー表示
  gem 'better_errors'
  gem 'debase'
  gem 'html2slim'
  gem 'ruby-debug-ide'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
