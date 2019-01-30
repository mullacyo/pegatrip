class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|

      t.timestamps null: false
  	  t.string :title, null: false
	  t.string :description, null: false
	  t.string :location, null: false
	  t.json :pictures
      t.string :type, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :duration
      t.string :link

    end
  end
end
