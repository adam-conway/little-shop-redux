RSpec.describe 'User' do
  describe 'visits a single invoice page' do
    it 'can see the specific invoice' do
      Merchant.create(name: 'Margaret')
      invoice_1 = Invoice.create(status: 'pending', merchant_id: 1)

      visit "/invoices/#{invoice_1.id}"

      expect(page).to have_content('pending')
    end
    it 'can link to its merchants page' do
      merchant = Merchant.create(name: 'Margaret')
      Invoice.create(status: 'pending', merchant_id: 1)

      visit '/invoices/1'

      expect(page).to have_content(merchant.name)
    end
    it 'lists associated items' do
      merchant = Merchant.create(name: 'Margaret')
      invoice = Invoice.create(status: 'pending', merchant_id: merchant.id)
      item = Item.create(title: 'Ali', description: 'tEaChEr', price: 2, image: 'google.com', merchant_id: merchant.id)
      InvoiceItem.create(invoice_id: invoice.id, item_id: item.id)

      visit '/invoices/1'

      expect(page).to have_content(item.id)
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.format_price)
    end
  end
end
