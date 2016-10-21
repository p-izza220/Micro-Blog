require './app'

#create base users
cam = User.create(first_name: 'Cam', last_name: 'Crews', email: 'camcrews@nycda.com', username: 'camerican', password: 'hawaii')
izza = User.create(first_name: 'Izza', last_name: 'Gallant', email: 'izza@restauRANT.net', username: 'p-izza220', password: 'bobcats4eva')
arnold = User.create(first_name: 'Arnold', last_name: 'Hundert', email: 'flash@restauRANT.net', username: '1776penny', password: 'arnold')
joe = User.create(first_name: 'Joe', last_name: 'Giglio', email: 'joe@nycda.com', username: 'joegigs', password: 'joe')
mark = User.create(first_name: 'Mark', last_name: 'Zuckerberg', email: 'mark@facebook.com', username: 'MrFacebook', password: 'IownFacebook')
bill = User.create(first_name: 'Bill', last_name: 'Gates', email: 'bill@money.com', username: 'BillGatesMakesBills', password: 'billgatesfoundation')
danna = User.create(first_name: 'Danna', last_name: 'Wolf', email: 'danna@nycda.com', username: 'dannawolf', password: 'beetlejuice')


#create Restaurants
juice = Restaurant.create(name: 'Juice Generation', cuisine_type: 'healthy')
taco = Restaurant.create(name: 'Dos Toros', cuisine_type: 'mexican')
pizza = Restaurant.create(name: 'Wanted Pizza', cuisine_type: 'italian')
mexican = Restaurant.create(name: 'Chipotle', cuisine_type: 'mexican')
french = Restaurant.create(name: 'Cherche Midi', cuisine_type: 'french')
american = Restaurant.create(name: 'Cam\'s Cuisine', cuisine_type: 'american')


# create comments
Comment.create(user_id: cam.id, restaurant_id: taco.id, rating: 5, comment: "This is the most delicious taco place, whatever you order is going to be delicious.")
Comment.create(user_id: cam.id, restaurant_id: american.id, rating: 2, comment: "Could be better...")
Comment.create(user_id: izza.id, restaurant_id: juice.id , rating: 5, comment: "The greengenes smoothie is amazing!")
Comment.create(user_id: arnold.id, restaurant_id: pizza.id, rating: 1, comment: "This is the grossest restaurant ever. Avoid.")
Comment.create(user_id: izza.id, restaurant_id: pizza.id, rating: 3, comment: "it's pizza, how can you not enjoy... but it's no joe's")
Comment.create(user_id: cam.id, restaurant_id: juice.id, rating: 4, comment:"nomnomnom")
Comment.create(user_id: danna.id, restaurant_id: french.id, rating: 4, comment: "I just loved it here")
Comment.create(user_id: izza.id, restaurant_id: french.id, rating: 1, comment: "I love fooood")
Comment.create(user_id:cam.id, restaurant_id: mexican.id, rating: 1, comment: "I need better mexican food")
Comment.create(user_id: arnold.id, restaurant_id: french.id, rating: 5, comment: "What a lovely place with spectacular food")




