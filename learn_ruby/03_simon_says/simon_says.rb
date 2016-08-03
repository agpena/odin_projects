#write your code here
def echo(word) 
 return word.to_s
end 

def shout(word)
 return word.upcase.to_s
end

def repeat(word,times=2)
 return word+" #{word}"*(times-1)
end

def start_of_word(word,index)
 return word[0,index]
end 

def first_word(words)
 string = words.split " "
 return string[0]
end

#def titleize(word)
 #title = word.split.map(&:capitalize).join(' ')
 #title = title.gsub("And","and")
 #return title
#end 

def titleize(name)
 lowercase_words = %w{a an the and but or for nor of over}
 name.split.each_with_index.map{|x, index| lowercase_words.include?(x) && index > 0 ? x : x.capitalize }.join(" ")
end
