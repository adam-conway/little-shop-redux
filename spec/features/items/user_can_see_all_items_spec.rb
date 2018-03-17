RSpec.describe 'User' do
  describe 'visits items page' do
    it 'can see all items' do
      Item.create(title: 'Ian', description: 'help', price: 4.55, image: 'google.com')
      Item.create(title: 'a', description: 'b', price: 4.55, image: 'c.com')

      visit '/items'
      expect(page).to have_content('Ian')
      expect(page).to have_content(4.55)
    end
  end
end
