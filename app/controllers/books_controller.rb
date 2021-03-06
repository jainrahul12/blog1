class BooksController < ApplicationController
	before_action :authenticate_user!
	#member_signed_in?
	def new
	 @book=Book.new
	end
  
	
	def index
		@books=Book.all
	end
    def create
        @book = Book.new(book_params)
  
        @book.save
        redirect_to book_path(@book)
   end

   
	def show
    @book=Book.find(params[:id])
    end

   def edit
    @book = Book.find(params[:id])
   	
    end

   def update
  @book = Book.find(params[:id])
 
  @book.update(book_params)
    redirect_to @book
 
  
 end

   private
  def book_params
    params.require(:book).permit(:title, :text)
  end
    
  
	
end
