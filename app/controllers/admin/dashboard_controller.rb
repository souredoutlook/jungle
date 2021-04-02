class Admin::DashboardController < Admin::BaseController
  def show
    @products = Product.count
    @categories = Category.count
    @users = User.count
  end
end
