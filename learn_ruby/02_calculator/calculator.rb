#write your code here
def add(one,two)
 return one+two
end

def subtract(one,two)
 return one-two
end

def sum(array)
 array.inject(0){|sum,x| sum + x}
end

def multiply(one,two,three=1)
 return one*two*three
end

def power(one,two) 
 return one**two
end
