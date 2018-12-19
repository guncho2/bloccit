FactoryGirl.define do
   pw = RandomData.random_sentence
 # #3
   factory :user do
     name RandomData.random_name
 # #4
     sequence(:email){|n| "user#{n}@factory.com" }
     password pw
     password_confirmation pw
     role :member
   end
 end


#  At #3, we declare the name of the factory :user.
#
# At #4, each User that the factory builds will have a unique email address using
# sequence. Sequences can generate unique values in a specific format, for example,
#  e-mail addresses.
