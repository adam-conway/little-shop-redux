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
      Invoice.create(status: 'pending', merchant_id: 3)
      Invoice.create(status: 'pending', merchant_id: 4)

      visit 'invoices/2'
      click_button 'delete'

      expect(current_path).to eq('/invoices')
      expect(Invoice.count).to eq(1)
    end
  end
end
