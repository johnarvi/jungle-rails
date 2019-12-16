require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do

    # can set the following code to instantize the @product and category rather than doing it at each test
    # before(:each) do 
    #   @category = Category.new(id: 1, name: 'Apparel')
    #   @product = Product.new(name: "Dude", price: 1000, quantity: 5, category: @category)
    # end

    it "is valid when all fields are filled" do
      @category = Category.new(id: 1, name: 'Apparel')
      @product = Product.new(name: "Dude", price: 1000, quantity: 5, category: @category)
      expect(@product).to be_valid
    end
  
    it "is not valid without a name" do
      @category = Category.new(id: 1, name: 'Apparel')
      @product = Product.new(name: "Dude", price: 1000, quantity: 5, category: @category)
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new(id: 1, name: 'Apparel')
      @product = Product.new(name: "Dude", price: 1000, quantity: 5, category: @category)
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new(id: 1, name: 'Apparel')
      @product = Product.new(name: "Dude", price: 1000, quantity: 5, category: @category)
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @category = Category.new(id: 1, name: 'Apparel')
      @product = Product.new(name: "Dude", price: 1000, quantity: 5, category: @category)
      @product.category = nil
      expect(@product).to_not be_valid
    end
    
  end
end
