class HomeController < ApplicationController
  def index
    if current_user && current_user.admin?
      redirect_to report_path
    end
    if current_user
      @user = User.find(current_user.id)
      if params[:duration] == "year"
        @time_entries = @user.time_entries.joins(:category).joins(:client).last_year
      elsif params[:duration] == "month"
        @time_entries = @user.time_entries.joins(:category).joins(:client).last_month
      else
        @time_entries = @user.time_entries.joins(:category).joins(:client).last_week
      end
    end
  end
end