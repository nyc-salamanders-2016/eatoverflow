class User < ActiveRecord::Base
  has_many :answers, :questions, :comments, :votes
end
