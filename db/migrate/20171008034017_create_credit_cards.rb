class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :card_number
      t.integer :subscriber_id

      t.timestamps
    end
  end
end
