class CategoriesController < ApplicationController

  def show
   @category = Category.find(params[:id])
  end

  def index
   @categories = Cateogry.all
  end

end
