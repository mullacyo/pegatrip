class CreateJoinTableActionsTrips < ActiveRecord::Migration[5.2]
  def change
    create_join_table :actions, :trips, table_name: :actions_trips do |t|
      t.belongs_to :action, foreign_key: true
      t.belongs_to :trip, foreign_key: true

      t.timestamps
    end
  end
end
