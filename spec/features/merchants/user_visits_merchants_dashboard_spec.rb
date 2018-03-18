RSpec.describe 'User' do
  describe 'visits merchants dashboard' do
    it 'can see total number of items for each merchant' do
      merchant = Merchant.create(name: 'Margaret')
      item1 = Item.create(title: 'Ali', description: 'da bomb', price: 10, image: 'url', merchant_id: 1)
      item2 = Item.create(title: 'Ian', description: 'canadian', price: 20, image: 'url', merchant_id: 1)
      item3 = Item.create(title: 'Sal', description: 'kewl', price: 20, image: 'url', merchant_id: 2)

      visit '/merchants-dashboard'

      expect(page).to have_content(merchant.name)
      expect(page).to have_content(item1.title)
      expect(page).to have_content(item2.title)
      expect(page).to_not have_content(item3.title)
    end
    it 'can see average price of item for each merchant' do
      merchant = Merchant.create(name: 'Margaret')
      item1 = Item.create(title: 'Ali', description: 'da bomb', price: 10, image: 'url', merchant_id: 1)
      item2 = Item.create(title: 'Ian', description: 'canadian', price: 20, image: 'url', merchant_id: 1)
      item3 = Item.create(title: 'Sal', description: 'kewl', price: 30, image: 'url', merchant_id: 2)

      visit '/merchants-dashboard'
      save_and_open_page
      expect(page).to have_content(15)
    end
    it 'can see total price of all items for each merchant' do

    end
    it 'can see the merchant with the most items and that merchants information' do

    end
    it 'can see the merchant with the highest priced item and that merchants information' do

    end
  end
end
