class User < ApplicationRecord
  USERNAME_PATTERN = /\A[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*\z/

  has_secure_password

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 5 }, if: :name_changed?
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  before_validation :create_user_name

  attr_accessor :reset_token

  def create_user_name
    return if self.name.present?

    email_user_name = self.email.split("@").first.tr(".", "_")

    self.name = valid_user_name?(email_user_name) ? email_user_name : random_user_name
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self.id).deliver_now
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(reset_token)
    BCrypt::Password.new(reset_digest).is_password?(reset_token)
  end

  def password_reset_expired?
    reset_sent_at < 6.hours.ago
  end

  private

  def random_user_name
    "u#{Time.zone.now.to_i}"
  end

  def valid_user_name?(user_name)
    USERNAME_PATTERN.match(user_name) && User.where("lower(name) = ?", user_name.downcase).blank?
  end
end
