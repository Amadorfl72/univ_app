class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_user

  helper_method :current_user, :logged_in?
  def current_user
    # ||= only executes the query if @current_user is not already set
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
      # when using !!, will convert the call to the method response as true/false
      !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice]="You must be logged to perform this action"
      redirect_to login_path
    end
  end
end
