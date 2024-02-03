sold_days = [17, 3, 6, 9, 15, 8, 6, 1, 10]

=begin
  this method checks which day is the best to buy end sell
  - must buy before sell
  - returns array of indexes [x, y]
=end
def stock_picker(array)
    #contains array as key of bought and sold, value is the profit
    sold_hash = {}

    array.each_with_index do | _, index |
        if index < array.length - 1
            next_index = index + 1
            max_number = array[next_index..-1].max
            current_number = array[index]
            current_max_index = array[next_index..-1].index(max_number) + next_index
            profit = max_number - current_number

            sold_hash[[index, current_max_index]] = profit
        end
    end

    sold_hash
    max_profit = sold_hash.max_by { | key, value | value }.first
end

profits = stock_picker(sold_days)

p profits