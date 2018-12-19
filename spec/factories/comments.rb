FactoryGirl.define do
    factory :comments do
        body RandomData.random_paragraph
        post
        user
    end
end
