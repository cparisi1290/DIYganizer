class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    private

    def project_params
        params.require(:project).permit(
            :name, 
            :status, 
            :est_date_to_complete, 
            :notes, 
            :user_id, 
            :room_id)
    end
end
