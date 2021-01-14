class Test < ApplicationRecord
  def self.desc_sorted_with_category(category_title)
    id_of_required_category = Category.where(title: category_title)
    self.where(category_id: id_of_required_category).order(id: :desc).pluck(:title)
  end
end
