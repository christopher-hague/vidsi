class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :length
      t.integer :content_provider_id

      t.timestamps
    end
  end
end
