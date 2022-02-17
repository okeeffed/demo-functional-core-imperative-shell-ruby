# typed: strict
require 'sorbet-runtime'
require 'tweet'

class Timeline
  extend T::Sig

  sig { returns(T::Array[Tweet]) }
  attr_reader :tweets

  sig { params(tweets: T::Array[Tweet]).void }
  def initialize(tweets)
    @tweets = T.let(tweets, T::Array[Tweet])
  end

  sig { params(tweets: T::Array[Tweet]).returns(Timeline) }
  def add(tweets)
    existing_ids = @tweets.map(&:tid).to_set
    new_tweets = tweets.reject { |t| existing_ids.include?(t.tid) }
    Timeline.new(new_tweets + @tweets)
  end
end
