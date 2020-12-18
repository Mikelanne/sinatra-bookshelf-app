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
            redirect '/books'
        end
    end

    get "/users/login" do
        erb :"users/login"
    end 

    post "/users/login" do 

    end

end 