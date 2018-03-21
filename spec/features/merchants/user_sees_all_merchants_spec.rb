RSpec.describe 'User' do
  describe 'visits merchant page' do
    it 'can see all merchants' do
      merchant = Merchant.create(name: 'Margaret')

      visit '/merchants'

      expect(page).to have_content("#{merchant.name}")
    end
    it 'can go to a specific merchant' do
      merchant = Merchant.create(name: 'mErChAnT')

      visit '/merchants'
      click_on "#{merchant.name}"
      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
    it 'can go to edit a merchant' do
      merchant = Merchant.create(name: 'Margaret')

      visit '/merchants'
      click_button 'edit'
      expect(current_path).to eq("/merchants/#{merchant.id}/edit")
    end
    it 'can go delete a merchant' do
      merchant = Merchant.create(name: 'Margaret')

      visit '/merchants'
      click_button 'delete'
      expect(current_path).to eq("/merchants")
      expect(page).to_not have_content("#{merchant.name}")
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
    context 'can use the navigation bar' do
      it 'can link to root page' do
       Merchant.create(name:'Adam')

        visit '/merchants'
        click_on 'LittleShop'
        expect(current_path).to eq('/')
      end
      it 'can link to merchants page' do
        Merchant.create(name:'Adam')

        visit '/merchants'
        click_on 'Merchants'
        expect(current_path).to eq('/merchants')
      end
      it 'can link to items page' do
        Merchant.create(name:'Adam')
        Item.create(title: 'item', description: 'dEsCriBe', price: 3, image: 'google.com')

        visit '/items'
        click_on 'Items'
        expect(current_path).to eq('/items')
      end
      it 'can link to invoices page' do
        Merchant.create(name:'Adam')

        visit '/invoices'
        click_on 'Invoices'
        expect(current_path).to eq('/invoices')
      end
    end
  end
end
