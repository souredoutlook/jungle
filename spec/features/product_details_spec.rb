require 'rails_helper'

RSpec.feature "Visitor navigates from homepage to the product detail page by clicking on a product", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      
    end
  end

  scenario "They see all products then click the first product" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot "product_details_test_homepage.png"

    # VERIFY
    expect(page).to have_css 'article.product', count: 10

    #ACT
    click_link('Details »', match: :first)

    sleep 1 #=> wait until page has finished loading before taking screenshot

    #DEBUG
    save_screenshot "product_details_test_productpage.png"
    
    #VERIFY
    expect(page).to have_css 'article.product-detail', count: 1
  end
end