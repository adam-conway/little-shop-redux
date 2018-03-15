RSpec.describe 'User' do
  describe 'visits a single item page' do
    it 'can see the specific item' do
      Item.create(title: 'Ian', description: 'help', price: 4.55, image: 'google.com')

      visit '/items/1'

      expect(page).to have_content('help')
    end
  end
end
