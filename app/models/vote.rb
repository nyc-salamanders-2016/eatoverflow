class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validate  :can_vote
  
  def can_vote
    if already_voted(self.user, self.voteable_id, self.voteable_type)
      errors.add(:already_voted, "")
    end
  end

  def already_voted(user, item_id, type)
    # user = User.find(self.user_id)
    !!user.votes.find_by(voteable_id: item_id, voteable_type: type )
  end
end
