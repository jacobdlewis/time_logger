class ReportsController < ApplicationController
  def show
    @time_entries = TimeEntry.all.joins(:user).includes(:category).joins(:client)
  end
end