def threed(list) #Return true if 3 appears 3 times and no 3s are next to each other
    threes_next_to, threes = 0,0
    list.each_with_index do |value,index|
        threes += 1 if value == 3
        threes_next_to += 1 if value == 3 && list[index+1] == 3
    end
    return threes == 3 && threes_next_to == 0
end


# puts threed([1,2,3,4,3,3]) #false
# puts threed([3,1,3,1,3]) # true
# puts threed([1,2,2,3,2,3]) #false


def same_first_last(array) # same first value as last value?
    return (array[0] == array.last && !(array.size == 0) )
end


# puts same_first_last([1]) # true
# puts same_first_last([1,2,3,4]) # false
# puts same_first_last([1,2,3,1]) # true


def get_sandwich(string) # return whatever is between the bread
    return "" if string.scan(/bread/).length != 2
    new_str = ""
    (string.size-4).times do |i|
        if string[i..i+4] == 'bread'
            val = i+5
            until string[val..val+4] == 'bread'
                new_str += string[val]
                val += 1
            end
            break
        end
    end
    return new_str
end


# puts get_sandwich('breadbreadbread') #""
# puts get_sandwich('breadnotbread') #"not"
# puts get_sandwich('bread') #""
# puts get_sandwich('wordsbreadTASTYSANDWICHbreadwords') #"TASTYSANDWICH"


def shift_left(list) # make the last element the first elem
    return list.unshift(list.pop)
end


# print shift_left([1,2,3,4,5])


def can_balance(list) #return true if the sum of elements on 1 side is equal to the sum of elements on the other at any given index
    list.each_with_index {|value, index| return true if (list[0...index].inject(0, :+)) == (list[index...list.length].inject(0, :+))}
    return false
end


# puts can_balance([1,1,2]) #true
# puts can_balance([1,1,1]) #false
# puts can_balance([50,25,10,15]) #true


def count_code(string) # return the number of times 'co'+any_char+'e' appears
    return string.scan(/co.e/).length #easy way with regex
end


# puts count_code("copecod") # 1
# puts count_code("blahblahblahco_e") #1
# puts count_code("codecopecobecome") #4


def middle_way(list1, list2) #return list with middle of lists (assume both lists have odd number of elements)
    return [list1[list1.size/2], list2[list2.size/2]]
end


# puts middle_way([0,1,3], [0,30,7]) #[1, 30]


def either_2_4(list) # return true if 2 next to 2 OR 4 next to 4 but not both
    next_to = 0
    (list.size-1).times {|index| next_to += 1 if (list[index] == 2 && list[index+1] == 2) || (list[index] == 4 && list[index+1] == 4)}
    return next_to == 1
end


# puts either_2_4([2,2,3,4,4]) # false
# puts either_2_4([1,2,3,2]) # false
# puts either_2_4([1,2,3,4,4,2]) # true


def max_span(list) #return the maximum span between 2 equal values
    return 1 if list.size == 1
    span, max_span = 0, 0
    list.each_with_index do |val, index|
        i = index
        list.each_with_index {|value, ind| i = ind if val == value}
        span = i - index
        max_span = span if span > max_span
    end
    return max_span
end


# puts max_span([1,2,3,1,3]) #3
# puts max_span([3,1,3,2,1,1,1,1,1,2]) #7


def g_happy(string) # if all g's are next to g's, return true
    return string.scan(/gg/).length == string.scan(/g./).length
end


# puts g_happy("gg i like eggs") #true
# puts g_happy("g i like eggs") # false
# puts g_happy("g is wacc") # false
# puts g_happy("i like eggs") #true


def merge(list1, list2) #given 2 lists, return a list in ascending order
    return (list1+list2).sort # easy way
end

# puts merge([1,2,8], [4,9,10]) #[1,2,4,8,9,10]
