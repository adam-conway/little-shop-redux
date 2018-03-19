RSpec.describe 'User' do
  describe 'visits merchants dashboard' do
    it 'can see total number of items for each merchant' do
      merchant1 = Merchant.create(name: 'Margaret')
      merchant2 = Merchant.create(name: 'Adam')
      item1 = Item.create(title: 'Ali', description: 'da bomb', price: 10, image: 'url', merchant_id: 1)
      item2 = Item.create(title: 'Ian', description: 'canadian', price: 20, image: 'url', merchant_id: 1)
      item3 = Item.create(title: 'Sal', description: 'kewl', price: 20, image: 'url', merchant_id: 2)

      visit '/merchants-dashboard'

      expect(page).to have_content(merchant1.name)
      expect(page).to have_content('Item Count: 2')
    end
    it 'can see average price of item for each merchant' do
      merchant1 = Merchant.create(name: 'Margaret')
      merchant2 = Merchant.create(name: 'Adam')
      item1 = Item.create(title: 'Ali', description: 'da bomb', price: 10, image: 'url', merchant_id: 1)
      item2 = Item.create(title: 'Ian', description: 'canadian', price: 20, image: 'url', merchant_id: 1)
      item3 = Item.create(title: 'Sal', description: 'kewl', price: 30, image: 'url', merchant_id: 2)

      visit '/merchants-dashboard'

      expect(page).to have_content('Average Item Price: 15')
    end
    it 'can see total price of all items for each merchant' do
      Merchant.create(name: 'Margaret')
      Merchant.create(name: 'Adam')
      Item.create(title: 'Ali', description: 'da bomb', price: 10, image: 'url', merchant_id: 1)
      Item.create(title: 'Ian', description: 'canadian', price: 20, image: 'url', merchant_id: 1)
      Item.create(title: 'Sal', description: 'kewl', price: 30, image: 'url', merchant_id: 2)

      visit '/merchants-dashboard'
      
      expect(page).to have_content('Total Cost of Items: 30')

    end
    it 'can see the merchant with the most items and that merchants information' do
      merchant1 = Merchant.create(name: 'Margaret')
      Merchant.create(name: 'Adam')
      Item.create(title: 'Ali', description: 'da bomb', price: 10, image: 'url', merchant_id: 1)
      Item.create(title: 'Ian', description: 'canadian', price: 20, image: 'url', merchant_id: 1)
      Item.create(title: 'Sal', description: 'kewl', price: 30, image: 'url', merchant_id: 2)

      visit '/merchants-dashboard'

      expect(page).to have_content("Merchant With Most Items: #{merchant1.name}")
    end
    it 'can see the merchant with the highest priced item and that merchants information' do
      merchant1 = Merchant.create(name: 'Margaret')
      merchant2 = Merchant.create(name: 'Adam')
      Item.create(title: 'Ali', description: 'da bomb', price: 10, image: 'url', merchant_id: 1)
      Item.create(title: 'Ian', description: 'canadian', price: 20, image: 'url', merchant_id: 1)
      Item.create(title: 'Sal', description: 'kewl', price: 30, image: 'url', merchant_id: 2)

      visit '/merchants-dashboard'

      expect(page).to have_content("Merchant With Highest Priced Items: #{merchant2.name}")

    end
  end
end
