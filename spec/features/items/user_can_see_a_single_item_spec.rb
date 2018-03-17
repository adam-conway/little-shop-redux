RSpec.describe 'User' do
  describe 'visits a single item page' do
    it 'can see the specific item' do
      item_1 = Item.create(title: 'Ian', description: 'help', price: 4.55, image: 'google.com')

      visit "/items/#{item_1.id}"

      expect(page).to have_content('help')
    end
  end
end
