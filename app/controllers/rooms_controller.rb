class RoomsController < ApplicationController

    def index
        @rooms = Room.all
    end

    def show
        @room = Room.find(params[:id])
    end

    def new
        @room = Room.new
        @room.projects.build
    end

    def create
        @room = Room.new(room_params)
        if @room.save 
            redirect_to room_path(@room)
        else
            render :new
        end
    end

    def room_params
        params.require(:room).permit(
            :name, 
            :project_id, 
            project_attributes: 
                [:name, 
                :status, 
                :est_date_to_complete, 
                :notes, ])
    end
end
