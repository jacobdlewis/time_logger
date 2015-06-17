class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path, notice: "#{@category.name} was saved successfully."
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  protected

  def category_params
    params.require(:category).permit(:name)
  end

end
