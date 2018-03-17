RSpec.describe 'User' do
  describe 'visits items dashboard' do
    it 'can see total count of items ' do
      Item.create(title: 'ABC', description: 'its easy as', price: 123, image: 'bing.com')
      Item.create(title: 'a', description: 'b', price: 125, image: 'c.com')

      visit '/items-dashboard'
      expect(page).to have_content('Total Item Count')
      expect(page).to have_content(2)
    end
    it 'can see avg price per item' do
      Item.create(title: 'ABC', description: 'its easy as', price: 123, image: 'bing.com')
      Item.create(title: 'a', description: 'b', price: 125, image: 'c.com')

      visit '/items-dashboard'
      expect(page).to have_content('Average Price Per Item')
      expect(page).to have_content(124)
    end
  end
end
