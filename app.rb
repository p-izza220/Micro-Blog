require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'
require 'sendgrid-ruby'
 
enable :sessions 

# this allows us to access sessions


set :database, {adapter: "sqlite3", database: "restaurant.sqlite3"}
# the above line tells this page how to reference the database - when this page is required by other files, they will know how to reference the database too bc of this line of code


get '/' do
	@style = "css/style.css"
	@title = "Welcome Foodies"
	erb :sign_in
end

get '/home' do
  @style = "css/style.css"
  @title = "Welcome Home"
  @users = User.all
  @restaurants = Restaurant.all
  erb :home
end

post '/sign_in' do
  user = User.find_by( username: params[:username], password: params[:password] )
  if( user ) 
    session[:user_id] = user.id
  else
    redirect '/sign_up'
  end
  redirect '/home'
end

get '/stats' do
  @style = "css/style.css"
  @title = "Fools for Food: Home"
  @users = User.all
  @restaurants = Restaurant.all

  #to do: define our image @img
  #1) hard code image names into array and select 1
  @img = ['/img/burger.jpeg', '/img/pasta.jpeg', '/img/dogBurger.jpeg', '/img/thai.jpeg'].sample
  #if I were to write it as an interperpulated "/img/"#{['/img/burger.jpeg', '/img/pasta.jpeg', '/img/dogBurger.jpeg', '/img/thai.jpeg'].sample}
  #2) look up files & select one
  # Dir.new('./public/img/').select{|a| a[0] != "."}.sample This is another way to do what I am doing underneath 1) - the last part of the code tells the directory not to select files that are . or ..

if session[:user_id]
  @user = User.find(session[:user_id])
else
  redirect '/'
end
  erb :stats 
end  

get '/logout' do
  session.destroy
  redirect '/'
end

get '/profile' do 
  @style = "css/style.css" 
  @title = "Fools for Food: Profile"
  if session[:user_id] 
    @user = User.find(session[:user_id])
  else
    redirect '/'
  end
  erb :profile
end
get '/profile/:id' do
	@style = "css/style.css"
  @user = User.find(params[:id])
  @title = "#{@user.first_name} #{@user.last_name}"
  if session[:user_id]
    @user = User.find(session[:user_id])
  else
    redirect '/'
  end
  erb :profile
end
get '/settings' do
  @style = "css/style.css" 
  @title = "Profile Settings"
  if session[:user_id]
    @user = User.find(session[:user_id])
  else
    redirect '/'
  end
  erb :settings
end

post '/settings' do
  @style = "css/style.css" 
  @title = "Settings View"
  if session[:user_id]
    @user = User.find(session[:user_id])
    @user.update(params)
  else
    redirect '/'
  end
  erb :settings
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
	@title = "Sign Up"
	erb :sign_up
end

get '/stats' do
  @style = "css/style.css"
  @title = "Food for Thought"
  if session[:user_id]
    @user = User.find(session[:user_id])
  else
    redirect '/'
  end
  erb :stats
end 

post '/contact' do
  @title = "Contact Us"
  @style = "css/style.css"
  @msg = "Thanks for your comments - we'll be in touch shortly!"

  if /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/ =~ params[:email]

  mail = SendGrid::Mail.new( 
    SendGrid::Email.new(email: "nyc.foolsforfood@gmail.com"),
    "Thanks for contacting the fools for food team!",
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
