class ChangeWorkschedulesColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :workschedules, :body_temp_am, :float
    add_column :workschedules, :body_temp_pm, :float 
  end
end
