RSpec.describe 'User' do
  describe 'visits a single merchant page' do
    it 'can see the specific merchant' do
      Merchant.create(name: 'Margaret')
      Merchant.create(name: 'a store')

      visit '/merchants/2'

      expect(page).to have_content('a store')
    end
  end
end
