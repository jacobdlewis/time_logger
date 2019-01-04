class HomeController < ApplicationController
  def index
    redirect_to new_user_time_entry_path(current_user) if current_user 
  end
end