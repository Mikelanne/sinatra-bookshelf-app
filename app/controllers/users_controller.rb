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
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            redirect "/users/#{user.id}"
        else 
            flash[:error] = "We could not locate a Bookshelf with those credentials, please sign up or try again."
            redirect "/"
        end
    end

    get "/users/:id" do
        erb :"/users/show"
    end 

end 