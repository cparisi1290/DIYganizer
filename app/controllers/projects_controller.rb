class ProjectsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_project, only: [:show, :edit, :update, :destroy] 
    layout "project"

    def index
        if params[:room_id] && @room = Room.find(params[:room_id])
            @projects = @room.projects
        else
            @projects = current_user.projects.all
        end
    end

    def show
    end

    def order_by_project_due_date
        @project_user = Project.filter_by_user_id(current_user.id)
        @projects = Project.filter_by_goal_date(@project_user)
        render :index
    end

    def new
        if params[:room_id] && @room = Room.find(params[:room_id])
            @project = Project.new(room_id: params[:room_id])
            # @rooms = Room.all
            # @project = @room.projects.build
            3.times { @project.tools.build }
        else
        @project = Project.new
        @rooms = Room.all
        @project.build_room
        3.times { @project.tools.build }
        end
    end

    def create
        if params[:room_id] && room = Room.find_by_id(params[:room_id])
            @room = Room.find(params[:room_id])
            @project = current_user.projects.build(project_params)
        end
        @project = current_user.projects.build(project_params)
        @tool = Tool.create(params[:project][:tools_attributes][:name])
    
        if @project.save
            if @tool.valid?
                Builder.create(project_id: @project.id, tool_id: @tool.id)
            end
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @project.update(project_params)
        if @project.valid?
            redirect_to project_path(@project)
        else
            render :edit 
        end
    end

    def destroy
        @project.destroy
        redirect_to projects_path 
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

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
