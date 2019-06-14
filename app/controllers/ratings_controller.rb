class RatingsController < ApplicationController
  def create 
    @product = Product.find params[:product_id]
    @rating = @product.ratings.new(rating_params)
    @rating.user = current_user 
    @rating.save!
    redirect_to product_url(@product)
  end
  
 

  def rating_params
    params.require(:rating).permit(
      :product_id, 
      :description, 
      :rating)
  end

end
