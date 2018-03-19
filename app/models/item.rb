class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.total_count
    self.all.count
  end

  def self.average_price
    self.average(:price).round(2)
  end

  def self.newest
    self.order(:created_at).last.title
  end

  def self.oldest
    self.order(:created_at).first.title
  end

  def self.total_price
    self.sum(:price).round(2)
  end

  def self.highest_priced_item
    price = self.maximum(:price)
    self.find_by(price: price)
  end

  def format_price
    cents = self.price.to_s.split('.').last
    if cents.length == 0
      "$#{self.price}.00"
    elsif cents.length == 1
      "$#{self.price}0"
    else
      "$#{self.price}"
    end
  end
end
