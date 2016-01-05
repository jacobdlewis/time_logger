class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order('name asc')
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:notice] = "Activity created successfully."
      redirect_to activities_path
    else
      flash[:error] = "Activity not created."
      redirect_to :back
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      flash[:notice] = "Activity udated successfully."
      redirect_to activities_path
    else
      flash[:error] = "Activity not updated"
      redirect_to :back
    end
  end

  protected

  def activity_params
    params.require(:activity).permit(:name)
  end
end
