class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "#{@category.name} was saved successfully."
    else
      flash.alert = "Please fix the errors below to continue."
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "#{@category.name} was deleted successfully."
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.assign_attributes(category_params)
    if @category.save
      redirect_to categories_path, notice: "#{@category.name} was updated successfully."
    else
      flash.alert = "Please fix the errors below to continue."
    end
  end

  protected

  def category_params
    params.require(:category).permit(:name)
  end

end
