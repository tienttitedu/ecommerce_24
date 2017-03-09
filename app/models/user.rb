class User < ApplicationRecord

  has_many :order
  has_many :review
  has_many :suggest_product

  enum status: {admin: 0,user: 1,guest: 2}

end
