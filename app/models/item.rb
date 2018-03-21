class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.cents_formatter(price)
    cents = price.to_s.split('.').last
    if cents.length.zero?
      "$#{price}.00"
    elsif cents.length == 1
      "$#{price}0"
    else
      "$#{price}"
    end
  end

  def self.total_count
    all.count
  end

  def self.average_price
    avg = average(:price).round(2)
    cents_formatter(avg)
  end

  def self.newest
    order(:created_at).last
  end

  def self.oldest
    order(:created_at).first
  end

  def self.total_price
    total = sum(:price).round(2)
    cents_formatter(total)
  end

  def self.highest_priced_item
    price = maximum(:price)
    find_by(price: price)
  end

  def format_price
    cents = self.price.to_s.split('.').last
    if cents.length.zero?
      "$#{self.price}.00"
    elsif cents.length == 1
      "$#{self.price}0"
    else
      "$#{self.price}"
    end
  end

  def quantity(invoice)
    self.invoice_items.find_by(invoice_id: invoice.id).quantity
  end
end
