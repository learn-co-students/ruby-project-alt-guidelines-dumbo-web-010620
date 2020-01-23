class AddAvailableColumnToWorkOfGifs < ActiveRecord::Migration[5.2]
  def change
    add_column :work_of_gifs, :available, :boolean
  end
end
