RSpec.describe 'User' do
  describe 'visits merchant page' do
    it 'can see all merchants' do
      Merchant.create(name: 'Margaret')

      visit '/merchants'
      expect(page).to have_content('Margaret')
    end
  end
end
