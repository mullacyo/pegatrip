class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
    	t.timestamps null: false

    	t.string :type, null: false
    	t.string :title, null: false
    	t.string :description, null: false
    	t.string :location, null: false
    	t.datetime :duration
    	t.integer :intensity
    	t.integer :price
    	t.json :pictures
    end
  end
end
