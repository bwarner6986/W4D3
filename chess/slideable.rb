require "byebug"
module Slideable
  # def valid_pos?(pos)
  #   pos.all? {|ele| ele >= 0 && ele <= 7}
  # end
  
  def horizontal_dirs
    HORIZONTAL_DIRS
  end
 
    # horizontal = []
    # x, y = self.pos[0], self.pos[1]
    # while valid_pos?([x,y])
    #   horizontal << [x,y] unless x == self.pos[0] && y == self.pos[1]
    #   x += 1
    # end
    # x = self.pos[0]

    # while valid_pos?([x,y])
    #   horizontal << [x,y] unless x == self.pos[0] && y == self.pos[1]
    #   x -= 1
    # end
    # x = self.pos[0]

    # while valid_pos?([x,y])
    #   horizontal << [x,y] unless x == self.pos[0] && y == self.pos[1]
    #   y += 1
    # end
    # y = self.pos[0]


    # while valid_pos?([x,y])
    #   horizontal << [x,y] unless x == self.pos[0] && y == self.pos[1]
    #   y -= 1
    # end
    # horizontal
  # end 

  def diagonal_dirs 
    DIAGONAL_DIRS
  end 

  def moves
    final_arr = []
      move_dirs.each do |sub|
        final_arr << grow_unblocked_moves_in_dir(sub[0],sub[1])
      end
    final_arr
  end
  
  
  private

  HORIZONTAL_DIRS = [[1,0], [-1,0] ,[0,1], [0,-1]]
  DIAGONAL_DIRS = [[1,1], [-1,-1], [-1,1], [1,-1]]

  def move_dirs
    raise "Forgot to create method"
  end 

  def grow_unblocked_moves_in_dir(dx, dy)
    final = []
    current_pos = self.pos
    # debugger
    current_pos = [current_pos[0] + dx, current_pos[1] + dy]
    until !board.valid_pos?(current_pos) 
      return final if board[pos].color == board[current_pos].color
      # debugger
      final << current_pos 
      current_pos = [current_pos[0] + dx, current_pos[1] + dy]
      return final if  !board.valid_pos?(current_pos)  || board[pos].color == board[current_pos].color
    end
    final
  end


end