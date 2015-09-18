class ProjectsController < ApplicationController
  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "#{@project.name} was created successfully!"
    else
      flash.alert = "Please fix the errors below to continue."
      render :edit
    end
  end

  def index
    @projects = Project.all
  end

  def update
  end

  protected

  def project_params
    params.require(:project).permit(:name, :client_id)
  end

end
