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

def full_name
	if !first_name.nil? && !last_name.nil?
		first_name + " " + last_name
	elsif !first_name.nil?
		first_name
	elsif !last_name.nil?
		last_name
	end
end




