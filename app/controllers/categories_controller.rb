class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def edit
  end

  def show
    @category = Category.find(params[:id])
  end

end
