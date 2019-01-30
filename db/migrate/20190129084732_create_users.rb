class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false

      t.string :email, null: false
      t.string :first_name, :string
      t.string :last_name, :string
      t.string :avatar, :string
      t.string :interest, :string
     
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end 