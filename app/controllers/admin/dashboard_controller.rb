class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'],
                               password: ENV['ADMIN_PW']
  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
end
