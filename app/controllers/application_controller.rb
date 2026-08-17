class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :logged_in?, :achievement_rate
  before_action :authenticate_user!

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def achievement_rate
    return nil if current_user.goal_amount.nil?

    total = current_user.savings.sum(:amount)
    [((total.to_f / current_user.goal_amount) * 100).round, 100].min
  end

  def authenticate_user!
    redirect_to login_path, alert: "ログインしてください" unless logged_in?
  end
end
