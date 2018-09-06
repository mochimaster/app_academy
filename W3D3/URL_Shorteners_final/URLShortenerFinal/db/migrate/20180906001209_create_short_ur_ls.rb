class CreateShortUrLs < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.text :long_url, null: false
      t.integer :user_id, null: false
      t.text :short_url
      t.timestamps 
    end
    add_index :shortened_urls, [:long_url, :short_url]
    add_index :shortened_urls, :short_url
  end
end
