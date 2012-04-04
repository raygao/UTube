require 'pp'
class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    puts auth
    #user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    user =  User.create_with_omniauth(auth)
    session[:user_id] = user.id
    puts '###### Callback invoked #####'
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  def failure
    #render :text => 'Google auth failed.'
    render :text => request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
  end
end