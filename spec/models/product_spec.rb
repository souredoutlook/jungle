require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:all) do
      @category = Category.create(name: "Widgets")
    end

    it("will fail if name is blank") do
      product = Product.new(name: "", price: 1, quantity: 1, category: @category)

      product.save

      expect(product.errors.full_messages.length).to eq(1)
      expect(product.errors.full_messages.first).to eql("Name can't be blank")
    end
   
    it("will faill if price is not a number") do
      product = Product.new(name: "2nd widget", price: nil, quantity: 2, category: @category)

      product.save

      expect(product.errors.full_messages.length).to eq(3)
      expect(product.errors.full_messages.first).to eql("Price cents is not a number")
      expect(product.errors.full_messages.second).to eql("Price is not a number")
      expect(product.errors.full_messages.last).to eql("Price can't be blank")
    end

    # validates :quantity, presence: true
    it("will fail if quantity is blank") do
      product = Product.new(name: "3rd widget", price: 3, quantity: "", category: @category)

      product.save

      expect(product.errors.full_messages.length).to eq(1)
      expect(product.errors.full_messages.first).to eql("Quantity can't be blank")
    end

    # validates :category, presence: true
      # validates :quantity, presence: true
      it("will fail if quantity is blank") do
        product = Product.new(name: "4th widget", price: 4, quantity: 4)
  
        product.save
  
        expect(product.errors.full_messages.length).to eq(1)
        expect(product.errors.full_messages.first).to eql("Category can't be blank")
      end
    
    it("creates returns a product if all fields are valid") do
      product = Product.new(name: "widget", price: 100, quantity: 100, category: @category)

      product.save!

      expect(product.id).not_to be_nil
    end
  end
end
