class CreateSubscriptionTiers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscription_tiers do |t|
      t.integer :monthly_streaming_limit
      t.integer :price
      t.string :name

      t.timestamps
    end
  end
end
