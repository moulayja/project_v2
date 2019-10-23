Post.destroy_all
Comment.destroy_all
Category.destroy_all




Category.create(name: "Politics")
Category.create(name: "Entertainment")
Category.create(name: "Sports")
Category.create(name: "Health")
Category.create(name: "Lifestyle")




puts "seeded"