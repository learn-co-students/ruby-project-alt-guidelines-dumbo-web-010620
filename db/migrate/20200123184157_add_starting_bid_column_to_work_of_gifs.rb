class AddStartingBidColumnToWorkOfGifs < ActiveRecord::Migration[5.2]
  def change
      add_column :work_of_gifs, :starting_bid, :integer
  end
end
