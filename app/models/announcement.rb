class Announcement < ActiveRecord::Base
  scope :tweets, -> { where(source: :twitter) }
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key    = "ZrausXUsgDAdzaj2Qp1heA"
    config.consumer_secret = "CMmMxn96lEK5yNLaEVxjncWSZmaejW5vYnoGwAvPPOE"
  end

  def self.check_twitter
    last_id = Announcement.tweets.first.external_id rescue nil
    if last_id.nil?
      options = {}
    else 
      options = { max_id: last_id }
    end
    bm_tweets = @client.user_timeline("BoilerMake1", options)
    puts bm_tweets
    bm_tweets.each do |tweet|
      puts tweet
      if Announcement.tweets.where("external_id IS ?", tweet.id).any?
        #tweet already is in the database
      else
        Announcement.create(source: :twitter, message: tweet.full_text, external_id: tweet.id)
      end
    end
  end

end
