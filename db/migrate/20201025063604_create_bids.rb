class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.integer :price
      t.integer :user_id
      t.integer :artwork_id

      t.timestamps
    end
  end
end
