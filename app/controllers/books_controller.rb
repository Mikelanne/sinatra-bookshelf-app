class BooksController < ApplicationController


    get '/books' do #need to figure out how to get this to just the user's books
        @books = Book.all
        erb :"books/index"
    end 

    get '/books/new' do 
        erb :"books/new"
    end

    post '/books/new' do 
        book = Book.create(params[:book])
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

end 