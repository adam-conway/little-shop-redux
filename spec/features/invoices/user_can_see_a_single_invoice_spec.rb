RSpec.describe 'User' do
  describe 'visits a single invoice page' do
    it 'can see the specific invoice' do
      Merchant.create(name: 'Margaret')
      invoice_1 = Invoice.create(status: 'pending', merchant_id: 1)

      visit "/invoices/#{invoice_1.id}"

      expect(page).to have_content('pending')
    end
    it 'can link to its merchants page' do
      Merchant.create(name: 'Margaret')
      Invoice.create(status: 'pending', merchant_id: 1)

      visit '/invoices/1'

      expect(page).to have_content('Margaret')
    end
  end
end
