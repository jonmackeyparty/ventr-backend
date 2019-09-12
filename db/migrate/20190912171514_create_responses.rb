class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :selected_tweet_id
      t.string :content

      t.timestamps
    end
  end
end
