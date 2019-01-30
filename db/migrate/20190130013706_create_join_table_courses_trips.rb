class CreateJoinTableCoursesTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_trips do |t|
      t.timestamps null: false

      t.belongs_to :course, foreign_key: true
      t.belongs_to :trip, foreign_key: true
    end
  end
end
