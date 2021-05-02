class CreateDepNames < ActiveRecord::Migration[6.0]
  def change
    create_table :dep_names do |t|
      t.string :dep

      t.timestamps
    end
  end
end
