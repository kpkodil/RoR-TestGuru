class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      #t.references :tests, :category#, foreign_key: true
      #t.references :question
      t.references :user
      t.references :category
      t.string :title, null: false 
      t.integer :level, default: 0
      t.string :test_category, null: false

      t.timestamps
    end
    # change_column_default(:tests, :level, from: nil, to: 0)
  end
end
