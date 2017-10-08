class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.integer :balance
      t.integer :subscriber_id

      t.timestamps
    end
  end
end
