class BuildDatabase < ActiveRecord::Migration[5.0]
  def change
  	create_table 'users' do |t|
  		t.string :first_name, limit: 50
  		t.string :last_name, limit: 50
  		t.string :email
  		t.string :username, limit: 15
  		t.string :password
  	end	

  	create_table 'restaurants' do |t|
  		t.string :restaurant_name
  		t.string :cuisine_type
  		t.string :location
  		t.string :contact_number, limit: 10
  		t.string :hours
  	end 

  	create_join_table :users, :restaurants, {table_name: :comments} do |t|
  		t.integer :rating, limit: 1
  		t.text :comment
  		#we are doing text instead of string bc string has a character limit, text does too but it' MUCH higher
  	end

  end
end
