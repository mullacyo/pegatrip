class CreateJoinTableActionsTrips < ActiveRecord::Migration[5.2]
  def change
    create_join_table :actions, :trips, table_name: :actions_trips do |t|
      t.index [:action_id, :trip_id]
      t.index [:trip_id, :action_id]

      t.timestamps
    end
  end
end
