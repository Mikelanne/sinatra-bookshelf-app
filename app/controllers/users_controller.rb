class UsersController < ApplicationController


    get "/users/signup" do
        erb :"users/new"
    end 

    post "/users/signup" do
        if params[:user].values.any?{|value| value.blank?}
            redirect "/signup"
        else 
            user = User.create(params[:user])
            session[:user_id] = user.id 
            redirect '/users/login'
        end
    end

    get "/users/login" do
        erb :"users/login"
    end 

    post "/users/login" do #recieve the log in form, find the user, log the user in
        user = User.find_by(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect '/books/index'
        end
    end

end 