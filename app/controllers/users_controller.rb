class UsersController < ApplicationController


    get "/signup" do
        erb :"users/new"
    end 

    post "/signup" do
        if params[:user].values.any?{|value| value.blank?}
            redirect "/signup"
        else 
            user = User.create(params[:user])
            session[:user_id] = user.id 
            redirect '/books'
        end
    end

    get "/login" do
        erb :"users/login"
    end 

end 