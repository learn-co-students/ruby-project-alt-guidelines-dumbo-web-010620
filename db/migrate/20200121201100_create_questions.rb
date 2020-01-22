class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :inquiry
      t.string :answer
    end
  end
end
