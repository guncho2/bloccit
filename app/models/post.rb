class Post < ApplicationRecord

       belongs_to :topic
    has_many :comments, dependent: :destroy

end

##The has_many method allows a post instance to have many comments related to
## it, and also provides methods that allow us to retrieve comments that belong to a post.
