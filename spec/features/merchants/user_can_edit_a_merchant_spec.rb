RSpec.describe 'User' do
  describe 'visits an edit merchant page' do
    it 'can edit a merchant' do
      Merchant.create(name: 'Ian')

      visit '/merchants/1/edit'
      fill_in "merchant[name]", with: 'Ian, eh?'
      click_button 'Update Merchant'

      expect(page).to have_content('Ian, eh?')
      expect(current_path).to eq('/merchants/1')
      expect(Merchant.count).to eq(1)
    end
    it 'can cancel and go back to merchant' do
      Merchant.create(name: 'Ian')

      visit '/merchants/1/edit'
      click_button 'Cancel'

      expect(page).to have_content('Ian')
      expect(current_path).to eq('/merchants/1')
      expect(Merchant.count).to eq(1)
    end
  end
end
