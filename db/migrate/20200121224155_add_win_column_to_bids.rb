class AddWinColumnToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :win, :boolean
  end
end
