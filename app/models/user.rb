class User < ActiveRecord::Base
  has_many :answers, :questions, :comments, :votes
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+[.]\w+\z/, message: "is not a valid format." }
  validates :password, length: { minimum: 6 }
end
