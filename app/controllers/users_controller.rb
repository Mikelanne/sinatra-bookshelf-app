class UsersController < ApplicationController


    get "/signup" do
        erb :"users/new"
    end 

    post "/signup" do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id 
            redirect "/users/#{user.id}"
        else 
            @errors = user.errors.full_messages.join(" - ")
            erb :'/users/new'
        end
    end

    get "/logout" do
        session.clear
        redirect '/login'
    end 

    get "/login" do
        erb :"users/login"
    end 

    post "/users/login" do #recieve the log in form, find the user, log the user in
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            redirect "/users/#{user.id}"
        else 
            redirect "/login"
        end
    end

    get "/users/:id" do
        @user = User.find_by(id: params[:id])
        erb :"/users/show"
    end 

end 