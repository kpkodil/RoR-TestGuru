class CreateTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :current_question
      t.integer :correct_questions, default: 0
      t.boolean :successful, default: false
      t.timestamps
    end
  end
end
