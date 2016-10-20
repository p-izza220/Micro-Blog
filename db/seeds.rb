require './app'

#create base users
cam = User.create(first_name: 'Cam', last_name: 'Crews', email: 'camcrews@nycda.com', username: 'camerican', password: 'hawaii')
izza = User.create(first_name: 'Izza', last_name: 'Gallant', email: 'izza@restauRANT.net', username: 'p-izza220', password: 'bobcats4eva')
arnold = User.create(first_name: 'Arnold', last_name: 'Hundert', email: 'flash@restauRANT.net', username: '1776penny', password: 'arnold')
joe = User.create(first_name: 'Joe', last_name: 'Giglio', email: 'joe@nycda.com', username: 'joegigs', password: 'joe')


#create Restaurants
juice = Restaurant.create(restaurant_name: 'Juice Generation', cuisine_type: 'healthy')
taco = Restaurant.create(restaurant_name: 'Dos Toros', cuisine_type: 'mexican')
pizza = Restaurant.create(restaurant_name: 'Wanted Pizza', cuisine_type: 'italian')

# create comments
Comment.create(user_id: cam.id, restaurant_id: taco.id, rating: 5, comment: "This is the most delicious taco place, whatever you order is going to be delicious.")
Comment.create(user_id: izza.id, restaurant_id: juice.id , rating: 5, comment: "The greengenes smoothie is amazing!")
Comment.create(user_id: arnold.id, restaurant_id: pizza.id, rating: 1, comment: "This is the grossest restaurant ever. Avoid.")
Comment.create(user_id: izza.id, restaurant_id: pizza.id, rating: 3, comment: "it's pizza, how can you not enjoy... but it's no joe's")
Comment.create(user_id: cam.id, restaurant_id: juice.id, rating: 4, comment:"nomnomnom")