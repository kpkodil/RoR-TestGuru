class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title

      t.timestamps
    end
    change_column_null(:questions, :title, false)
  end
end
