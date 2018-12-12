class Post < ApplicationRecord

       belongs_to :topic
       belongs_to :user
    has_many :comments, dependent: :destroy
    # #4
   has_many :votes, dependent: :destroy

   after_create :create_vote


      default_scope { order('rank DESC') }
scope :ordered_by_title, -> { order('title DESC') }
scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
    validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true


   def up_votes
 # #9
     votes.where(value: 1).count
   end

   def down_votes
 # #10
     votes.where(value: -1).count
   end

   def points
 # #11
     votes.sum(:value)
   end


   def update_rank
       age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
       new_rank = points + age_in_days
       update_attribute(:rank, new_rank)
     end


def create_vote
  user.votes.create(value: 1, post: self)
end





end

##The has_many method allows a post instance to have many comments related to
## it, and also provides methods that allow us to retrieve comments that belong to a post.

# At #4, we add the votes association to Post. This relates the models and allows us to call post.votes.
# We also add dependent: :destroy to ensure that votes are destroyed when their parent post is deleted.

# Remember that votes in the above code is an implied self.votes.
#
# # At #9, we find the up votes for a post by passing value: 1 to where. This fetches a collection
# of votes with a value of 1. We then call count on the collection to get a total of all up votes.
# #
# # At #10, we find the down votes for a post by passing value: -1 to where.  where(value: -1)
# fetches only the votes with a value of -1. We then call count on the collection to get a total of all up votes.
# #
# # At #11, we use ActiveRecord's sum method to add the value of all the given post's votes.
#  Passing :value to sum tells it what attribute to sum in the collection.
