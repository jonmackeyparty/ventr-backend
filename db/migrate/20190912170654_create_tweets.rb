class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :content
      t.datetime :date

      t.timestamps
    end
  end
end
