class Admin::DashboardController < ApplicationController
  def show
    @total_count_of_products = Product.all.count
    @total_count_of_categories = Category.all.count
  end
end
