class BooksController < ApplicationController


    get '/books' do #index that loads all the books
        @books = Book.all
        erb :"books/index"
    end 


    get '/books/new' do 
        erb :"books/new"
    end 



end 