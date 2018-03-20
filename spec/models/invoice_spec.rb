RSpec.describe Invoice do
  describe 'Invalid validations' do
    it 'is invalid without any params' do
      invoice = Invoice.create

      expect(invoice).to_not be_valid
    end
    it 'is invalid without merchant id' do
      invoice = Invoice.create(status: 'pending')

      expect(invoice).to_not be_valid
    end
    it 'is invalid without status' do
      invoice = Invoice.create(merchant_id: 2)

      expect(invoice).to_not be_valid
    end
  end

  describe 'Valid validations' do
    it 'is valid with all params' do
      invoice = Invoice.create(status: 'pending', merchant_id: 3)

      expect(invoice).to be_valid
    end
  end

  describe 'Returning invoices' do
    it 'Returns all invoices associated with item' do
      invoice = Invoice.create(status: 'Pending', merchant_id: 10)
      invoice_item1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 10, unit_price: 123)
      invoice_item2 = InvoiceItem.create(item_id: 2, invoice_id: 1, quantity: 15, unit_price: 15)
      invoice_item3 = InvoiceItem.create(item_id: 3, invoice_id: 1, quantity: 20, unit_price: 163)
      item1 = Item.create(id: 1, title: 'Adam', description: 'so cool', price: 575.04, image: 'url')
      item2 = Item.create(id: 2, title: 'Help', description: 'test', price: 1.04, image: 'google')
      item3 = Item.create(id: 3, title: 'Margaret', description: 'not cool', price: 10.04, image: 'facebook')

      expect(invoice.items.uniq.count).to eq 3
      expect(invoice.items.uniq).to eq [item1, item2, item3]
    end
  end

  describe 'Class Methods' do
    context '.invoice_percentages' do
      it 'returns invoice status % for pending' do
        invoice1 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice2 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice3 = Invoice.create(status: 'shipped', merchant_id: 10)
        invoice4 = Invoice.create(status: 'shipped', merchant_id: 10)
        invoice5 = Invoice.create(status: 'returned', merchant_id: 10)

        expect(Invoice.pending_percentage).to eq(40)
      end
      it 'returns invoice status % for shipped' do
        invoice1 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice2 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice3 = Invoice.create(status: 'shipped', merchant_id: 10)
        invoice4 = Invoice.create(status: 'shipped', merchant_id: 10)
        invoice5 = Invoice.create(status: 'returned', merchant_id: 10)

        expect(Invoice.shipped_percentage).to eq(40)
      end
      it 'returns invoice status % for returned' do
        invoice1 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice2 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice3 = Invoice.create(status: 'shipped', merchant_id: 10)
        invoice4 = Invoice.create(status: 'shipped', merchant_id: 10)
        invoice5 = Invoice.create(status: 'returned', merchant_id: 10)

        expect(Invoice.returned_percentage).to eq(20)
      end
    end
    context '.unit_price' do
      it 'returns invoice with the highest associated unit price' do
        invoice1 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice2 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice_item1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 10, unit_price: 123)
        invoice_item2 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 15, unit_price: 15)
        invoice_item3 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 20, unit_price: 163)

        expect(Invoice.highest_unit_price).to eq(invoice2.id)
      end

      it 'returns invoice with the lowest associated unit price' do
        invoice1 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice2 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice_item1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 10, unit_price: 123)
        invoice_item2 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 15, unit_price: 80)
        invoice_item3 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 20, unit_price: 163)

        expect(Invoice.lowest_unit_price).to eq(invoice1.id)
      end
    end

    context '.quantity' do
      it 'returns invoice with the highest associated quantity' do
        invoice1 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice2 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice_item1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 10, unit_price: 123)
        invoice_item2 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 15, unit_price: 15)
        invoice_item3 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 20, unit_price: 163)

        expect(Invoice.highest_quantity).to eq(invoice1.id)
      end

      it 'returns invoice with the lowest associated quantity' do
        invoice1 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice2 = Invoice.create(status: 'pending', merchant_id: 10)
        invoice_item1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 10, unit_price: 123)
        invoice_item2 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 15, unit_price: 15)
        invoice_item3 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 20, unit_price: 163)

        expect(Invoice.lowest_quantity).to eq(invoice2.id)
      end
    end
  end
end
