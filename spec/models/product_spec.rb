require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "checks that product name must be entered when creating a new product" do
      @category = Category.create(name: "Trees")
      @product = Product.create(
        # name: "elm",
        price: 10,
        quantity: 2,
        category: @category
      )
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  end

  it "checks that product can be created and saved" do
    @category = Category.create(name: "Trees")
    @product = Product.create(
      name: "elm",
      price: 10,
      quantity: 2,
      category: @category
    )
    expect(@product).to be_valid
  end

  it "checks that product price must be entered when creating new product" do
    @category = Category.create(name: "Trees")
    @product = Product.create(
      name: "elm",
      # price: 10,
      quantity: 2,
      category: @category
    )
    expect(@product.errors.full_messages).to include("Price cents is not a number")
  end

  it "checks that product quantity must be entered when creating new product" do
    @category = Category.create(name: "Trees")
    @product = Product.create(
      name: "elm",
      price: 10,
      # quantity: 2,
      category: @category
    )
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end

  it "checks that product price must be entered when creating new product" do
    @category = Category.create(name: "Trees")
    @product = Product.create(
      name: "elm",
      price: 10,
      quantity: 2,
      category: @category
    )
    expect(@category).to be_valid
  end
end

