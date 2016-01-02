class TimeEntriesController < ApplicationController

  before_filter :load_time_entry

  def new
    @clients = Client.all
    @time_entry = TimeEntry.new
    @categories = Category.all
    @projects = Project.all
  end

  def edit
    @categories = Category.all
    @clients = Client.all
    @projects = Project.all
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    @time_entry.user_id = current_user.id
    binding.pry
    if @time_entry.save
      redirect_to root_path, notice: "Your time for #{@time_entry.date.strftime("%A, %B %d, %Y")} was saved successfully."
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  def update
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.assign_attributes(time_entry_params)
    if @time_entry.save
      redirect_to user_time_entry_path(current_user, @time_entry.id), 
      notice: "Your entry was updated successfully"
    else
      flash.alert = "Please fix the errors below to continue."
      render :edit
    end
  end

  def index
    @user = current_user
    @time_entries = (@user.time_entries.order('date desc')).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @time_entry = TimeEntry.find(params["id"])
  end

  protected

  def time_entry_params
    params.require(:time_entry).permit(:date, :activity_id, :comment, :area, :business_mileage, :personal_mileage, :hours_worked, :project_id)
  end

  def load_time_entry
    if params[:id].present?
      @time_entry = TimeEntry.find(params[:id])
    else
      @time_entry = TimeEntry.new
    end
  end

end
