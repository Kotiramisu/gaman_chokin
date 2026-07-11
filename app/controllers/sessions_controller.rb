class SessionsController < ApplicationController
 skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to savings_path, notice: 'ログインしました'
    else
        flash.now[:alert] = 'メールアドレスまたはパスワードが正しくありません'
        render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'ログアウトしました'
  end
end
