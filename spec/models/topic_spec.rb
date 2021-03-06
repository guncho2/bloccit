require 'rails_helper'

RSpec.describe Topic, type: :model do
  # let(:name) { RandomData.random_sentence }
  # let(:description) { RandomData.random_paragraph }
  let(:public) { true }
  # let(:topic) { Topic.create!(name: name, description: description) }
  let(:topic) { create(:topic) }


let(:post) { topic.posts.create!(title: "New Post Title", body: "New Post Body") }
let(:sponsoredpost) { topic.sponsored_posts.create!(title: "New Sponsoredpost Title", body: "New Sponsoredpost Body") }

   it { is_expected.to have_many(:posts) }

   it { is_expected.to have_many(:sponsored_posts) }

   it { is_expected.to validate_length_of(:name).is_at_least(5) }
   it { is_expected.to validate_length_of(:description).is_at_least(15) }
   it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }

# #1
  describe "attributes" do
    it "has name, description, and public attributes" do
      expect(topic).to have_attributes(name: topic.name, description: topic.description, public: public)
    end

# #2
    it "is public by default" do
      expect(topic.public).to be(true)
    end
  end
end




#At #1, we confirm that a topic responds to the appropriate attributes.

#At #2, we confirm that the public attribute is set to true by default.
