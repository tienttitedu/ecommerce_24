class User < ApplicationRecord

  has_many :order
  has_many :review
  has_many :suggest_product

  enum role: {user: Settings.user, admin: Settings.admin}

  validates :name, presence: true, length: {maximum: Settings.name_maximum}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email_maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :address, presence: true
  validates :password, presence: true,
    length: {minimum: Settings.password_minimum}, allow_nil: true

  has_secure_password

  scope :list_users_desc, -> {order(created_at: :desc)}

  before_save  :downcase_email

  def User.digest string
    if cost = ActiveModel::SecurePassword.min_cost
      BCrypt::Engine::MIN_COST
    else
      BCrypt::Engine.cost
    end
    BCrypt::Password.create string, cost: cost
  end

  private

  def downcase_email
    self.email = email.downcase
  end

end
