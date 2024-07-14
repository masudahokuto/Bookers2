class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
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
end
