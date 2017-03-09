class Category < ApplicationRecord

  belongs_to :parent, class_name: Category.name

  has_many :children, class_name: Category.name, foreign_key: :parent_id
  has_many :product

end
