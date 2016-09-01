class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :body, presence: true, length: { minimum: 2 }

  def best_answer_finder
    Answer.find_by(question_id: self.question.id, best_answer: true)
  end

  # add validation of only one best answer per question?

end
