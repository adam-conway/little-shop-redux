class Invoice < ActiveRecord::Base
  validates :status, presence: true
  validates :merchant_id, presence: true
end
