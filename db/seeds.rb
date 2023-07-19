# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create email: "latamtrip@gibmi.com.mx", password: "miviajelatam23$", role: 1
User.create email: "lisette@gibmi.com.mx", password: "Password123", role: 1


#blog post seeds
BLOG = [
  'https://images.unsplash.com/photo-1536594527669-2f555de54e95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80',
  'https://images.unsplash.com/photo-1591160690555-5debfba289f0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHVwcHl8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHB1cnNlfGVufDB8fDB8fHwy&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1573148195900-7845dcb9b127?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGlwaG9uZXxlbnwwfHwwfHx8Mg%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1686778739165-74526e0a73a8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHN0YW5sZXklMjBjdXB8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNvbXB1dGVyfGVufDB8fDB8fHwy&auto=format&fit=crop&w=800&q=60',
]

6.times do
file = URI.open(BLOG.sample)
post = Post.new(
title: Faker::Lorem.sentence(word_count: 3),
content: Faker::Lorem.paragraph(sentence_count: 3),
user_id: User.first.id,
#start_date: frh[:b_begin]
created_at: Faker::Date.between(from: '2022-01-01', to: '2023-7-18'),
)
post.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
post.save
end

puts "Blog posts created!"
