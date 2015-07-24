class User < ActiveRecord::Base

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
