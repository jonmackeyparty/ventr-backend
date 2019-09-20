class SelectedTweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :date
  has_many :responses
end
