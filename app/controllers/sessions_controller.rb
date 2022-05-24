class SessionsController < ApplicationController

    def login 
       user = User.find_by(username: params[:user][:username])
       if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        # byebug
       render json: {message: "Successful Login", user: user}, status: 200
    else
        render json: {error: "Invalid username or password. Try again"}, status: :unauthorized
    end
  end
end
