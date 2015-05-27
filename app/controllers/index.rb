# get '/'
get '/' do
  "Hello World"
  erb :index
end

# get '/register'
get '/signup' do
  erb :signup
end

# get '/home'
# get '/dashboard'
get '/dashboard' do
  @user = User.find(session[:user_id])
  erb :dashboard
end

# get '/dashboard/me'
get "/dashboard/me" do
   @user = User.find(session[:user_id])
   erb :user_profile
end

# get '/dashboard/me/edit'
get '/dashboard/me/edit' do
  erb :update_profile
end

# put '/dashboard/me'
put '/dashboard/me' do
  @profile = User.find(session[:user_id])
  @profile.update_attributes(
    first_name:     params[:first_name],
    last_name:      params[:last_name],
    username:       params[:username],
    email:          params[:email],
    charity_id:     params[:charity_id]
    )
  # user.password = params[:password]
  redirect '/dashboard/me'
end

post '/signup' do
  user= User.new(
    first_name:    params[:first_name],
    last_name:     params[:last_name],
    username:      params[:username],
    email:         params[:email],
    charity_id:    params[:charity_id]
  )
  user.password = params[:password]

  if user.save
    session[:user_id] = user.id
    redirect '/home/dashboard'
  else
    redirect '/signup'
  end
end

post '/login' do
  password_hash = params[:password]
  user = User.find_by(username: params[:username])
  if user && user.password == password_hash
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    redirect '/'
  end
end

get '/signout' do
  session[:user_id] = nil
  @current_user = nil
  redirect '/'
end







