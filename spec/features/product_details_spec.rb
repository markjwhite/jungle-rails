require 'rails_helper'

RSpec.feature 'ProductDetails', type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg'),
      )
    end
  end

  scenario 'User views product details after clicking on a product' do
    visit root_path

    first('.product > header').click
    expect(page).to have_css 'section.products-show'
    save_screenshot 'product_details.png'
  end
end
