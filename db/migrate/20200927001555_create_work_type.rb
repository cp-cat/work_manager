class CreateWorkType < ActiveRecord::Migration[5.2]
  def up
    create_table :work_types do |t|
      t.string :cd, null: false, limit: 16
      t.string :name, null: false
    end
  end
  def down
    drop_table :work_types
  end
end
