class ProjectsController < ApplicationController
    layout "project"

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
        @rooms = Room.all
        @project.build_room
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        if @project.valid?
            redirect_to projects_path 
        else
            render :edit 
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path 
    end

    private

    def project_params
        params.require(:project).permit(
            :name, 
            :status, 
            :est_date_to_complete, 
            :notes, 
            :user_id, 
            :room_id,
            room_attributes: [:name])
    end
end
