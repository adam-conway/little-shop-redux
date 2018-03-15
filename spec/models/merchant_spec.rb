RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.create

      expect(merchant).to_not be_valid
    end
  end

  describe 'Valid validations' do
    it 'is valid with all params' do
      merchant = Merchant.create(name: 'Adam')

      expect(merchant).to be_valid
    end
  end
end
