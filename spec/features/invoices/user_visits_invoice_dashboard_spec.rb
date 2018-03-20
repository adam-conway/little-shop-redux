RSpec.describe 'User' do
  scenario 'can see status percentages' do
    Invoice.create(status: 'pending', merchant_id: 1)
    Invoice.create(status: 'shipped', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 1)

    visit '/invoices-dashboard'

    expect(page).to have_content('Pending: 33.33')
    expect(page).to have_content('Shipped: 33.33')
    expect(page).to have_content('Returned: 33.33')
  end
  scenario 'can see highest and lowest unit prices' do
    Invoice.create(status: 'pending', merchant_id: 1)
    Invoice.create(status: 'shipped', merchant_id: 1)
    ii1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 1)
    ii2 = InvoiceItem.create(item_id: 1, invoice_id: 2, quantity: 2, unit_price: 2)

    visit '/invoices-dashboard'

    expect(page).to have_content('Highest Unit Price: 2')
    expect(page).to have_content('Lowest Unit Price: 1')
  end
  scenario 'can see highest and lowest unit prices' do
    Invoice.create(status: 'pending', merchant_id: 1)
    Invoice.create(status: 'returned', merchant_id: 1)
    ii1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 1)
    ii2 = InvoiceItem.create(item_id: 1, invoice_id: 4, quantity: 4, unit_price: 4)

    visit '/invoices-dashboard'

    expect(page).to have_content('Highest Quantity: 4')
    expect(page).to have_content('Lowest Quantity: 1')
  end
end
