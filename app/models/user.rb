class User < ApplicationRecord
  has_many :tweets
  has_one :selected_tweet
  has_many :responses, through: :selected_tweet
end
