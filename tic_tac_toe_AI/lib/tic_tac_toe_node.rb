require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos, :children
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board 
    @next_mover_mark = next_mover_mark # :x
    @prev_move_pos = prev_move_pos
    # @children = []
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []

    (0...3).each do |row|
      (0...3).each do |col|
        pos = [row, col]
        if board.empty?(pos)
          node = TicTacToeNode.new(@board.dup, next_mover_mark == :o ? :x : :o, pos)
          children_arr << node
        end
      end
    end

    children_arr
  end
end
