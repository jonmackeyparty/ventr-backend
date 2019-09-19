class SelectedTweet < ApplicationRecord
  belongs_to :user
  has_many :responses

  def self.create_from(tweet)
    @selected_tweet = SelectedTweet.new(user_id: tweet.user_id, content: tweet.content, date: tweet.date)
  end

end
