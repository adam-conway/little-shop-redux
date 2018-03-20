RSpec.describe 'User' do
  describe 'visits a single merchant page' do
    it 'can see the specific merchant' do
      merchant_1 = Merchant.create(name: 'Margaret')
      merchant_2 = Merchant.create(name: 'a store')

      visit "/merchants/#{merchant_2.id}"

      expect(page).to have_content('a store')
    end
    it 'can go to edit the merchant' do
      merchant = Merchant.create(name: 'Margaret')

      visit "/merchants/#{merchant.id}"
      click_button "edit"

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")
    end
    it 'can go to delete an item' do
      merchant = Merchant.create(name: 'Margaret')
      item = Item.create(title: 'stuff', description: 'thing', price: 8.99, image: 'google.com', merchant_id: 1)

      visit "/merchants/#{merchant.id}"
      within("//section[@class=card]") do
        click_button "delete"
      end

      expect(current_path).to eq("/items")
    end
  end
end
