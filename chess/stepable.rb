module Stepable
require_relative "board"

def moves
  finalarr = []
  move_diffs.each do |pos|
    new_pos = [self.pos[0] + pos[0], self.pos[1] + pos[1]]
    finalarr << new_pos unless board[new_pos].color == board[self.pos].color || !board.valid_pos?(current_pos
  end
  finalarr
end

private

def move_diffs
 raise "Forgot move_diffs method!"
end



end