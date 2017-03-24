class Category < ApplicationRecord

  belongs_to :parent, class_name: Category.name, required: false

  has_many :children, class_name: Category.name, foreign_key: :parent_id,
    dependent: :destroy
  has_many :products

  scope :find_originals, -> {where(parent_id: nil)}

end
