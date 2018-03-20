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
      Invoice.create(status: 'shipped', merchant_id: 2)

      visit '/invoices'
      click_on 'Invoices Dashboard'


      expect(page).to have_content(1)
      expect(page).to have_content(2)

    end
  end
end
