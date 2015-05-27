# Helper methods allows use of method in views and controllers
#line 6 sets @current_user to nil ||= allows code on right to run if there is a session user_id present

helpers do
  def current_user
    @current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
  end
end



