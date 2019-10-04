class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :location, :bio, :avi_url

  has_many :tweets

end
