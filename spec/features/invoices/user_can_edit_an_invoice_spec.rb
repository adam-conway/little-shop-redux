RSpec.describe 'User' do
  describe 'visits an edit invoice page' do
    it 'can edit a invoice' do
      Merchant.create(name: 'store')
      invoice_1 = Invoice.create(status: 'pending', merchant_id: 1)

      visit "/invoices/#{invoice_1.id}/edit"
      select 'Shipped'
      click_button 'Edit'

      expect(page).to have_content('Shipped')
      expect(current_path).to eq("/invoices/#{invoice_1.id}")
      expect(Invoice.count).to eq(1)
    end

    it 'can cancel editing a invoice' do
      Merchant.create(name: 'store')
      invoice_1 = Invoice.create(status: 'pending', merchant_id: 1)

      visit 'invoices/1/edit'
      click_on 'cancel'

      expect(current_path).to eq("/invoices/1")
    end

    it 'lists associated items' do
      merchant = Merchant.create(name: 'Margaret')
      invoice = Invoice.create(status: 'pending', merchant_id: merchant.id)
      item = Item.create(title: 'Ali', description: 'tEaChEr', price: 2, image: 'google.com', merchant_id: merchant.id)
      InvoiceItem.create(invoice_id: invoice.id, item_id: item.id)

      visit '/invoices/1/edit'

      expect(page).to have_content(item.id)
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.format_price)
    end
    it 'can click through to item page' do
      merchant = Merchant.create(name: 'Margaret')
      invoice = Invoice.create(status: 'pending', merchant_id: merchant.id)
      item = Item.create(title: 'Ali', description: 'tEaChEr', price: 2, image: 'google.com', merchant_id: merchant.id)
      InvoiceItem.create(invoice_id: invoice.id, item_id: item.id)

      visit '/invoices/1/edit'
      click_on '1'

      expect(current_path).to eq('/items/1')
    end
  end
end
