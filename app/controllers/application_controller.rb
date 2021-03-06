class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end
  
  helper_method :current_user

  def authenticate_user!
    redirect_to "/login" unless current_user
  end
  
end
