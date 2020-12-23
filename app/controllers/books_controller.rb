class BooksController < ApplicationController


    get '/books' do
        @books = current_user.books
        erb :"books/index"
    end 

    get '/books/new' do 
        erb :"books/new"
    end

    post '/books' do
        #presence validation for title at least
        #conditional to check validation
        if 
        book = current_user.books.build(params[:book])
        book.save
        redirect "/books"
    end 

    get '/books/:id' do
        @book = Book.find_by(id: params[:id])
        erb :"books/show"
    end

    get '/books/:id/edit' do
        @book = Book.find_by(id: params[:id])
        if @book.user == current_user
            erb :"books/edit"
        else
            redirect "/books"
        end
    end 

    patch '/books/:id' do
        @book = Book.find_by(id: params[:id])
        if @book.user == current_user
            @book.update(params[:book])
            redirect "/books/#{@book.id}"
        else 
            redirect "/books"
        end
    end

    delete '/books/:id' do
        @book = Book.find_by(id: params[:id])
        if @book.user == current_user
            @book.destroy
            redirect '/books'
        else
            redirect '/books'
        end 
    end 

    #add validations to patch and delete like edit

end 