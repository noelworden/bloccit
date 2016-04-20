require 'random_data'

5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
    )
end

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_sentence
    )
end
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
    )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
    )
end

user = User.first
  user.email = 'noelworden@gmail.com',
  user.password = 'helloworld'

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"