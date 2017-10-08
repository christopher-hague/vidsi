class CreateStreams < ActiveRecord::Migration[5.1]
  def change
    create_table :streams do |t|
      t.integer :subscriber_id
      t.string :video_id

      t.timestamps
    end
  end
end
