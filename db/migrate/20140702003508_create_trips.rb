class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :description
      t.string :json
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
