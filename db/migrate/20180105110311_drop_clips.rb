class DropClips < ActiveRecord::Migration[5.2]
  def change
    drop_table :clips do |t|
      t.integer :post_id, null: false
      t.text :image_data, null: false

      t.timestamps
    end

    remove_column :posts, :clips_count, :integer, default: 0
  end
end
