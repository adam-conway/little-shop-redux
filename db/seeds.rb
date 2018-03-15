require 'CSV'
require './app/models/merchant.rb'
require './app/models/item.rb'

class Seed
  CSV.foreach('data/merchants.csv', headers: true, header_converters: :symbol) do |row|
    Merchant.create(row.to_hash)
  end

  CSV.foreach('data/items.csv', headers: true, header_converters: :symbol) do |row|
    Item.create(title: row[:name],
                description: row[:description],
                price: row[:unit_price],
                image: "https://avatars0.githubusercontent.com/u/7598370?s=400&v=4"
                )
  end
end
