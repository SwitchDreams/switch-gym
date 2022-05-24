class ApplicationController < ActionController::API
  include ::Error::ErrorHandler

  def require_managment_permisison
    raise Unauthorized unless current_user.admin? or current_user.teacher?
  end
end
