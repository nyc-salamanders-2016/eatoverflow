class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  # validates :user, uniqueness: { scope: :voteable, message: "you can only vote once." } 

  def authenticate_vote(user_id, item_id)
    # user = User.find(self.user_id)
    !!user.votes.find_by(voteable_id: item_id )
  end
end
