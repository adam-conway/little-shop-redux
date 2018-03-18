RSpec.describe 'User' do
  describe 'visits merchants dashboard' do
    it 'can see total number of items for each merchant' do
      merchant = Merchant.create(name: 'Margaret')
      item1 = Item.create(title: 'Item1', description: 'blah', price: 10, image: 'url', merchant_id: 1)
      item2 = Item.create(title: 'Item2', description: 'words', price: 20, image: 'url', merchant_id: 1)
      item3 = Item.create(title: 'Item3', description: 'words', price: 20, image: 'url', merchant_id: 2)

      visit '/merchants-dashboard'
      expect(page).to have_content(merchant.name)
      expect(page).to have_content(item1.title)
      expect(page).to have_content(item2.title)
      expect(page).to_not have_content(item3.title)
    end
    it 'can see average price of item for each merchant' do

    end
    it 'can see total price of all items for each merchant' do

    end
    it 'can see the merchant with the most items and that merchants information' do

    end
    it 'can see the merchant with the highest priced item and that merchants information' do

    end
  end
end
