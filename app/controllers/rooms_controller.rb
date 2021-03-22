class RoomsController < ApplicationController
    before_action :redirect_if_not_logged_in
    layout "room"

    def index
        @rooms = current_user.rooms.all
    end

    def show
        @room = Room.find(params[:id])
    end

    private

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
