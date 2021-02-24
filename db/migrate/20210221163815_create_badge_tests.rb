class CreateBadgeTests < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_tests do |t|
      t.references :badge, null: false
      t.references :test,  null: false

      t.timestamps
    end
  end
end
