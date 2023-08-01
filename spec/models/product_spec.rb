require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
# setup
before :each do
  @category = Category.new(name: "tree")
  @product = Product.new(
    name: "Test Product",
    price: 90,
    quantity: 9,
    category: @category
  )

end

it "should validates :name, presence: true" do
  @product.name = nil
  expect(@product.valid?).to be(false)
  expect(@product.errors.full_messages).to include("Name can't be blank")
end

it "should validates :price, presence: true" do
  @product.price = nil
  expect(@product.valid?).to be(false)
  expect(@product.errors.full_messages).to include("Price cents must be greater than 0")
end

it "should validates :quantity, presence: true" do
  @product.quantity = nil
  expect(@product.valid?).to be(false)
  expect(@product.errors.full_messages).to include("Quantity can't be blank")
end

it "should validates :quantity, presence: true" do
  @product.category = nil
  expect(@product.valid?).to be(false)
  expect(@product.errors.full_messages).to include("Category can't be blank")
end

it "Produce should save" do
  expect(@product.save).to be(true)
end
  end
end


