class SessionsController < ApplicationController

    def get_current_user
        #get token and decode token to get current user 
        render json: current_user
       #  current_user takes in all the code from application_controller
   end

    def login 
       user = User.find_by(username: params[:user][:username])
       if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
       
       render json: {message: "Successful Login", user: user}, status: 200
    else
        render json: {error: "Invalid username or password. Try again"}, status: :unauthorized
    end
  end

  

  def auth
    user = User.find(session[:user_id])
    render json: user
  end

  def logout
    session.delete :user_id
end

end
