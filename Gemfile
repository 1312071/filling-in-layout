source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.2"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootstrap-sass"
gem "bcrypt", "3.1.11"
gem "config"
gem "i18n"
gem "faker", "1.6.6"
gem "will_paginate"
gem "bootstrap-will_paginate"
gem "carrierwave"
gem "mini_magick"
gem "fog"
gem "i18n-js"

group :development, :test do
  gem "byebug", platform: :mri
  gem "minitest"
  gem "minitest-reporters"
  gem "guard"
  gem "guard-minitest"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
