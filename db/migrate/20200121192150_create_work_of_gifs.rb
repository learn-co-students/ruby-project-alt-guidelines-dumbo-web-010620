class CreateWorkOfGifs < ActiveRecord::Migration[5.2]
  def change
    create_table :work_of_gifs do |t|
      t.string :name

      t.timestamps
    end
  end
end
