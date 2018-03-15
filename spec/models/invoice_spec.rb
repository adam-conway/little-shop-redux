RSpec.describe Invoice do
  describe 'Invalid validations' do
    it 'is invalid without any params' do
      invoice = Invoice.create

      expect(invoice).to_not be_valid
    end
    it 'is invalid without merchant id' do
      invoice = Invoice.create(status: 'pending')

      expect(invoice).to_not be_valid
    end
    it 'is invalid without status' do
      invoice = Invoice.create(merchant_id: 2)

      expect(invoice).to_not be_valid
    end
  end

  describe 'Valid validations' do
    it 'is valid with all params' do
      invoice = Invoice.create(status: 'pending', merchant_id: 3)

      expect(invoice).to be_valid
    end
  end
end
