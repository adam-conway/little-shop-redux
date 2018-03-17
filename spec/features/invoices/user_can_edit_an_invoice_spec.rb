RSpec.describe 'User' do
  describe 'visits an edit invoice page' do
    it 'can edit a invoice' do
      Merchant.create(name: 'store')
      Invoice.create(status: 'pending', merchant_id: 1)

      visit '/invoices/1/edit'
      fill_in "invoice[status]", with: 'shipped'
      click_button 'Edit'

      expect(page).to have_content('shipped')
      expect(current_path).to eq('/invoices/1')
      expect(Invoice.count).to eq(1)
    end
  end
end
