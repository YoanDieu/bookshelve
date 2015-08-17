class BooksController < ApplicationController
  def index
      @books = Book.all
      @nombreDeLivres = Book.all.length
      @categories = Category.all
  end

  def create
    Book.create title: params[:title], sub_title: params[:sub_title], author: params[:author], category_id: params[:category_id]

    if Book.create title: params[:title], author: params[:author]
      redirect_to "/books"
    else
      render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.all
  end

  def update
    @book= Book.find(params[:id])
    @categories = Category.all

    Book.find(params[:id]).update title: params[:title], author: params[:author], sub_title: params[:sub_title], category_id: params[:category_id], read: params[:read]

    if @book.update title: params[:title]
      redirect_to "/books/#{params[:id]}"
    else
      render "show"
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to "/books"
  end
end
