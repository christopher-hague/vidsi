class CreateSubscribersSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers_subscriptions do |t|
      t.integer :subscriber_id
      t.integer :subscription_id

      t.timestamps
    end
  end
end
