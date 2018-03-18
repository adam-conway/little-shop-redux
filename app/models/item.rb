class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
end
