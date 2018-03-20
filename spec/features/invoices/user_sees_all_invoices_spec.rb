RSpec.describe 'User' do
  describe 'visits invoice page' do
    it 'can see all invoices' do
      Invoice.create(status: 'pending', merchant_id: 1)
      Invoice.create(status: 'shipped', merchant_id: 2)

      visit '/invoices'
      expect(page).to have_content(1)
      expect(page).to have_content(2)

    end
    it 'can navigate to invoices dashboard' do
      Invoice.create(status: 'pending', merchant_id: 1)
      InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 1)


      visit '/invoices'
      click_on 'Invoices Dashboard'

      expect(current_path).to eq('/invoices-dashboard')
    end
    it 'can navigate to invoice item edit page' do
      Invoice.create(status: 'pending', merchant_id: 1)

      visit '/invoices'
      click_on 'edit'

      expect(current_path).to eq('/invoices/1/edit')
    end
    it 'can delete an invoice' do
      Invoice.create(status: 'pending', merchant_id: 1)

      visit '/invoices'
      click_on 'delete'

      expect(current_path).to eq('/invoices')
      expect(page).not_to have_content('1')
    end
  end
end
