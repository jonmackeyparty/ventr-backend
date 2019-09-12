class Response < ApplicationRecord
  belongs_to :selected_tweet
  validates :content, presence: true
end
