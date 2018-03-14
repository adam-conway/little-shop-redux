RSpec.describe 'User' do
  describe 'visits an edit item page' do
    it 'can edit an item' do
      Item.create(title: 'Adam', description: 'so cool', price: 575.04, image: 'url')

      visit '/items/1/edit'
      fill_in "item[title]", with: 'Margaret'
      click_button 'Edit'

      expect(page).to have_content('Margaret')
      expect(current_path).to eq('/items/1')
      expect(Item.count).to eq(1)
    end
  end
end
