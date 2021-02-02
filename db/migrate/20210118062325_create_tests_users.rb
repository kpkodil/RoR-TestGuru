class CreateTestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_users do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
    end
  end
end
