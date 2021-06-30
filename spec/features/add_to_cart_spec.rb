require 'rails_helper'

RSpec.feature 'AddToCarts', type: :feature, js: true do
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

  scenario "Cart increments when user clicks 'Add to Cart'" do
    visit root_path

    first('.product').click_on('Add')
    expect(page).to have_content('My Cart (1)')
    save_screenshot 'add_to_cart.png'
  end
end
