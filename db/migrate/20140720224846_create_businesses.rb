class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :yelp_id
      t.string :name
      t.bytea :image
      t.string :display_phone
      t.integer :review_count
      t.bytea :rating_img
      t.string :snippet_text
      t.string :location_address
      t.string :location_city
      t.string :location_state
      t.string :location_postal

      t.timestamps
    end
  end
end
