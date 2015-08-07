class User < ActiveRecord::Base
  ROLES = %w(user admin)

  has_many :blogs

  validates :username, :password, :role, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 8 }, confirmation: true
  validates :first_name, :last_name, presence: true, unless: :admin?
  validates :role, inclusion: { in: ROLES }

  scope :admins, -> { where(role: 'admin') }
  scope :users, -> { where(role: 'user') }

  def self.user_limit
    100000
  end

  def admin?
    role == 'admin'
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
