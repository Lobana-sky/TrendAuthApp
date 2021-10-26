# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# # insert admin user

q1 = User.create!(
    email: 'main_user@gmail.com',
    password: '000000',
    admin: true
)


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#insert into category table
#run once
# category_response = RestClient.get("#{ENV['BASE_URL']}/available/categories")
# categories = JSON.parse(category_response)['categories']
# categories.each do |category|
#   Category.create(category_name: category)
# end
# Category.create(category_name: "NONE")


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# #insert into newscurrents table for the first time
# current_news_response = RestClient.get("#{ENV['BASE_URL']}/latest-news?language=en&cache-control=no-cache&apiKey=#{ENV['API_KEY']}")
# latest_news = JSON.parse(current_news_response)['news']
# latest_news.each do |news|
#   category_name = news['category'].empty? || news['category'] == nil ? "None" : news['category'][0]
#   category = Category.find_by(category_name: category_name)
#   if category != nil
#     category_id = category.id 
#   else 
#     category_id = Category.create(category_name: category_name).id
#   end
#   CurrentNews.create(id_news: news['id'], title: news['title'], description: news['description'],
#     url: news['url'], author: news['author'],
#     image: news['image'], language: news['language'], published: news['published'], category_id: category_id)
# end