class Invoice < ActiveRecord::Base
  validates :status, presence: true
  validates :merchant_id, presence: true

  has_many :invoice_items
  has_many :items, through: :invoice_items
end
