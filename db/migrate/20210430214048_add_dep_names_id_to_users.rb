class AddDepNamesIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :dep_name, foreign_key: true
  end
end
