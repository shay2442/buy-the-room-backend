class RoomsController < ApplicationController
    def index
        rooms = Room.all
        render json: rooms
    end

    def show
        room = Room.find(params[:id])
        render json: room
    end

    def create
        room = current_user.sold_rooms.create(room_params)

        if room.valid?
            render json: room, status: :created
        else
            render json:item.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def room_params
        params.permit(:id, :image, :category, :city, :state, :description, :price, :sold)
    end
end
