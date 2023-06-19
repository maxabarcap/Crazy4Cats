# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

until Gato.count == 20 do
    Gato.create(name: Faker::Creature::Cat.breed) if
    !Gato.pluck(:name).include?(Faker::Creature::Cat.breed)
end

gatos = Gato.all

until User.count == 20 do
    User.create(name: Faker::Name.first_name) if
    !User.pluck(:name).include?(Faker::Name.first_name)
end

users = User.all

# until Post.count == 15 do
#     Post.create(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), when: Faker::Date.between(from: 10.years.ago, to: Date.today), gato_id: gatos.sample.id)

# end    

15.times do
    post = Post.new(
        title: Faker::Lorem.sentence,
        decription: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
        user: users.sample
    )
    post.save

    
    rand(2..4).times do
    comment = Comment.new(
        content: Faker::Lorem.sentence,
        user: users.sample,
        post: post
    )
    comment.save
    end

    rand(2..4).times do
    reaction = Reaction.new(
        reaction_type: "like",
        user: users.sample,
        post: post
    )
    reaction.save
    end
end