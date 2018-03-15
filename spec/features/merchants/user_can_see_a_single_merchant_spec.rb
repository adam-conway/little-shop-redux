RSpec.describe 'User' do
  describe 'visits a single merchant page' do
    it 'can see the specific merchant' do
      merchant_1 = Merchant.create(name: 'Margaret')
      merchant_2 = Merchant.create(name: 'a store')

      visit "/merchants/#{merchant_2.id}"

      expect(page).to have_content('a store')
    end
  end
end
