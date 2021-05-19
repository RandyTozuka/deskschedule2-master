class Workschedule < ApplicationRecord
  belongs_to :user
  belongs_to :status
  default_scope -> {order(wdate: :asc)}

  scope :ws_thismonth, -> { where(wdate: Date.today.all_month) }#all_month メソッドで今月としての範囲を取得
  scope :ws_lastmonth, -> { where(wdate: Date.today.last_month.all_month) }
  scope :ws_nextmonth, -> { where(wdate: Date.today.next_month.all_month) }
  scope :dobcc,        -> { where(status_id:3) }# dobcc : day off by company circumstances(会社都合休業)
  scope :in_the_office,-> { where(status_id:1) }# "出社"を抽出

end
