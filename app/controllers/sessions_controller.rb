class SessionsController < ApplicationController

  def new
    #set key in session with referal url unless it is a redirect from /login
    session[:prev_url] = request.referer unless request.referer.include? '/login' 
  end
  
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      @prev_url = session[:prev_url]
      
      #set prev_url to nil before redirect
      session[:prev_url] = nil

      redirect_to @prev_url
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login', alert: "Incorrect email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back
  end

end
