RSpec.describe 'User' do
  describe 'visits merchants index page' do
    it 'can delete a merchant' do
      Merchant.create(name: 'Ian')

      visit '/merchants'
      click_button 'delete'
      expect(current_path).to eq('/merchants')
      expect(Merchant.count).to eq(0)
    end
  end
  describe 'visits a specific merchant page' do
    it 'can delete a merchant' do
      Merchant.create(name: 'Ian')
      merchant_2 = Merchant.create(name: 'Ali')

      visit "merchants/#{merchant_2.id}"
      click_button 'delete'

      expect(current_path).to eq('/merchants')
      expect(Merchant.count).to eq(1)
    end
  end
end
