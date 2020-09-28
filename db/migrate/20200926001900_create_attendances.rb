class CreateAttendances < ActiveRecord::Migration[5.2]
  def up
    create_table :attendances do |t|
      t.integer :user_id, null: false
      t.string :work_type_cd, limit: 16
      t.date :work_date, null: false
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :break_time
      t.string :note, limit: 255
    end

    add_index :attendances, :user_id, unique: false
  end
  def down
    drop_table :attendances
  end
end
