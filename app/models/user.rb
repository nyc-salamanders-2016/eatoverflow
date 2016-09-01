class User < ActiveRecord::Base
  has_many :answers
  has_many :questions
  has_many :comments
  has_many :votes

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+[.]\w+\z/, message: "is not a valid format." }
  validates :password, length: { minimum: 6 }

  def sort_likes(array)
    @liked_posts = [].reverse
    array.each do |vote|
      if vote.voteable_type == "Question"
        question = Question.find(vote.voteable_id)
        @liked_posts << question
      elsif vote.voteable_type == "Answer"
        question = Answer.find(vote.voteable_id).question
        @liked_posts << question
      end
    end
    @liked_posts
  end

end
