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
        if user && user.authenticate(password: params[:user][:password])
            session[:user_id] = user.id 
            redirect #a show or something
        else 
            #tell the user they entered invalid credentials
            #redirect to the log in page
        end
    end

end 