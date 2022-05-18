class RoomsController < ApplicationController
    # skip_before_action :index, :show
    
    def index
        rooms = Room.where(sold: false)
        render json: rooms
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
        # purchased_items = Room.find(params[:id])
        # render json: purchased_items, status: :ok

        render json: current_user.purchased_items, status: :ok
    end


    def create
        room = current_user.sold_rooms.create(room_params)

        if room.valid?
            render json: room, status: :created
        else
            render json:item.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def update 
        # @room.update!(room_params)
        room = Room.find(params[:id])
        if room.valid?
            render json: Room.update(room_params)
        else 
            render json:"Room was not updated"
        end
    end

     def destroy 
        # byebug
        room = Room.find(params[:id])
        render json: room.destroy 
        head :no_content
    end

    

    private

    def room_params
        params.permit(:image, :category, :city, :state, :description, :price, :items, :sold)
    end

    def find_room
        @room = Room.find(params[:id])
    end
    
end
