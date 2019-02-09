class AddCostToCourses < ActiveRecord::Migration[5.2]
  def change
  	add_column :courses, :cost, :integer
  end
end
