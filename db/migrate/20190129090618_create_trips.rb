class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
    	t.timestamps null: false

    	t.string :location, null: false
    	t.datetime :start_date
    	t.datetime :end_date
    end

  	add_column :trips, :user_id, :integer
  	add_foreign_key :trips, :users
  end
end
