class ProductsController < ApplicationController

  def show
    @contentful_user = ContentfulUser.find(params[:contentful_user_id])
    @product = @contentful_user.product(params[:id])
  end

end
