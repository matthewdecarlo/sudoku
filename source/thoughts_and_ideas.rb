# Solve method
# loop
# go through all empty keys in the @board hash (keys => 0)
# loop calls grand_filter
  #grand_filter calls row, column and master filter and compares the output arrays
#when all_possibilities (the output array from grand_filter).length = 1
  #then cell = value of the all_possibilities array
#recursively goes through and takes the next empty cell in @board hash
#
#
#
#our base case: no more empty cells, aka no values of 0 in the @board hash
