# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Statusの選択肢
  # Status.create!(status: '出社')
  # Status.create!(status: 'リモート')
  # Status.create!(status: '会社都合休業')
  # Status.create!(status: '年休他')

# 複数人の user を作る
# 参考:https://qiita.com/takehanKosuke/items/79a66751fe95010ea5ee
  # 5.times do |n|
  #   user = User.new(
  #     email: "testman#{n+1}@test.com",
  #     password: "testman#{n+1}",
  #     password_confirmation: "testman#{n+1}",
  #     idnum: "#{n+1}",
  #     dep: "営業#{n+1}部"
  #   )
  #   user.save
  # end

  # dep_namesの選択肢
    # DepName.create!(dep: '企画管理部')
    # DepName.create!(dep: 'グローバルセキュリティーGr')
    # DepName.create!(dep: '官民連携部')
    # DepName.create!(dep: 'グローバル戦略部')
    # DepName.create!(dep: '総合営業部')
