require 'rails_helper'

RSpec.feature "Visitor adds product to cart from homepage, and navigates to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  "Good shirt",
      description: "It's good",
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    @category.products.create!(
      name:  "Old shirt",
      description: "It's old",
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 24.99
    )
    @category.products.create!(
      name:  "Expensive shirt",
      description: "It's expensive",
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 164.99
    )
      
    end

  scenario "They see all products then add the first product to their cart, navigate to their cart and see it there" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot "add_to_cart_test_homepage.png"

    # VERIFY
    expect(page).to have_css 'article.product', count: 3

    #ACT
    click_button('Add', match: :first)

    click_link('My Cart')
    
    sleep 1
    
    #DEBUG
    save_screenshot "add_to_cart_test_cart.png"
    
    #VERIFY
    expect(page).to have_content 'Expensive shirt'
    expect(page).to have_content 'TOTAL: $164.99'
    
  end
end