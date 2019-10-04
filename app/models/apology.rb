class Apology < ApplicationRecord
  belongs_to :selected_tweet

  def self.create_from_selected_tweet
    apology_reasons = ["I'm sorry if you were offended by my tweet.", "Although my tweet was intended as a joke, I recognize that it might have offended some people.  I am sorry that my humor didn't translate well to everyone.", "I am sorry that some were born more sensitive than might be helpful, in today's society", "I'm hearing your pain, but I can't in good conscience say I'm sorry, because I don't truly believe I did anything wrong", "I'm sorry IF you feel upset, but I'm not in charge of your feelings. YOU'RE in charge of your feelings.", "I'm sorry if my identity led me to see things in a certain way, and I don't understand what it's like to be someone that's not me.", "I'm sorry if you think what you're feeling is true.", "I am sorry that I had the misfortune of being honest during this era of cultural unforgiveness", "I'm happy to apologize to anyone who's actually offended, and not faking it, if I can be convinced that such a person legitimately exists", "This tweet is not who I am."]

    @apology = Apology.create(content: apology_reasons.sample, date:Time.now.strftime('%-I:%M %p • %-m/%-d/%Y'))

  end

end
