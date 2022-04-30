class BooksController < ApplicationController

  def new
    @book = Book
  end

  def create
       @book = Book.new(book_params)
       @book.user_id = current_user.id
       @user = current_user
       @books = Book.all
    if @book.save
       flash[:notice] = 'You have created book successfully.'
       redirect_to book_path(@book.id)
    else
       render :index
    end

  end


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
     @book = Book.find(params[:id])
  if @book.user != current_user
    redirect_to books_path
  end

  end

  def update
       @new_book = Book.new
       @book = Book.find(params[:id])
       @book.user_id = current_user.id
   if  @book.update(book_params)
       flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
   else
     render :edit
   end
  end

  private
  def book_params
    params.require(:book).permit(:title, :image, :body)
  end

end
