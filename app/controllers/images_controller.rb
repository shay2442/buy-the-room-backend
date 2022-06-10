class ImagesController < ApplicationController
    def create
        @image = Image.new(image_params)
    
        if @image.save
          render json: @image, status: :created, location: @image
        else
          render json: @image.errors, status: :unprocessable_entity
        end
      end

      private

      def set_user
        @image = Image.find(params[:id])
      end

      def image_params
        params.permit(:room_id, :url)
      end

end
