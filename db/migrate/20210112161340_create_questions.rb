class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.belongs_to :test, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
