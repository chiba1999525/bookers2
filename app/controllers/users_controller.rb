class UsersController < ApplicationController

  def index
    @users = User.all
    @books = Book.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def edit
   @user = User.find(params[:id])
  end

   def update
          @user = User.find(params[:id])
      if  @user.update(user_params)
          redirect_to user_path(@user.id)
          flash[:notice] = 'メッセージが送信されました'
      else
          render :edit
      end

   end

    private
  def user_params
    params.require(:user).permit(:name, :profile_image, :Introduction)
  end
end
