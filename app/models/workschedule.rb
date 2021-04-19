class Workschedule < ApplicationRecord
  belongs_to :user
  belongs_to :status
  default_scope -> {order(wdate: :asc)}


  scope :ws_thismonth -> { where(wdate: Date.today.all_month) }#all_month メソッドで今月としての範囲を取得
end
