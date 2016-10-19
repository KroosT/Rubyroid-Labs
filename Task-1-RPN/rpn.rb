def digit? (str)
    a = str.match(/-?\d+(\.\d+)?/)
    a.to_s.length == str.length
end

def operator? (str)
    '+-*/!'.include?(str)
end

def rpn
    
    digit_cnt = operator_cnt = 0
    stack = []
    error_flag = false
    puts "Let's start:"
    while (operator_cnt == 0 or digit_cnt - operator_cnt != 1)
        
        input = gets.chomp()
        if input == ''
            error_flag = true
        end

        if digit?(input) && !error_flag
            stack.push(input)
            digit_cnt += 1
        
        elsif operator?(input) && !error_flag
            if stack.length <= 1
                puts "It's not normal calculator! It's polish! Try again!"
            else
                operator_cnt += 1
                second = stack.pop
                first = stack.pop
                if input == '/'
                    stack.push(eval(first.to_f.to_s + input + second).to_s)
                else
                    stack.push(eval(first + input + second).to_s)
                end
            end
        else
            puts 'Something went wrong. Try again'
            error_flag = false
        end 
    end
    puts 'Your answer is:'
    puts '-- ' + stack.pop.to_s

end

rpn
