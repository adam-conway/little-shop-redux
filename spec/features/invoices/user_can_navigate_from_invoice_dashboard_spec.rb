RSpec.describe 'User' do
  scenario 'can navigate to highest unit price invoice page' do
    Invoice.create(status: 'pending', merchant_id: 1)
    Invoice.create(status: 'shipped', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    Merchant.create(name: 'Adam')
    ii1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 2, unit_price: 1)
    ii2 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 1, unit_price: 2)
    ii3 = InvoiceItem.create(item_id: 1, invoice_id: 3, quantity: 4, unit_price: 3)
    ii3 = InvoiceItem.create(item_id: 1, invoice_id: 4, quantity: 3, unit_price: 4)

    visit '/invoices-dashboard'
    click_on '4'

    expect(current_path).to eq('/../invoices/4')
  end
  scenario 'can navigate to lowest unit price invoice page' do
    Invoice.create(status: 'pending', merchant_id: 1)
    Invoice.create(status: 'shipped', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    Merchant.create(name: 'Adam')
    ii1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 2, unit_price: 1)
    ii2 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 1, unit_price: 2)
    ii3 = InvoiceItem.create(item_id: 1, invoice_id: 3, quantity: 4, unit_price: 3)
    ii3 = InvoiceItem.create(item_id: 1, invoice_id: 4, quantity: 3, unit_price: 4)

    visit '/invoices-dashboard'
    click_on '1'

    expect(current_path).to eq('/../invoices/1')
  end
  scenario 'can navigate to highest quantity invoice page' do
    Invoice.create(status: 'pending', merchant_id: 1)
    Invoice.create(status: 'shipped', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    Merchant.create(name: 'Adam')
    ii1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 2, unit_price: 1)
    ii2 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 1, unit_price: 2)
    ii3 = InvoiceItem.create(item_id: 1, invoice_id: 3, quantity: 4, unit_price: 3)
    ii3 = InvoiceItem.create(item_id: 1, invoice_id: 4, quantity: 3, unit_price: 4)

    visit '/invoices-dashboard'
    click_on '3'

    expect(current_path).to eq('/../invoices/3')
  end
  scenario 'can navigate to lowest quantity invoice page' do
    Invoice.create(status: 'pending', merchant_id: 1)
    Invoice.create(status: 'shipped', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    Merchant.create(name: 'Adam')
    ii1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 2, unit_price: 1)
    ii2 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 1, unit_price: 2)
    ii3 = InvoiceItem.create(item_id: 1, invoice_id: 3, quantity: 4, unit_price: 3)
    ii3 = InvoiceItem.create(item_id: 1, invoice_id: 4, quantity: 3, unit_price: 4)

    visit '/invoices-dashboard'
    click_on '2'

    expect(current_path).to eq('/../invoices/2')
  end
end
