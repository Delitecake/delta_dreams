class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  validates :username, presence: true,
    uniqueness: { case_sensitive: true },
    format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :terms_of_service, acceptance: true

  def admin
    true
  end

  def to_s
    username
  end
end
