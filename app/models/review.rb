class Review < ApplicationRecord

  belongs_to :user
  belongs_to :product

  delegate :name, to: :user, prefix: true

  validates :content, presence: true, length: {maximum: Settings.content_max}
  validates :user_id, presence: true
  validates :product_id, presence: true

  scope :reviews_newest, ->{order created_at: :desc}

end
