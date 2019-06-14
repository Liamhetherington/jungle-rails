class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @ratings = @product.ratings.order(created_at: :desc)
    @current_user = current_user
  end

end
