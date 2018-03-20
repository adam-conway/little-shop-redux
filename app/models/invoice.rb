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
    InvoiceItem.all.select('invoice_id, sum(unit_price)')
               .group('invoice_id').order('sum DESC').limit(1).first.invoice_id
  end

  def self.lowest_unit_price
    InvoiceItem.all.select('invoice_id, sum(unit_price)')
               .group('invoice_id').order('sum').limit(1).first.invoice_id
  end

  def self.highest_quantity
    InvoiceItem.all.select('invoice_id, sum(quantity)')
               .group('invoice_id').order('sum DESC').limit(1).first.invoice_id
  end

  def self.lowest_quantity
    InvoiceItem.all.select('invoice_id, sum(quantity)')
               .group('invoice_id').order('sum').limit(1).first.invoice_id
  end
end
