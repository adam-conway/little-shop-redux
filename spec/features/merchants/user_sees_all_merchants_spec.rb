RSpec.describe 'User' do
  describe 'visits merchant page' do
    it 'can see all merchants' do
      Merchant.create(name: 'Margaret')

      visit '/merchants'
      expect(page).to have_content('Margaret')
    end
    context 'clicks on dashboard link to view dashboard' do
      it 'is redirected to dashboard' do
        Merchant.create(name:'Adam')
        Item.create(title: 'item', description: 'dEsCriBe', price: 3, image: 'google.com', merchant_id: 1)

        visit '/merchants'
        click_on 'Merchants Dashboard'
        expect(current_path).to eq('/merchants-dashboard')
      end
    end
    context 'clicks on create a new merchant link' do
      it 'is redirected to create merchant page' do
        Merchant.create(name:'Adam')

        visit '/merchants'
        click_on 'Create a New Merchant'
        expect(current_path).to eq('/merchants/new')
      end
    end
  end
end
