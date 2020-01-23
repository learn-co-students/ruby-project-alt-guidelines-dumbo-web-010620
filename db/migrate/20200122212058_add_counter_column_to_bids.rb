class AddCounterColumnToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :counter, :integer
  end
end
