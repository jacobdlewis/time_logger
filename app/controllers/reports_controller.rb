class ReportsController < ApplicationController
  def show
    @time_entries = TimeEntry.all.includes(:user).includes(:category).joins(:client)
  end
end