class BooksController < ApplicationController
  def index
      @books = Book.page(params[:page]).per(9)
      @nombreDeLivres = Book.all.length
      @categories = Category.all
  end

  def create
    Book.create title: params[:title], sub_title: params[:sub_title], author: params[:author], category_id: params[:category_id]

    if Book.create title: params[:title], author: params[:author]
      flash[:succes] = "Le livre a bien été créé !"
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
      flash[:succes] = "Le livre à bien été édité !"
      redirect_to "/books"
    else
      render "show"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    if @book.destroy
      flash[:succes] = "Le Livre a bien été supprimé !"
    redirect_to "/books"
    end
  end
end
