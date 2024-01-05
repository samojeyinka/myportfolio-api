class Api::V1::ProjectsController < ApplicationController
    before_action :find_project, only: [:show, :update, :destroy]
def index
    @projects = Project.all
    render json: @projects, each_serializer:Api::V1::ProjectSerializer
end


def show
    render json: @project, serializer:Api::V1::ProjectSerializer
end

def create
    @project = Project.new(project_params)
    if @project.save
        render json: @project
    else
        render json: @project.errors.full_messages, status: :unprocessable_entity
    end
end

def update
    if @project.update(project_params)
        render json: @project
    else
        render json: @project.errors.full_messages, status: :unprocessable_entity
    end

end

def destroy
    if @project.destroy
        render json: { message: "Deleted successfully" }, status: :ok
    else
        render json: { error: "Unable to delete project" }, status: :unprocessable_entity
    end
end

private

def find_project 
    @project = Project.find(params[:id])
end   

def project_params
    params.require(:project).permit(:name, :description, :details, :live_preview_link, :source_code_link, :image)
end

end
