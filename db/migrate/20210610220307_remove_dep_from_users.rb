class RemoveDepFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :dep, :string
  end
end
