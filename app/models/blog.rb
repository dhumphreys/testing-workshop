class Blog < ActiveRecord::Base
  belongs_to :user

  validates :title, :body, presence: true
end
