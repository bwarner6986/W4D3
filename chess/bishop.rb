require_relative "piece"
require_relative "slideable"
require_relative "board"

class Bishop < Piece
  include Slideable
  
  def symbol
    :B
  end

  def move_dirs
    diagonal_dirs
  end

end