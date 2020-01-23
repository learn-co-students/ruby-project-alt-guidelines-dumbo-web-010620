class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :amount
      t.integer :art_dealer_id
      t.integer :work_of_gif_id

      t.timestamps
    end
  end
end
