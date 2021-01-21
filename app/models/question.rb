class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy  
end
