class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :set_current_user
  # before_action :require_user_logged_in!
  def set_current_user
    
    if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert:"You must be signed in to do that." if Current.user.nil?
  end
end
