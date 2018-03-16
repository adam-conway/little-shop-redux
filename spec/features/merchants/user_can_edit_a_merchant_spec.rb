RSpec.describe 'User' do
  describe 'visits an edit merchant page' do
    it 'can edit a merchant' do
      merchant_1 = Merchant.create(name: 'Ian')

      visit "/merchants/#{merchant_1.id}/edit"
      fill_in 'merchant[name]', with: 'Ian, eh?'
      click_button 'Edit'

      expect(page).to have_content('Ian, eh?')
      expect(current_path).to eq("/merchants/#{merchant_1.id}")
      expect(Merchant.count).to eq(1)
    end
  end
end
