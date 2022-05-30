class ApplicationController < ActionController::API
    # include ActionController::Cookies
    before_action :authorized
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def encode_token(payload)
        JWT.encode(payload, ENV['JWT_SECRET'])
      end

      def auth_header
        request.headers['Authorization']
      end

      def decoded_token
        if auth_header
          token = auth_header.split(' ')[1]
          # headers: { 'Authorization': 'Bearer <token>' }
          begin
            JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: ENV['JWT_ALGORITHM'])
            # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
          rescue JWT::DecodeError
            nil
          end
        end
      end
      
      def logged_in? 
        !!current_user
      end
    
      def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
      end



private

def authenticate_user
    render json: {error: "Not authorized"}, status: :unauthorized unless current_user
end


def record_not_found(error)
    render json: {error: error.message}, status: :not_found
end

    def invalid_record(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    # def current_user
    #     @current_user ||= User.find_by(id: session[:user_id])
    # end

    def current_user 
        if decoded_token
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
        end
      end
   

end
