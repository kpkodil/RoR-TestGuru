class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :title
      t.boolean :correct

      t.timestamps
    end
    change_column_null(:answers, :title, false)
  end
end
