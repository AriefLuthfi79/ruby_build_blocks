def stock_picker(prices)
  best_days = []
  profit = 0
  prices.each_with_index do |buy, i|
    prices[(i + 1)..-1].each_with_index do |sell, j|
      if sell - buy > profit
        profit = sell - buy
        best_days[0] = buy
        best_days[1] = sell
      end
    end
  end
  return best_days.inspect
end

puts stock_picker([17,3,6,9,15,8,6,1,10])