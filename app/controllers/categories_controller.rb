class CategoriesController < ApplicationController

  def show
    # raise 'here' allows for debugging
    @category = Category.find(params[:id])
    # raise @category.inspect
    # raise + inpect above shows the ibnstance of the object.
    @products = @category.products.order(created_at: :desc)
  end

end
