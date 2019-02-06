class AddApiRefToAction < ActiveRecord::Migration[5.2]
  def change
  	add_column :actions, :api_reference, :string
  	add_column :actions, :api_source, :string
  end
end
