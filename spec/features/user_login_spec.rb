require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do 
  before :each do
    @category = Category.create! name: 'Apparel'
    @user = User.create!(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
    
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
    click_on "Login"
    fill_in 'email', with:'dude@g.com'
    fill_in 'password', with:'baluTheBear'
    click_on "Submit"
    # DEBUG 
    save_and_open_screenshot

    # VERIFY
    expect(page).to have_content('Logout')
  end
end
