require_relative './admin_authentication_controller.rb'

class Admin::DashboardController < AdminAuthentication
  def show
    @products = Product.all
    @categories = Category.all
  end
end
