class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :screen_name, :location, :bio, :avi_url

  has_many :tweets

end
