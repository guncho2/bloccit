class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_post

   validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }, presence: true

   private

     def update_post
       post.update_rank
     end


end
# The inclusion validation ensures that value is assigned either a -1 or 1.
# The after_save method will run update_post every time a vote is saved.
#  The  update_post method wishfully calls a method named update_rank on a vote's  post object.
