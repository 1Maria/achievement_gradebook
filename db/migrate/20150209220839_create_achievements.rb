class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :achievement_name
      t.date :date
      t.integer :score
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
