require 'rails_helper'

RSpec.feature "clicking a products Details button opens Product's Details page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product Details" do
    # ACT
    visit root_path
    first('.actions').click_on("Details")

    # DEBUG 
    save_and_open_screenshot

    # VERIFY
    expect(page).to have_content('Description')
  end

end
