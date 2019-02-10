class ChangePicturesToString < ActiveRecord::Migration[5.2]
  def change
  	remove_column :actions, :pictures
    add_column :actions, :picture, :string
  end
end
