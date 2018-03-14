RSpec.describe 'User' do
  describe 'visits an edit merchant page' do
    it 'can edit a merchant' do
      Merchant.create(name: 'REI')

      visit '/merchants/1/edit'
      fill_in 'merchant[name]', with: 'REI, yo!'
      click_button 'Edit'

      expect(page).to have_content('REI, yo!')
      expect(current_path).to eq('/merchants/1')
      expect(Merchant.count).to eq(1)
    end
  end
end
