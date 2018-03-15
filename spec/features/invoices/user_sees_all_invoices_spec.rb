RSpec.describe 'User' do
  describe 'visits invoice page' do
    it 'can see all invoices' do
      Invoice.create(status: 'pending', merchant_id: 1)
      Invoice.create(status: 'shipped', merchant_id: 2)


      visit '/invoices'
      expect(page).to have_content('pending')
      expect(page).to have_content('shipped')

    end
  end
end
