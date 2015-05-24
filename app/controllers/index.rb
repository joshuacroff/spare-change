get '/home' do
  "Hello World"
  erb :index
end

get '/home/signup' do
  erb :signup
end

get '/home/dashboard' do
  @user = User.find(session[:user_id])
  erb :dashboard
end

post '/signup' do
  user= User.new(
                  first_name: params[:first_name],
                  last_name: params[:last_name],
                  username: params[:username],
                  email: params[:email],
                  charity_id: params[:charity_id]
                  )
  user.password = params[:password]

  if user.save
    session[:user_id] = user.id
    redirect '/home/dashboard'
  else
    redirect '/home/signup'
  end
end

post '/login' do
  password_hash = params[:password]
  user = User.find_by(username: params[:username])
  if user && user.password == password_hash
    session[:user_id] = user.id
    redirect '/home/dashboard'
  else
    redirect '/home'
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/home'
end





