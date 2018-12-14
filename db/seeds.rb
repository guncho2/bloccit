# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'


# Create Users
 5.times do
   User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all



# Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all


# Create Posts
50.times do
# #1
  post = Post.create!(
# #2
      user:   users.sample,

     topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )


# #12
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
# #13
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end
posts = Post.all

# Create Comments
# #3
100.times do
  Comment.create!(
# #4
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

100.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    copy:  RandomData.random_paragraph,
    price: Random.rand(10)
  )
end

100.times do
  Question2.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph,
    resolved: false
  )
end

50.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    price:  rand(1..100)
  )
end

user = User.first
 user.update_attributes!(
   email: 'lowensrs@gmail.com', # replace this with your personal email
   password: 'RDF12345'
 )

 # Create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )

 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )

 # Create a moderator
moderator = User.create!(
  name:     'Moderator User',
  email:    'lowensrs@gmail.com',
  password: 'RDF12345',
  role:     'moderator'
)


puts "#{Post.count}"
Post.find_or_create_by(title: "Only this title", body: "Only this body")
puts "#{Post.count}"


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question2.count} question2 created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Vote.count} votes created"






##At #1, we use create! with a bang (!). Adding a ! instructs the method to raise an error
# if there's a problem with the data we're seeding. Using create without a bang could fail
# without warning, causing the error to surface later.

#At #2, we use methods from a class that does not exist yet, RandomData, that will create
#random strings for title and body. Writing code for classes and methods that don't exist
# is known as "wishful coding" and can increase productivity because it allows you to stay focused on one problem at a time.

#At #3, we call times on an Integer (a number object). This will run a given block the
#specified number of times, which is 100 in this case. The end result of calling times is
#similar to that of a loop, but in this use-case, it is easier to read and thus more idiomatic.

#At #4, we call sample on the array returned by Post.all, in order to pick a random post
# to associate each comment with. sample returns a random element from the array every time it's called.

#At #3, we wishful-coded two methods that we'll need to add to RandomData:


# At #12, we update the time a post was created. This makes our seeded data more realistic and will
# allow us to see our ranking algorithm in action later in the checkpoint.
#
# At #13, we create between one and five votes for each post. [-1, 1].sample randomly
#  creates either an up vote or a down vote.
