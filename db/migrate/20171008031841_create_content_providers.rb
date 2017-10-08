class CreateContentProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :content_providers do |t|
      t.integer :concurrent_stream_limit
      t.string :name

      t.timestamps
    end
  end
end
