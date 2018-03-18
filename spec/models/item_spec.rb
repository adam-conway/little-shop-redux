require 'pry'

RSpec.describe Item do
  describe 'Validations' do
    it 'is invalid without a title' do
      item = Item.create(description: 'so cool', price: 575.04, image: 'url')

      expect(item).to_not be_valid
    end

    it 'is invalid without a description' do
      item = Item.create(title: 'Adam', price: 575.04, image: 'url')

      expect(item).to_not be_valid
    end

    it 'is invalid without a price' do
      item = Item.create(title: 'Adam', description: 'so cool', image: 'url')

      expect(item).to_not be_valid
    end

    it 'is invalid without an image' do
      item = Item.create(title: 'Adam', description: 'so cool', price: 575.04)

      expect(item).to_not be_valid
    end
  end

  describe 'Valid validations' do
    it 'is valid with all params' do
      item = Item.create(title: 'Adam', description: 'so cool', price: 575.04, image: 'url')

      expect(item).to be_valid
    end
  end

  describe 'Returning invoices' do
    it 'Returns all invoices associated with item' do
      item = Item.create(id: 1, title: 'Adam', description: 'so cool', price: 575.04, image: 'url')
      invoice_item1 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 10, unit_price: 123)
      invoice_item2 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 15, unit_price: 15)
      invoice_item3 = InvoiceItem.create(item_id: 1, invoice_id: 3, quantity: 20, unit_price: 163)
      invoice1 = Invoice.create(status: 'Pending', merchant_id: 10)
      invoice2 = Invoice.create(status: 'Shipped', merchant_id: 15)
      invoice3 = Invoice.create(status: 'Testing', merchant_id: 12)

      expect(item.invoices.uniq.count).to eq 2
      expect(item.invoices.uniq).to eq [invoice2, invoice3]
    end
  end
end
