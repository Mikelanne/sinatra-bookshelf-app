class BooksController < ApplicationController


    get '/books' do #index that loads all the books
        erb:index
    end 


    get '/books/new' do 
        erb :"books/new"
    end 



end 