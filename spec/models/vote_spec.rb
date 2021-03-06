require 'rails_helper'

RSpec.describe Vote, type: :model do


  # let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  #  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  #  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:topic) { create(:topic) }
     let(:user) { create(:user) }
     let(:post) { create(:post) }
     

   let(:vote) { Vote.create!(value: 1, post: post, user: user) }

 # #1
   it { is_expected.to belong_to(:post) }
   it { is_expected.to belong_to(:user) }
 # #2
   it { is_expected.to validate_presence_of(:value) }
 # #3
   it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }

   describe "update_post callback" do
        it "triggers update_post on save" do
    # #26
          expect(vote).to receive(:update_post).at_least(:once)
          vote.save!
        end

        it "#update_post should call update_rank on post " do
    # #27
          expect(post).to receive(:update_rank).at_least(:once)
          vote.save!
        end
      end

end




# At #1, we test that votes belong to posts and users.
#
# At #2, we test that value is present when votes are created.
#
# At #3, we validate that value is either -1 (a down vote) or 1 (an up vote).

# At #26, we expect update_post_rank to be called on vote after it's saved.
#
# At #27, we expect that the vote's post will receive a call to update_rank
