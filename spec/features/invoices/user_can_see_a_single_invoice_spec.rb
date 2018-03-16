RSpec.describe 'User' do
  describe 'visits a single invoice page' do
    it 'can see the specific invoice' do
      invoice_1 = Invoice.create(status: 'pending', merchant_id: 2)

      visit "/invoices/#{invoice_1.id}"

      expect(page).to have_content('pending')
    end
  end
end
