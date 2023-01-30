require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
          
    before do

    @category = Category.new(id:1, name: "Winter Trees")
    @product = Product.new(id: 1, name:"Apple Tree", description: "Yummilicous apples all year long!", price_cents: 8750, quantity: 150, category: @category)

    end
    
      it "is a valid product" do
        expect(@product).to be_valid
      end

      it "should have a valid name" do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end  

      it "should have a valid price" do
        @product.price_cents = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it "should have a valid quantity" do
        @product.quantity = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end

      it "should have a valid category" do
        @product.category = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

  end
end


# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true


# t.string "name"
# t.text "description"
# t.string "image"
# t.integer "price_cents"
# t.integer "quantity