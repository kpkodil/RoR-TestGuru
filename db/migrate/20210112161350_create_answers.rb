class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      #t.references :answers, :question#, foreign_key: true  
      t.references :question
      t.string :title, null: false
      t.boolean :correct

      t.timestamps
    end
  end
end
