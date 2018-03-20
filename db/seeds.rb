require 'CSV'
require './app/models/merchant.rb'
require './app/models/item.rb'
require './app/models/invoice.rb'
require './app/models/invoice_item.rb'

class Seed
  images = ["https://avatars0.githubusercontent.com/u/7598370?s=400&v=4",
            "https://avatars0.githubusercontent.com/u/33872479?s=400&v=4"]

  CSV.foreach('data/merchants.csv', headers: true, header_converters: :symbol) do |row|
    Merchant.create(row.to_hash)
  end

  CSV.foreach('data/items.csv', headers: true, header_converters: :symbol) do |row|
    Item.create(id: row[:id],
                title: row[:name],
                description: row[:description],
                price: row[:unit_price].to_i,
                image: images[rand(2)],
                merchant_id: row[:merchant_id]
                )
  end

  CSV.foreach('data/invoices.csv', headers: true, header_converters: :symbol) do |row|
    Invoice.create(status: row[:status],
                   merchant_id: row[:merchant_id]
                  )
  end

  CSV.foreach('data/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
    InvoiceItem.create(item_id: row[:item_id],
                       invoice_id: row[:invoice_id],
                       quantity: row[:quantity],
                       unit_price: row[:unit_price].to_i
                      )
  end
end
