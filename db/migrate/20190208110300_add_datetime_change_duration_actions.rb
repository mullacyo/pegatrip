class AddDatetimeChangeDurationActions < ActiveRecord::Migration[5.2]
  def change
  	change_column :actions, :duration, :string
  	add_column :actions, :time, :datetime


  end 

end 