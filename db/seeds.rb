# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Mila', photo: 'https://thumbs.dreamstime.com/b/many-small-links-young-woman-wearing-eye-glasses-208952073.jpg', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'John', photo: 'https://thumbs.dreamstime.com/b/many-small-links-young-woman-wearing-eye-glasses-208952073.jpg', bio: 'Teacher from Poland.')
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
like = Like.create(post: first_post, author: second_user)
