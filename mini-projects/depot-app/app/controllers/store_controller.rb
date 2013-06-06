class StoreController < ApplicationController
  def index
    # Order products by their title
    @products = Product.order(:title)

    unless session[:counter].nil?
      session[:counter] += 1
    else
      session[:counter] = 1
    end

    @count = session[:counter]

  end
end
