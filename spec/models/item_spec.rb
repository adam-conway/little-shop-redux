RSpec.describe Item do
  describe 'Validations' do
    it 'is invalid without a title' do
      item = Item.create(description: 'so cool', price: 575.04, image: 'url')

      expect(item).to_not be_valid
    end

    it 'is invalid without a description' do
      item = Item.create(title: 'Adam', price: 575.04, image: 'url')

      expect(item).to_not be_valid
    end

    it 'is invalid without a price' do
      item = Item.create(title: 'Adam', description: 'so cool', image: 'url')

      expect(item).to_not be_valid
    end

    it 'is invalid without an image' do
      item = Item.create(title: 'Adam', description: 'so cool', price: 575.04)

      expect(item).to_not be_valid
    end
  end
end
