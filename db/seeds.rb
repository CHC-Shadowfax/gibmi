# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create email: "latamtrip@gibmi.com.mx", password: "miviajelatam23$", role: 1
User.create email: "lisette@gibmi.com.mx", password: "Password123", role: 1
User.create email: "visitor@gibmi.com.mx", password: "Password12", role: 0


#blog post seeds

HOLIDAYS = [
   {
    ID: 'MOTHERSDAY',
    IMAGE: 'https://images.unsplash.com/photo-1589169011402-8b2cbd1ee593?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bW90aGVyJTIwYW5kJTIwY2hpbGR8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=800&q=60',
    DATE: "05-09-2021",
    TITLE: "Happy Mother's Day",
    FEATURED: false,
    CONTENT: "Can you believe it is May!? Around the corner you see all of the flowers come up. I love you mom baloons. That's it! Mother's Day is around the corner."
  },
   {
    ID: 'CHRISTMAS',
    IMAGE: 'https://images.unsplash.com/photo-1545622783-b3e021430fee?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNocmlzdG1hc3xlbnwwfHwwfHx8Mg%3D%3D&auto=format&fit=crop&w=800&q=60',
    DATE: "12-25-2023",
    TITLE: "It's Chirstmas Time!",
    FEATURED: true,
    CONTENT: "Christmas is a time for family and friends. It is a special time to be thankful for all of the wonderful blessings in our lives. Sending you good wishes and the hope that your holiday will be a joyous one."
  },
  {
    ID: 'JULY4TH',
    IMAGE: 'https://images.unsplash.com/photo-1436124026657-36828b43c7ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8NHRoJTIwb2YlMjBqdWx5fGVufDB8fDB8fHwy&auto=format&fit=crop&w=800&q=60',
    DATE: "07-04-2023",
    TITLE: "Happy 4th of July!",
    FEATURED: false,
    CONTENT: "Happy 4th of July! I hope you have a fun and safe holiday."
  },
   {
    ID:'ANNASBIRTHDAY',
    IMAGE: 'https://res.cloudinary.com/dgeduaopr/image/upload/v1690248088/Lisset_-_2023-07-24_08_21_08_awodyy.jpg',
    DATE: "01-08-2023",
    TITLE: "It's the BIG 30!",
    FEATURED: true,
    CONTENT: "Happy Birthday Anna! It's the BIG 30! Let's celebrate and make this a memorable year!"
  },

  {
    ID: 'FATHERSDAY',
    IMAGE:'https://images.unsplash.com/photo-1605812830455-2fadc55bc4ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGZhdGhlcnMlMjBkYXl8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=800&q=60',
    DATE: "06-18-2023",
    TITLE: "Happy Father's Day!",
    FEATURED: false,
    CONTENT: "You are the best dad ever! I love you so much. Happy Father's Day!"
  },

  {
  ID: 'GRANDPARENTSDAY',
  IMAGE: 'https://images.unsplash.com/photo-1592381499682-33cee994fedd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGdyYW5kJTIwcGFyZW50c3xlbnwwfHwwfHx8Mg%3D%3D&auto=format&fit=crop&w=800&q=60',
  DATE:"09-10-2023",
  TITLE: "Happy Grandparents Day!",
  FEATURED: false,
  CONTENT: "Another day with your loving grandparents. Let's give thanks for having them another year and make them feel loved and celebrated."
  },

   {
    ID: 'VALENTINESDAY',
    IMAGE:'https://images.unsplash.com/photo-1484678002699-0e7dc5fa52c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzfHx2YWxlbnRpbmVzJTIwZGF5fGVufDB8fDB8fHwy&auto=format&fit=crop&w=800&q=60',
    DATE:"02-14-2023",
    TITLE: "Love is in the air!",
    FEATURED: true,
    CONTENT: "Today is the day to celebrate love! Happy Valentine's Day!"
  },

  {
  ID: 'MUSICIANSDAY',
  IMAGE: 'https://images.unsplash.com/photo-1525201548942-d8732f6617a0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z3VpdGFyfGVufDB8fDB8fHwy&auto=format&fit=crop&w=800&q=60',
  DATE: "11-22-2023",
  TITLE: "Sound of Music",
  FEATURED: true,
  CONTENT: "Give the gift of music. Music is the universal language of mankind."
},

   {
    ID: 'KIDSDAY',
    DATE: "04-30-2023",
    IMAGE: 'https://images.unsplash.com/photo-1597524181043-5df2539fabf8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fGtpZHMlMjBkYXl8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=800&q=60',
    TITLE: "Happy Kids Day",
    FEATURED: false,
    CONTENT: "Today is the day to celebrate kids! They will only be the age they are once , let's make it count and make the best of it! Happy Kids Day!"
  },

  {
    ID: 'TEACHERSDAY',
    DATE: "05-15-2023",
    IMAGE: 'https://images.unsplash.com/photo-1511629091441-ee46146481b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dGVhY2hlcnMlMjBkYXl8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=800&q=60',
    TITLE: "Teacher Appreciation Day",
    FEATURED: false,
    CONTENT: "Today is the day to celebrate teachers! They are the ones who teach us and guide us to be the best we can be. Happy Teachers Day!"
  },


  {
    ID: 'NATIONALWOMANSDAY',
    DATE: '08-09-2023',
    IMAGE: 'https://images.unsplash.com/photo-1498661694102-0a3793edbe74?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGdyb3VwJTIwb2YlMjB3b21hbnxlbnwwfHwwfHx8Mg%3D%3D&auto=format&fit=crop&w=800&q=60',
    TITLE: "National Woman's Day",
    FEATURED: false,
    CONTENT: "Woman have many talents and we can all think of that one person that has been a big example in our lives. Let's celebrate them today!"
  },

  {
    ID: 'NATIONALPETDAY',
    DATE: '04-11-2023',
    IMAGE: 'https://images.unsplash.com/photo-1560743641-3914f2c45636?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzd8fGRvZ3xlbnwwfHwwfHx8Mg%3D%3D&auto=format&fit=crop&w=800&q=60',
    TITLE: "Celebrate our furry friends!",
    FEATURED: true,
    CONTENT: "Pets can be man's best friend. They are loyal and loving. Give a person the gift of having a loyal forever friend. Happy National Pet Day!"
  }
]

