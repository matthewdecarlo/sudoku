  def get_master_cell(initial_cell)

    starting_point = initial_cell.to_sym
    master_cell = { }
    letter = initial_cell[0]
    number = initial_cell[1]
    a_symbol = nil

    3.times do
        3.times do
          a_symbol = ( letter + number ).to_sym
          master_cell.merge!( { a_symbol => @board[ a_symbol ] } )
          number.next!
        end
        letter.next!
        number = initial_cell[1]
      end
      return master_cell
  end

  def gen_master_cell_list
    initial_cell = ["A0", "A3", "A6", "D0", "D3", "D6", "G0", "G3", "G6"]

    initial_cell.each do |cell|
      @master_cell_list.merge!({cell.to_sym => get_master_cell(cell)})
    end
    return @master_cell_list
  end

  def in_master?(cell_to_match)
    @master_cell_list.each_value do | value|
       value.each_key do |key|
          return key if key == cell_to_match
       end
    end
  end


  def filter_master_cell(key)
    @master_cell_list
    #A5 - which master cell is it in? loop through
    #compare @possible_values with the values in that master_cell
    return @possible_values.select{ }
  end

  def grand_filter

  end
