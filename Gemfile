source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
# gem 'sass-rails', '>= 6'
gem 'sassc'
gem 'webpacker', '~> 4.0'
# jQueryとの喧嘩を避けるためturbolinksを無効化する application.js も参照
# gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

#----------後付けGems--------------------------------------------------------
#devise
gem 'devise'
#"sass-rails"はデフォルトでインストール済み
gem "bootstrap-sass", "~>3.3.6"

# Rails5以前の導入方法ではjquery-railsというGemをインストールするのが基本線だったが、
# Webpackerで管理する際はyarnコマンドを使用してインストール。この手法を使うため
# 下記2つのgemはuninstallした。
# gem "jquery-rails"
# gem "jquery-ui-rails"

# pry
gem 'pry-rails'
# kaminari(pagenation)
gem 'kaminari'
#  axlsx_rails 参考：https://qiita.com/necojackarc/items/0dbd672b2888c30c5a38#gemfile
gem 'rubyzip', '>= 1.2.1'
gem 'axlsx', git: 'https://github.com/randym/axlsx.git', ref: 'c8ac844'
gem 'axlsx_rails'
# business_time 参考:https://qiita.com/hituziando/items/2bf6dbb29280efb4ad1c
gem 'business_time'

gem 'hirb'          # 出力結果を表として出力するgem
gem 'hirb-unicode'  # マルチバイト文字の表示を補正するgem
#------------------------------------------------------------------

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
