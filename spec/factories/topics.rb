# #16
 FactoryGirl.define do
   factory :topic do
     name RandomData.random_name
     description RandomData.random_sentence
   end
 end

 # At #16, we define a new factory for topics that generates a
 #  topic with a random name and description.
