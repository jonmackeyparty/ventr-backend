class ChangeDateToStringInTweets < ActiveRecord::Migration[5.2]
  def change
    change_column :tweets, :date, :string 
  end
end
