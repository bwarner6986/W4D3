require_relative "piece"
require "singleton"
class NullPiece < Piece
  include Singleton
  attr_reader :moves, :symbol, :color
  def initialize
    @moves = []
    @symbol = :N
    @color = :Yellow
  end
end