RSpec.describe 'User' do
  describe 'visits invoices index page' do
    it 'can delete an invoice' do
      Invoice.create(status: 'yolo', merchant_id: 1)

      visit '/invoices'
      click_button 'delete'
      expect(current_path).to eq('/invoices')
      expect(Invoice.count).to eq(0)
    end
  end
  describe 'visits a specific invoice page' do
    it 'can delete an invoice' do
      Merchant.create(name: 'thing1')
      Merchant.create(name: 'thing2')
      Invoice.create(status: 'pending', merchant_id: 1)
      Invoice.create(status: 'pending', merchant_id: 2)

      visit 'invoices/2'
      click_button 'delete'

      expect(current_path).to eq('/invoices')
      expect(Invoice.count).to eq(1)
    end
  end
end
