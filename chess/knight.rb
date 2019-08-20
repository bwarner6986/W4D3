require_relative "piece"
require_relative "stepable"
class Knight < Piece
  include Stepable 

  def symbol
    :K
  end

  def move_dirs
    [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]]
  end

end