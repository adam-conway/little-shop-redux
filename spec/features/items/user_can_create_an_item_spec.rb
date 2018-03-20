RSpec.describe 'User' do
  describe 'visits a create item page' do
    it 'can edit the form' do
      merchant = Merchant.create(name: 'Margaret')
      merchant2 = Merchant.create(name: 'Help')
      visit '/items/new'
      fill_in 'item[title]', with: 'Adam'
      fill_in 'item[description]', with: 'Is the best'
      fill_in 'item[price]', with: 55.55
      fill_in 'item[image]', with: 'www.facebook.com'
      select('Help', from: 'merchants')
      click_button 'Create'

      expect(page).to have_content('Adam')
      expect(page).to have_content('$55.55')
      expect(current_path).to eq('/items')
      expect(Item.count).to eq(1)
      expect(Item.find(1).merchant_id).to eq(merchant2.id)
    end
    it 'can cancel' do
      merchant = Merchant.create(name: 'v cool merchant')
      merchant2 = Merchant.create(name: 'another awesome merchant')
      visit '/items/new'
      click_button 'Cancel'

      expect(current_path).to eq('/items')
    end
  end
end
