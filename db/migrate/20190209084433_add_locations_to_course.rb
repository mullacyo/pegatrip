class AddLocationsToCourse < ActiveRecord::Migration[5.2]
  def change
  	remove_column :courses, :location
    add_column :courses, :locations, :text, array: true, default: []
  end
end
