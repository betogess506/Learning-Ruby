class StoreController < ApplicationController
  def index
    # Order products by their title
    @products = Product.order(:title)
  end
end
