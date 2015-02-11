class AchievementsStudents < ActiveRecord::Migration
  def change
    create_table :students_achievements, id: false do |a|
      a.references :student
      a.references :achievement
    end
  end
end
