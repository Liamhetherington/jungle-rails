class RatingsController < ApplicationController
  def create 
    @product = Product.find params[:product_id]
    @rating = @product.ratings.new(rating_params)
    @rating.user = current_user 
    @rating.save!
    redirect_to product_url(@product)
  end
  
  def destroy
    @product = Product.find params[:product_id]
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to @product
  end 

  def rating_params
    params.require(:rating).permit(
      :product_id, 
      :description, 
      :rating)
  end

  before_filter :require_login

  def logged_in?
    current_user !=nil
  end

  def require_login
    @product = Product.find params[:product_id]
    unless logged_in?
      redirect_to '/login'
    end
  end


end
