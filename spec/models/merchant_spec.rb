RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.create

      expect(merchant).to_not be_valid
    end
  end

  describe 'Valid validations' do
    it 'is valid with all params' do
      merchant = Merchant.create(name: 'Adam')

      expect(merchant).to be_valid
    end
  end

  describe 'Class Methods' do
    context '.most_items' do
      it 'returns the merchant with the most items' do
        merchant1 = Merchant.create(name: 'Margaret')
        merchant2 = Merchant.create(name: 'Adam')
        item1 = Item.create(title: 'Ali', description: 'da bomb', price: 10, image: 'url', merchant_id: 1)
        item2 = Item.create(title: 'Ian', description: 'canadian', price: 20, image: 'url', merchant_id: 1)
        item3 = Item.create(title: 'Sal', description: 'kewl', price: 30, image: 'url', merchant_id: 2)

        expect(Merchant.most_items).to eq(merchant1)
      end
    end
    context '.highest_priced_item' do
      it 'returns the merchant with the highest priced item' do
        merchant1 = Merchant.create(name: 'Margaret')
        merchant2 = Merchant.create(name: 'Adam')
        item1 = Item.create(title: 'Ali', description: 'da bomb', price: 10, image: 'url', merchant_id: 1)
        item2 = Item.create(title: 'Ian', description: 'canadian', price: 20, image: 'url', merchant_id: 1)
        item3 = Item.create(title: 'Sal', description: 'kewl', price: 30, image: 'url', merchant_id: 2)

        expect(Merchant.highest_priced_item.name).to eq(merchant2.name)
      end
    end
  end
end
