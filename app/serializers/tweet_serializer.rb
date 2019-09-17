class TweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :date 
end
