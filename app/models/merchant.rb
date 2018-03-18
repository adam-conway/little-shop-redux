class Merchant < ActiveRecord::Base
  validates :name, presence: true

  has_many :items

  def self.most_items
    self.all.max_by do |merchant|
      merchant.items.count
    end.name
  end
end
