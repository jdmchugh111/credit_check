card_number = "6011797668867828"
# cc_number = [num_1, num_2, num_3, num_4, num_5, num_6, num_7, num_8, num_9, num_10, num_11, num_12, num_13, num_14, num_15, num_16]

def luhn_alg(card_number)
    array_1 = card_number.chars
    array_2 = array_1.each_slice(2).map(&:last)
    array_3 = array_1.each_slice(2).map(&:first)
    array_4 = array_3.map {|even_digit| even_digit.to_i * 2}
    array_5 = array_4.map do |ed_prod|
        if ed_prod >= 10
            sum_1 = ed_prod.to_s.chars.map {|d_over10| d_over10.to_i}
            sum_1.inject(&:+)
        else 
            ed_prod = ed_prod
        end
    end
    array_6 = array_2.concat(array_5)
    array_7 = array_6.to_s.chars.map {|final_array| final_array.to_i}
    sum_array = array_7.inject(&:+)
    if sum_array % 10 == 0
        puts "The number #{card_number} is valid!"
    else
        puts "The number #{card_number} is invalid!"
    end
end
    
puts luhn_alg(card_number)

# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"
