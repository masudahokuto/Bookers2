class UsersController < ApplicationController
before_action :is_matching_login_user, only: [:index, :show, :edit, :update]
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
  
  def is_matching_login_user
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
