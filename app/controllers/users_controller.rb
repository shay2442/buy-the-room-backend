class UsersController < ApplicationController
    # skip_before_action :authenticate_user, only: [:create, :me]
    skip_before_action :authorized, only: [:index, :create] 
    def index 
        render json: User.all
    end

    # def show
    #     user = User.find_by(id: session[:user_id])
    #     if user 
    #         render json: user
    #     else
    #         render json: {message: "Not logged in"}, status: :unauthorized
    #     end
    # end

  

    def create

        @user = User.create!(user_params) 
       
        if @user.valid? && @user.id
          @token = encode_token({ user_id: @user.id })
          render json: {user: @user, token: @token}, status: :created 
        else
        
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    


    def show
        if current_user 
            render json: current_user, status: :ok
        else 
            render json: "Not authenticated", status: :unauthorized
        end
    end

    def destroy 
        user = User.find(params[:id])
        user.destroy 
        head :no_content 
    end

private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end

    

