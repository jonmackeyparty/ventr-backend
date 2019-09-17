class SelectedTweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :date
end
