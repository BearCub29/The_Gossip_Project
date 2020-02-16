# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTagGossip.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all

10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code:Faker::Address.zip_code
    )
end

10.times do
  User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: rand(5..20)),
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 13, to: 99),
    city: City.all.sample,
    password: "hello"
    )
end

20.times do
  Gossip.create!(
    title: Faker::String.random(length: 3..14),
    content: Faker::ChuckNorris.fact,
    user: User.all.sample
    )
end

10.times do
  Tag.create!(
    title: "##{Faker::Book.genre}"
    )
end

25.times do
  JoinTagGossip.create(
    tag: Tag.all.sample,
    gossip: Gossip.all.sample
    )
end

20.times do
  PrivateMessage.create(
    content: Faker::Lorem.sentence(word_count: 10),
    sender: User.all.sample
    )
  JoinMessageRecipient.create(
    recipient: User.all.sample,
    private_message: PrivateMessage.all.sample
    )
end

30.times do
  Comment.create(
    content: Faker::Lorem.sentence(word_count: rand(5..10)),
    user: User.all.sample,
    gossip: Gossip.all.sample
    )
end

10.times do
  Like.create(
    user: User.all.sample,
    gossip: Gossip.all.sample
    )
end

10.times do
  Like.create(
    user: User.all.sample,
    comment: Comment.all.sample
    )
end

