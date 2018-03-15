RSpec.describe 'User' do
  describe 'visits a single invoice page' do
    it 'can see the specific invoice' do
      Invoice.create(status: 'pending', merchant_id: 2)

      visit '/invoices/1'

      expect(page).to have_content('pending')
    end
  end
end
