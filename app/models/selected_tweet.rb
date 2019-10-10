require 'pry'

class SelectedTweet < ApplicationRecord
  belongs_to :user
  has_many :responses
  has_one :apology

  def self.create_from(tweet)
    @selected_tweet = SelectedTweet.new(tweet.attributes)
  end

end
