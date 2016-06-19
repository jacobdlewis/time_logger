class ReportsController < ApplicationController
  def projects
    @projects = Project.includes(:client).active.order("clients.last_name")
  end

  def detail_report
    @project = Project.find(params[:format])
    @time_entries = @project.time_entries.joins(:activity)
    @activity_totals = {}
    @user_totals = {}
    @user_totals[:Total] = @time_entries.sum(:hours_worked)
    @activity_totals[:Total] = @time_entries.sum(:hours_worked)
    Activity.all.each do |activity|
      @activity_totals["#{activity.name}".to_sym] = @time_entries.where(activity_id: activity.id).sum(:hours_worked)
    end
    User.all.each do |user|
      @user_totals["#{user.name}".to_sym] = @time_entries.where(user_id: user.id).sum(:hours_worked)
    end
  end

end

# def show
#   if params[:duration] == "year"
#     @time_entries = TimeEntry.unscoped.all.joins(:user).joins(:category).joins(:client).last_year
#   elsif params[:duration] == "month"
#     @time_entries = TimeEntry.unscoped.all.joins(:user).joins(:category).joins(:client).last_month
#   else
#     @time_entries = TimeEntry.unscoped.all.joins(:user).joins(:category).joins(:client).last_week
#   end
#   respond_to do |format|
#     format.html
#     format.csv do
#       headers['Content-Disposition']="attachment; filename=\"time_log_report\""
#       headers['Content-Type'] ||= 'text/csv'
#     end
#   end
# end

# def employees
#   @employees = User.all
# end

# def employee_report
#   @user = User.find(params[:id])
#   if params[:duration] == "year"
#     @time_entries = @user.time_entries.joins(:category).joins(:client).last_year
#   elsif params[:duration] == "month"
#     @time_entries = @user.time_entries.joins(:category).joins(:client).last_month
#   else
#     @time_entries = @user.time_entries.joins(:category).joins(:client).last_week
#   end
# end
