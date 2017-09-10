class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  helper_method :current_user
  
  NotAuthenticated = Class.new(StandardError)
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from NotAuthenticated, with: :not_authenticated

  def record_not_found
    flash[:notice] = 'Registro não encontrado'
    redirect_to action: 'index'
  end

  def not_authenticated
    flash[:notice] = 'Você precisa se autenticar no sistema'
    redirect_to new_session_url
  end

  def logged?
    raise NotAuthenticated unless session[:id]
  end

end
