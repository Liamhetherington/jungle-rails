require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is not valid without a name, price, quantity and a category" do
      product = Product.new(name: "Liam", price: 400, quantity: 20, category: Category.new)
      expect(product).to be_valid
    end
    it "is not valid without a name" do
      product = Product.create(name: nil)
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it 'is not valid without a price' do
      product = Product.create(price: nil)
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it 'is not valid without a quantity' do
      product = Product.create(quantity: nil)
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'is not valid without a category' do
      product = Product.create(category: nil)
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
