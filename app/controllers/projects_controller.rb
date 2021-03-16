class ProjectsController < ApplicationController
    layout "project"

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def order_by_project_due_date
        @projects = Project.order_by_project_due_date
        render :index
    end

    def new
        @project = Project.new
        @rooms = Room.all
        @project.build_room
        @tools = Tool.all
        @project.tools.build
    end

    def create
        @project = Project.new(project_params)
        @tool = Tool.create(params[:project][:tools_attributes][:name])
        if @project.save
            if @tool.valid?
                Builder.create(project_id: @project.id, tool_id: @tool.id)
            end
               redirect_to project_path(@project)
        else
            redirect_to new_project_path
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
            room_attributes: [:name],
            tool_ids: [],
            tools_attributes: [:name])
    end
end
