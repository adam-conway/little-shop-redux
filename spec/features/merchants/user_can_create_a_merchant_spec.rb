RSpec.describe 'User' do
  describe 'visits a create merchant page' do
    it 'can see the form' do
      visit '/merchants/new'
      expect(page).to have_content('Create a new merchant:')
    end

    it 'can edit the form' do
      visit '/merchants/new'
      fill_in "Merchant[name]", with: 'hello'
      click_button('Submit')

      expect(page).to have_content('hello')
      expect(current_path). eq ('/merchants/1')
      expect(Merchant.count).to eq(1)
    end
  end
end
