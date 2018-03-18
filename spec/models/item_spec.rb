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

  describe 'Valid validations' do
    it 'is valid with all params' do
      item = Item.create(title: 'Adam', description: 'so cool', price: 575.04, image: 'url')

      expect(item).to be_valid
    end
  end

  describe 'Class Methods' do
    context '.total_count'
      it 'can return total count of items' do
        Item.create(title: 'Adam', description: 'not v cool', price: 575.04, image: 'url')

        expect(Item.total_count).to eq(1)
      end
      context '.average_price' do
        it 'can return average price of items' do
          Item.create(title: 'name', description: 'lalala', price: 10, image: 'url')
          Item.create(title: 'name2', description: 'ladeela', price: 20, image: 'url')

          expect(Item.average_price).to eq(15)
        end
      end
      context '.newest' do
        it 'can return newest item' do
          Item.create(title: 'name', description: 'lalala', price: 10, image: 'url')
          Item.create(title: 'name2', description: 'ladeela', price: 20, image: 'url')

          expect(Item.newest).to eq('name2')
        end
      end
      context '.oldest' do
        it 'can return oldest item' do
          Item.create(title: 'name', description: 'lalala', price: 10, image: 'url')
          Item.create(title: 'name2', description: 'ladeela', price: 20, image: 'url')

          expect(Item.oldest).to eq('name')
        end
      end
  end
end
