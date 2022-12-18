class RoomsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    
    def index
        room = Room.where(sold: false)
        render json: room, status: :ok
    end

    def show
        room = Room.find(params[:id])
        render json: room
    end

    def sold 
        room = Room.find(params[:id])
        if room
            room.update(sold: true, buyer: current_user)
            render json: room, status: :ok
        else
            render json: {error: "Room not found"}, status: :unprocessable_entity
        end
    end

    def purchased_rooms
        purchased_items = Room.find(params[:id])
        render json: purchased_items, status: :ok

        # render json: current_user.purchased_items, status: :ok
    end


    def create
        room = current_user.sold_rooms.create(room_params.except("images"))

        if room.valid?
            room_params["images"].each do |image|
                Image.create(url: image, room_id: room.id)
            end
            render json: room, status: :created
        else
            render json:room.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def update 
        # @room.update!(room_params)
        room = current_user.sold_rooms.find_by(id: params[:id])
        # byebug
        if room && room.update(room_params)
            # byebug
            render json: room
        else
            render json:"Room was not updated"
        end
    end
    # def update
    #     if @room.update(room_params)
    #       render json: @room
    #     else
    #       render json: @room.errors, status: :unprocessable_entity
    #     end
    #   end

     def destroy 
        room = Room.find(params[:id])
        render json: room.destroy 
        head :no_content
    end

    

    private

    def room_params
        params.permit(:id, :image, :category, :city, :state, :description, :price, :items, :sold, images: [])
    end

    def find_room
        @room = Room.find(params[:id])
    end
    
end
