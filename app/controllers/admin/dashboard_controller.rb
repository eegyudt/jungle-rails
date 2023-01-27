class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV["ADMIN_PASSWORD"]


  def show
    @product_count = Product.count(:all)
    @categories_count = Category.count(:all)
    @sales_count = Sale.count(:all)
  end

end
