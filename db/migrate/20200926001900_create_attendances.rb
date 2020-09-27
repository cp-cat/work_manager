class CreateAttendances < ActiveRecord::Migration[5.2]
  def up
    create_table :attendances do |t|
      t.integer :user_id, null: false
      t.integer :work_type_id
      t.date :work_date, null: false
      t.string :start_time
      t.string :end_time
      t.string :break_time
      t.string :note
    end

    add_index :attendances, :user_id, unique: false
  end
  def down
    drop_table :attendances
  end
end
