class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.text :status
      t.integer :merchant_id

      t.timestamps null: false
    end
  end
end
