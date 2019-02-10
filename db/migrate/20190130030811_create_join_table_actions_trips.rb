class CreateJoinTableActionsTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :actions_trips do |t|
      t.belongs_to :action, foreign_key: true
      t.belongs_to :trip, foreign_key: true

      t.timestamps
    end
  end
end
