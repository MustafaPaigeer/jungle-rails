require 'rails_helper'

RSpec.feature "users can navigate from the home page to the product detail page by clicking on a product. ", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    5.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 50,
        price: 70
      )
    end
  end

  scenario "User click on the first product" do
    # ACT
    visit root_path

    # DEBUG / VERIFY

    first('a.btn.btn-default').click
    expect(page).to have_css 'article.product', count: 5
    expect(page).to have_css '.product-detail'
    expect(page).to have_content 'Apparel'
    save_screenshot "product_details_1.png"
  end

end