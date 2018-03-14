RSpec.describe 'User' do
  describe 'visits merchant page' do
    Merchant.create(name: 'Margaret')
    visit '/merchants'

    expect(page).to have_content('Margaret')
  end
end
