#write your code here

def single_word_translate(word)

 vowels = ['a','e','i','o','u']
 i = 0 
  
  if vowels.include? word[0].downcase
    return "#{word}ay"
  elsif ((vowels.include? word[1].downcase) == true) && word[0,2].downcase != 'qu'
     return word[1,word.length]+word[0]+"ay"
  elsif ((vowels.include? word[1].downcase) == false) && ((vowels.include? word[2].downcase) == false) 
     return word[3,word.length]+word[0,3]+"ay"
  elsif (((vowels.include? word[1].downcase) == false)|| word[0,2].downcase == 'qu') && ((vowels.include? word[2].downcase) == true)
     return word[2,word.length]+word[0,2]+"ay"
  else
    return "No"
  end   

end

def translate(word)

word_array = word.split(" ")
output = []
i = 0
 while i < word_array.length
  output[i.to_i]=single_word_translate(word_array[i.to_i])
  i+=1
 end
 return output.join(" ") 
end
