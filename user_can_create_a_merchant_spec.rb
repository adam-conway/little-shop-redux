RSpec.describe 'User' do
  describe 'visits a create merchant page' do
    it 'can edit the form' do
      visit '/merchants/new'
      fill_in 'merchant[name]', with: 'hello'
      click_button 'Create'

      expect(page).to have_content('hello')
      expect(current_path).to eq('/merchants')
      expect(Merchant.count).to eq(1)
    end
  end
end