class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'ユーザー登録が完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
     redirect_to @user, notice: 'ユーザー情報を更新しました'
    else
     render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
