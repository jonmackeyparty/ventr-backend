class User < ApplicationRecord
  has_many :tweets
  has_one :selected_tweet
  has_many :responses, through: :selected_tweet

  def self.new_from_hash(hash)
    @user = User.new(username: hash['name'], location: hash['location'], bio: hash['description'], avi_url: hash['profile_image_url'])
  end

  def build_tweets_from_hash(hash)
    hash.each do |tweet|
      date = Time.parse(tweet['created_at'])
      formatted_date = date.strftime('%-I:%M %p • %-m/%-d/%Y')
      self.tweets.build(content: tweet['full_text'], date: formatted_date)
    end
  end

end
