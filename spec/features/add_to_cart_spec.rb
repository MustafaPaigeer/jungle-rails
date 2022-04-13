require 'rails_helper'

RSpec.feature "Visitor clicks the Add to Cart button for a product on the home page and cart increases by one", type: :feature, js: true do

  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(5),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Cart item count will increase by 1" do
    #ACT
    visit root_path
    first('article.product').click_on('Add')
    sleep(5)
    # DEBUG
    save_screenshot "add_to_cart.png"

    #VERIFY
    expect(page).to have_content 'My Cart (1)'
  end

end