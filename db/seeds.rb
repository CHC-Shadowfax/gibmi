# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create email: "latamtrip@gibmi.com.mx", password: "miviajelatam23$", role: "admin"


#blog post seeds

require 'open-uri'

post = Post.create(
title: "Day of the Musicians",
content: "Giving the gift of music. Why?...",
user_id: 1,
date: "11/22/2021"
)
image_url = "https://images.unsplash.com/photo-1536594527669-2f555de54e95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80"

file = URI.open(image_url)
post.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
