class Category < ApplicationRecord

  belongs_to :parent, class_name: Category.name, required: false

  has_many :children, class_name: Category.name, foreign_key: :parent_id,
    dependent: :destroy
  has_many :products, dependent: :destroy

  scope :find_originals, -> {where(parent_id: nil)}

  parent_list = Category.where.not(parent: nil).select(:parent_id).distinct

  scope :find_last_children, -> {where("id NOT IN (?)", parent_list)}

end
