class PositionError < StandardError; end
require_relative "piece"
require_relative "nullpiece"
require_relative "bishop"
# include Slideable
class Board
  attr_accessor :rows, :nul_piece
  def initialize
    @nul_piece = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, nul_piece)}
    populate_board
    # self[[0,0]] = Piece.new(2)
  end

  def populate_board
    self.rows.each_with_index do |sub, i|
      sub.each_with_index do |ele, j| 
        pos = [i, j] 
        if i == 0 || i == 1
          self[pos] = Piece.new(:White, self, pos)
        elsif i == 7 || i == 6
          self[pos] = Piece.new(:Black, self, pos)
        # else
        #   self[[i, j]] = NullPiece.new
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    #fix making valid position 
    #begin
    raise PositionError if !valid_pos?(start_pos) || !valid_pos?(end_pos)
    self[end_pos],self[start_pos] = self[start_pos], nul_piece
    # end
    # raise MovementError.new("Invalid move") if self.rows[start_pos] && self.rows[end]
    #!(self[start_pos]).move_into_check?(end_pos)
  end
  
  
  def valid_pos?(pos)
    pos.all? {|ele| ele >= 0 && ele <= 7}
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end 

  def []=(pos, val)
    @rows[pos[0]][pos[1]] = val
  end

end