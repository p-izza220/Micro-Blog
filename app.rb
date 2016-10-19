require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'

set :database, {adapter: "sqlite3", database: "restaurant.sqlite3"}
# the above line tells this page how to reference the database - when this page is required by other files, they will know how to reference the database too bc of this line of code


get '/' do
	@style = "css/style.css"
	@title = "The Rant & Rave Community"
  @users = User.all
	erb :home
end


get '/profile' do
  @style = "css/style.css" 
  @title = "@first_name @last_name"
  # @user = User.find(params[:id])

  erb :profile
end

get '/profile/:id' do
  @style = "css/style.css" 
  @title = "@first_name @last_name"
  @user = User.find(params[:id])

  erb :profile
end

get '/settings' do
  @style = "css/style.css" 
  @title = "@first_name @last_name"

  erb :profile
end

get '/search_users' do
	@style = "css/style.css" 
	@title = "Search"
	erb :search_users
end	

get '/contact' do 
	@style = "css/style.css"
	@title = "Contact Us"
	erb :contact 
end

get '/sign_up' do 
	@style = "css/style.css"
	@title = "Login"
	erb :sign_up
end

get '/stats' do 
  @style = "css/style.css"
  @title = "Food for Thought"
  erb :stats
 end 

post '/contact' do
  @title = "Contact Restau-RANT-or-RAVE"
  @style = "css/style.css"
  @msg = "Thanks for your comments - we'll be in touch shortly!"

  if /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/ =~ params[:email]

  erb :contact

  mail = SendGrid::Mail.new( 
    SendGrid::Email.new(email: "nyc.foolsforfood@gmail.com"),
    "Thanks for contacting these fools for food!",
    SendGrid::Email.new(email: params[:email] ),
    SendGrid::Content.new(type: 'text/plain', value: <<-EMAILCONTENTS
      Hello #{params[:name]},

      Thanks for letting us know how you feel. We are always trying to improve user experience!

      Our team will be in contact with you shortly.  

      For your record here is a copy of the feedback we recieved from you:
      
      ---------------------------------
      
      #{params[:message]}
EMAILCONTENTS
      )
  )
  sg = SendGrid::API.new( api_key: ENV['SENDGRID_API_KEY'] )

  response = sg.client.mail._('send').post(request_body: mail.to_json)

  @msg = "Thanks for your submission, look for a message from us soon!"
  puts response.status_code
  puts response.body
  puts response.headers
else
  @msg = "This email address is invalid"
end
  # end email check

  erb :contact
end