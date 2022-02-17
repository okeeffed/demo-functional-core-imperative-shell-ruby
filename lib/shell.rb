# typed: strict
require 'sorbet-runtime'
require 'timeline'
require 'tweet'

class Shell
  extend T::Sig

  sig { returns(Timeline) }
  attr_reader :timeline

  sig { void }
  def initialize
    @timeline = T.let(Timeline.new([]), Timeline)
    @counter = T.let(1, Integer)
  end

  sig { void }
  def run
    loop do
      print '> '
      input = gets.chomp
      break if input == 'exit'

      @timeline = timeline.add([Tweet.new(@counter.to_s, 'username', input)])
      @counter += 1

      @timeline.tweets.each { |tweet| puts tweet.inspect }
    end
  end
end
