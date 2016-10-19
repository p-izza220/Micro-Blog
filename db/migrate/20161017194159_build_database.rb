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
  		t.string :name
  		t.string :cuisine_type
  		t.string :phone, limit: 18
  		t.string :hours
  	end
  	create_join_table :users, :restaurants, {table_name: :comments} do |t|
  		t.integer :rating, limit: 1
  		t.text :comment
  	end
  end
end
