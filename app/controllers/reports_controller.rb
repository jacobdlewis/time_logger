class ReportsController < ApplicationController
  def show
    if params[:duration] == "year"
      @time_entries = TimeEntry.unscoped.all.joins(:user).joins(:category).joins(:client).last_year
    elsif params[:duration] == "month"
      @time_entries = TimeEntry.unscoped.all.joins(:user).joins(:category).joins(:client).last_month
    else
      @time_entries = TimeEntry.all.joins(:user).joins(:category).joins(:client)
    end
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition']="attachment; filename=\"time_log_report\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def employees
    @employees = User.all
  end
end