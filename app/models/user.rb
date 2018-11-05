class User < ApplicationRecord
  USERNAME_PATTERN = /\A[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*\z/

  has_secure_password

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 5 }, if: :name_changed?
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  before_validation :create_user_name

  def create_user_name

    email_user_name = self.email.split("@").first.tr(".", "_")

    self.name = valid_user_name?(email_user_name) ? email_user_name : random_user_name
  end

  private

  def random_user_name
    "u#{Time.zone.now.to_i}"
  end

  def valid_user_name?(user_name)
    USERNAME_PATTERN.match(user_name) && User.where("lower(name) = ?", user_name.downcase).blank?
  end
end
