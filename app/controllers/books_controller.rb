class BooksController < ApplicationController


    get '/books' do
        @books = current_user.books
        erb :"books/index"
    end 

    get '/books/new' do 
        erb :"books/new"
    end

    post '/books/new' do 
        book = current_user.books.build(params[:book])
        redirect "/books"
    end 

    get '/books/:id' do #show page for each book
        @book = Book.find_by(id: params[:id])
        erb :"books/show"
    end

    get '/books/:id/edit' do
        @book = Book.find_by(id: params[:id])
        erb :"books/edit"
    end 

    patch '/books/:id/edit' do
        @book = Book.find_by(id: params[:id])
        @book.update(params[:book])
        redirect "/books/#{@book.id}"
    end

    delete '/books/:id' do
        @book = Book.find_by(id: params[:id])
        @book.destroy
        redirect '/books'
    end 

end 