RSpec.describe 'User' do
  describe 'visits items page' do
    it 'can see all items' do
      Item.create(title: 'Ian', description: 'help', price: 4.55, image: 'google.com')
      Item.create(title: 'a', description: 'b', price: 4.55, image: 'c.com')

      visit '/items'
      expect(page).to have_content('Ian')
      expect(page).to have_content(4.55)
    end
    it 'can navigate to the items dashboard' do
      Item.create(title: 'Ian', description: 'help', price: 4.55, image: 'google.com')

      visit '/items'
      click_link('Items Dashboard')
      expect(current_path).to eq('/items-dashboard')
    end
    it 'can navigate to the create new item page' do
      Item.create(title: 'Ian', description: 'help', price: 4.55, image: 'google.com')

      visit '/items'
      click_on('Create A New Item')

      expect(current_path).to eq('/items/new')
    end
    it 'can delete item from page' do
      Item.create(title: 'Ian', description: 'help', price: 4.55, image: 'google.com')

      visit '/items'
      click_on('delete')

      expect(current_path).to eq('/items')
      expect(page).to_not have_content('Ian')
    end
  end
end
