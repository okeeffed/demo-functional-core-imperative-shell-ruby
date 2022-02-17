# typed: strict
require 'sorbet-runtime'

class Tweet
  extend T::Sig

  sig { returns(String) }
  attr_accessor :tid, :username, :text

  sig { params(tid: String, username: String, text: String).void }
  def initialize(tid, username, text)
    @tid = T.let(tid, String)
    @username = T.let(username, String)
    @text = T.let(text, String)
  end

  sig { returns(Integer) }
  def line_count
    lines.count
  end

  sig { returns(T::Array[String]) }
  def lines
    text.split("\n")
  end
end
