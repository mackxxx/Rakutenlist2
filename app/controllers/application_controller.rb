class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  add_flash_types :success, :danger
  before_action :authenticate_user
  helper_method :current_user, :logged_in?

  private
    def authenticate_user
      redirect_to login_url unless logged_in?
    end
    
    def log_in(user)
      session[:user_id] = user.id
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      current_user.present?
    end

    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
  end