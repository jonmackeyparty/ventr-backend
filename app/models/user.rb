class User < ApplicationRecord
  has_many :tweets
  has_one :selected_tweet
  has_many :responses, through: :selected_tweet

  def self.new_from_hash(hash)
    @user = User.new(username: hash['name'], location: hash['location'], bio: hash['description'], avi_url: hash['profile_image_url'])
  end

  def build_tweets_from_hash(hash)
    hash.each do |tweet|
      self.tweets.build(content: tweet['full_text'], date: tweet['created_at'])
    end
  end

end
