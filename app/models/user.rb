class User < ActiveRecord::Base
  has_many :answers
  has_many :questions
  has_many :comments
  has_many :votes

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+[.]\w+\z/, message: "is not a valid format." }
  validates :password, length: { minimum: 6 }
end
