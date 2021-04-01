class Admin::DashboardController < ApplicationController
  # @admin_name = ENV['ADMIN_NAME'].to_s
  # @admin_password = ENV['ADMIN_PASSWORD'].to_s

  # http_basic_authenticate_with name: ENV['ADMIN_NAME'].to_s, password: ENV['ADMIN_PASSWORD'].to_s

  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @products = Product.all
    @categories = Category.all
  end
end
