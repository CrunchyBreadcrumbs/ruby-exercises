def stock_picker(days)
  buy_arr = days[0..days.length-2]
  buy = 0
  sell = 0
  profit = 0
  buy_arr.each_with_index do |investment, b_index|
    sell_arr = buy_arr[(b_index + 1)..days.length-1]
    sell_arr.each_with_index do |sale, s_index|
      if sale > investment
        difference = sale.to_i - investment.to_i
        if difference > profit
          profit = difference
          buy = b_index
          sell = days.find_index(sale)
        end
      end  
    end
  end
  p [buy, sell]
end

stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([1,3,6,9,15,8,6,2,10])
stock_picker([12,3,6,9,15,8,6,1,2])