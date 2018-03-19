class Invoice < ActiveRecord::Base
  validates :status, presence: true
  validates :merchant_id, presence: true

  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :merchant

  def self.pending_percentage
    (where(status: 'pending').count / count.to_f) * 100
  end

  def self.shipped_percentage
    (where(status: 'shipped').count / count.to_f) * 100
  end

  def self.returned_percentage
    (where(status: 'returned').count / count.to_f) * 100
  end

  def self.highest_unit_price
    max_unit_price = InvoiceItem.maximum(:unit_price)
    InvoiceItem.all.find_by(unit_price: max_unit_price).invoice_id
  end

  def self.lowest_unit_price
    min_unit_price = InvoiceItem.minimum(:unit_price)
    InvoiceItem.all.find_by(unit_price: min_unit_price).invoice_id
  end

  def self.highest_quantity
    max_quantity = InvoiceItem.maximum(:quantity)
    InvoiceItem.all.find_by(quantity: max_quantity).invoice_id
  end

  def self.lowest_quantity
    min_quantity = InvoiceItem.minimum(:quantity)
    InvoiceItem.all.find_by(quantity: min_quantity).invoice_id
  end
end
