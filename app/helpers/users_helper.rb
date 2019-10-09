require 'pry'

module UsersHelper

  def get_user_from_twitter(user)
    resp = Faraday.get('https://api.twitter.com/1.1/statuses/user_timeline.json?') do |req|
      req.params['screen_name'] = user
      req.params['count'] = 15
      req.params['exclude_replies'] = true
      req.params['include_rts'] = false
      req.params['tweet_mode'] = 'extended'
      req.headers['Authorization'] = "Bearer #{ENV['TWITTER_BEARER_TOKEN']}"
      req.headers['Content-Type'] = 'application/json'
    end

    # binding.pry

    resp_hash = JSON.parse(resp.body)

    if resp.success? && resp.body != "[]"
      @user = User.new_from_hash(resp_hash[0]['user'])
      @user.build_tweets_from_hash(resp_hash)
      @user.save
      render json: @user
    elsif resp.success? && resp.body == "[]"
      render json: { errors: "This user has no tweets to complain about." }
    else
      # binding.pry
      render json: { errors: resp_hash['errors'][0]['message'] }
    end

  end
end
