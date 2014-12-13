require_relative "master_cell_logic"

class Board
  attr_reader :board

  def initialize(board_string)
    @board_array = board_string.chars
    @board = {}
    @possible_values = [1,2,3,4,5,6,7,8,9]
    @master_cell_list = {}

    gen_board
  end

  def print_board
    board_array = []
    letter = "A"

    @board.each_value { |value| board_array << value }
    print "    0 1 2 3 4 5 6 7 8 \n"
    print "  +-------------------+"
    puts
    board_array.each_slice(9) do |row|

      print "#{letter} | " + row.join(" ").gsub(/["0"]/, '_') + " |"
      puts
      letter = letter.next
    end
    print "  +-------------------+"
    puts
  end

  def solve
    @board.each do |key, value|
      get_value(key)
      get_column(key)
  end
end


#gen board needs to create a hash with key represented as column (A)/row (0) intersections ("A0") and values as board_array (1..9 or -)
  def gen_board
    ("A".."I").each do |row|
      (0..8).each_with_index { |column, value| @board.merge!( { "#{row}#{column}".to_sym => @board_array.shift.to_i } ) }
    end
    return @board
  end

#get all the values from a row, each puts every 9 keys from board_array
#get all values from a column, each puts keys with (column)"index" from board_array


#get all the values from a master cell

  def get_value(key)
    @board[key.to_sym]
  end

  def set_value(key, value)
    @board[key.to_sym] = value
  end

  def filter_row(key)
    column_label = key[0]
    row = get_row(column_label)

    return @possible_values.select{ |value| not row.include?(value) }
  end

  def filter_column(key)
    row_label = key[1]
    column = get_column(row_label)

    return @possible_values.select{ |value| not column.include?(value) }
  end


  #new method with get_master_cell and only call it with the initial values of each master cell
  # the key can be the very first cell and the values can be all of the cells in that master cell



  def get_row(column_label)
    row = []

    (0..8).each do |row_label|
      row << get_value( column_label + row_label.to_s )
    end
    return row
  end

  def get_column(row_label)
    column = []

    ("A".."I").each do |column_label|
      column << get_value( column_label + row_label.to_s )
    end
    return column
  end

end



#cell
#master_cell = small grid of 3x3
#possible_cell_values = hash with keys are cells => values are possible numbers
#true_value = the actual value of the cell
#board = the full board, hash

#Pseudocode:
# the sudoku_puzzles.txt is BY ROW, slice(9) to each string, populate by row number first slice goes to row 1
# second slice goes to row 2, etc.

#nope, we're gonna do hashey hash
# Refer back to boggle challenge for population
# If there is a value [1..9],
#   set that cell (key) to that integer
# else (there is -), then leave array [1..9]

#use .values_at function to get master_cell ==> use this one hash.values_at("A0", "B0", "C0", "A1", "B1", "C1", "A2", "B2", "C2") -- this returns an array of values
# if .size == array.uniq.size
# [1,2,3,4, -, 9, 8] =


#TESTS
board = Board.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
#  p trial.gen_board
#p trial.get_row("A")
#p trial.get_column(2)
# p trial.get_value("G3")
#p trial.get_master_cell("D6")
board.print_board
p board.gen_master_cell_list
p board.in_master?("")

