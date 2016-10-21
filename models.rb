# models.rb 
 #all of these classes are inheriting from ActiveRecord::Base - this allows us to access their methods that are prewritten
class User < ActiveRecord::Base
	has_many :comments 
	has_many :restaurants, through: :comments
end


class Restaurant < ActiveRecord::Base
	has_many :comments
	has_many :users, through: :restaurants 
end


class Comment <  ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
end

@userFullName = user.first_name + " " + @user.last_name





