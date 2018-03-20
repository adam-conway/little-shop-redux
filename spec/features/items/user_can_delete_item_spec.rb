RSpec.describe 'User' do
  describe 'visits items index page' do
    it 'can delete an item' do
      Item.create(title: 'Ian', description: 'help', price: 4.55, image: 'google.com')

      visit '/items'
      click_button 'delete'
      expect(current_path).to eq('/items')
      expect(Item.count).to eq(0)
    end
  end
  describe 'visits a specific item page' do
    it 'can delete an item' do
      Item.create(title: 'Ian', description: 'help', price: 4.55, image: 'google.com')
      item_2 = Item.create(title: 'a', description: 'b', price: 4.55, merchant_id: 1, image: 'c.com')
      merchant = Merchant.create(name: 'Adam')

      visit "items/#{item_2.id}"
      click_button 'delete'

      expect(current_path).to eq('/items')
      expect(Item.count).to eq(1)
    end
  end
end
