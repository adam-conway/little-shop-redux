class Merchant < ActiveRecord::Base
  validates :name, presence: true

  has_many :items
  has_many :invoices

  def self.most_items
    self.all.max_by do |merchant|
      merchant.items.count
    end
  end

  def self.highest_priced_item
    self.find(Item.highest_priced_item.merchant_id).name
  end
end
