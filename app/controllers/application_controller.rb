class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    User.find_by(id: session["current_user_id"])
  end

  rescue_from CanCan::AccessDenied do |error|
    redirect_to tweets_path, :alert => error.message
  end
end
