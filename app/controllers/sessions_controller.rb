class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.auth(params[:email], params[:password])
    raise NotAuthenticated unless user
    unless user
      redirect_to new_session_url
      return
    end
    session[:id] = user.id
    session[:name] = user.name
    flash[:notice] = "Olá #{user.name}, seja bem-vindo!"
    redirect_to users_path
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end
end
