RSpec.describe 'User' do
  describe 'visits a create item page' do
    it 'can edit the form' do
      visit '/items/new'
      fill_in 'item[title]', with: 'Adam'
      fill_in 'item[description]', with: 'Is the best'
      fill_in 'item[price]', with: 55.55
      fill_in 'item[image]', with: 'www.facebook.com'
      click_button 'Create'

      expect(page).to have_content('Is the best')
      expect(current_path).to eq('/items')
      expect(Item.count).to eq(1)
    end
  end
end
