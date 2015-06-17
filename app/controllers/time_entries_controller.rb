class TimeEntriesController < ApplicationController

  before_filter :load_time_entry

  def new
    @time_entry = TimeEntry.new
  end

  def edit
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    @time_entry.user_id = current_user.id
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
      redirect_to user_time_entry_path(current_user.id, @time_entry.id), 
      notice: "Your entry was updated successfully"
    else
      flash.alert = "Please fix the errors below to continue."
      render :edit
    end
  end

  def index
    @user = User.find(current_user.id)
    @time_entries = @user.time_entries
  end

  def show
    @time_entry = TimeEntry.find(params["id"])
  end

  protected

  def time_entry_params
    params.require(:time_entry).permit(:date, :client_id, :category_id, :comment, :area, :business_mileage, :personal_mileage, :hours_worked)
  end

  def load_time_entry
    if params[:id].present?
      @time_entry = TimeEntry.find(params[:id])
    else
      @time_entry = TimeEntry.new
    end
  end

end
