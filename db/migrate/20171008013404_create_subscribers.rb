class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.integer :available_stream_time

      t.timestamps
    end
  end
end
