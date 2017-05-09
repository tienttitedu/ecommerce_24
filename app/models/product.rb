class Product < ApplicationRecord

  belongs_to :category

  has_many :order_items
  has_many :reviews

  mount_uploader :image, PictureUploader, mount_on: :image

  delegate :name, to: :category, prefix: true, allow_nil: true

  validates :category_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.name_maximum}
  validates :description, presence: true, length: {maximum: Settings.des_max}
  validates :price, presence: true, numericality: {only_float: true}
  validates :quantity, presence: true
  validate  :picture_size

  scope :by_newest, -> { order(created_at: :desc) }

  scope :by_asc, -> {order name: :asc}

  scope :by_desc, -> {order name: :desc}

  scope :search, ->(search) do
    where "name LIKE ?", "%#{search}%"
  end

  scope :by_category, ->(category_id) do
    where(category_id: category_id)
  end

  private

  def picture_size
    if image.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