HOLIDAYS.each do |holiday|
  print '🎉'
  file = URI.open(holiday[:IMAGE])
  post = Post.new(
  title: holiday[:TITLE],
  content: holiday[:CONTENT],
  user_id: User.first.id,
  featured: holiday[:FEATURED],
  #start_date: frh[:b_begin]
  created_at: holiday[:DATE]
  )
  post.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  post.save
end
print "Posts created!"

# 1.times do
#   feature = Post.create(
#     title: "Happy Mother's Day",
#     content: "Can you believe it is May!? Around the corner you see all of the flowers come up. I love you mom baloons. That's it! Mother's Day is around the corner.",
#     user_id: User.first.id,
#     created_at: "05-01-2021"
# )

# puts "Post - #{feature.title} has been created!"

  # puts "Feature Color - #{feature.value} for #{bag.name} has been created!"

  # feature = Feature.create(
  #   name: "Make",
  #   value: Faker::Commerce.brand,
  #   bag_id: bag.id
  # )
  # puts "Feature Make - #{feature.value} for #{bag.name} has been created!"

  # feature = Feature.create(
  #   name: "Material",
  #   value: Faker::Commerce.material,
  #   bag_id: bag.id
  # )
  # puts "Feature Material - #{feature.value} for #{bag.name} has been created!"

  # feature = Feature.create(
  #   name: "Size",
  #   value: SIZE.sample,
  #   bag_id: bag.id
  # )
  # puts "Feature Size - #{feature.value} for #{bag.name} has been created!"
