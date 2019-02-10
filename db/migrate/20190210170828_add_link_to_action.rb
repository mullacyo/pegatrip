class AddLinkToAction < ActiveRecord::Migration[5.2]
  def change
  	add_column :actions, :link, :string
  end
end
