require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid if all 4 fields are filled out' do
      @category = Category.new
      params = {
        name: 'Federer',
        description: 'wimbledon starts today',
        quantity: 11,
        category: @category,
        price_cents: 999,
      }
      expect(Product.new(params)).to be_valid
    end

    it 'is not valid without a name' do
      @category = Category.new
      params = {
        description: 'wimbledon starts today',
        quantity: 11,
        category: @category,
        price_cents: 999,
      }
      expect(Product.new(params)).to_not be_valid
    end

    it 'is not valid without a price' do
      @category = Category.new
      params = {
        name: 'tennis channel',
        description: 'wimbledon starts today',
        quantity: 11,
        category: @category,
      }
    end

    it 'is not valid without a quantity' do
      @category = Category.new
      params = {
        name: 'tennis channel',
        description: 'wimbledon starts today',
        category: @category,
        price_cents: 999,
      }
    end

    it 'is not valid without a category' do
      @category = Category.new
      params = {
        name: 'tennis channel',
        description: 'wimbledon starts today',
        quantity: 11,
        price_cents: 999,
      }
    end
  end
end
