class Test < ApplicationRecord
  def self.desc_sorted_with_category(category_title)
    self.joins("JOIN categories ON categories.id = tests.category_id").where("categories.title = ?", category_title)
  end
end
