class Api::V1::ProductsController < ApplicationController
  respond_to :json

  def index
    respond_with Product.all

    render status: 200
  end

  def show
    respond_with Product.find(params[:id])

    render status: 200
  end

  def create
    product = current_user.products.build(product_params)
    if product.save
      render json: product, status: 201, location: [:api, product]
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  private
    def product_params
      fields = %i[name product_code quantity price brand_id]
      params.permit(product: fields)
    end
  end
end
