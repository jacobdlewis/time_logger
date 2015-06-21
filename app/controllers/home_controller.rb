class HomeController < ApplicationController
  def index
    if current_user
      @user = User.find(current_user.id)
      @time_entries = @user.time_entries.joins(:category).joins(:client)
    end
  end
end