class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

   def create
       @book = Book.new(book_params)
       @book.user_id = current_user.id
       @user = current_user
       @books = Book.all
    if @book.save
       flash[:notice] = 'You have created book successfully.'
       redirect_to books_path
    else
       render :index
    end

   end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
     @user = User.find(params[:id])
  if @user != current_user
     redirect_to user_path(current_user.id)
  end
  end


   def update
          @user = User.find(params[:id])
      if  @user.update(user_params)
          redirect_to user_path(@user.id)
          flash[:notice] = 'You have updated user successfully.'
      else
          render :edit
      end

   end

    private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
