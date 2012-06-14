#reversing a string without using the reverse method
def my_reverse(string)
  remaining_characters = string.length
  reversed_string = ''
  while remaining_characters > 0
    remaining_characters -= 1
    reversed_string += string[remaining_characters]
  end
  reversed_string
end 


#TDDeliciousness
raise unless my_reverse("hello") == "olleh"
raise unless my_reverse("hello world!") == "!dlrow olleh"
raise unless my_reverse("a") == "a"
raise unless my_reverse("") == ""

#sorting an array without using sort
def my_sort(array) #used Quicksort algorithm, ironic?
 return array if nil || array.length <= 1 
 pivot, *rest = *array 
 less, more = rest.partition{|y| y < pivot} 
 my_sort(less) + [pivot] + my_sort(more) 
end


#TDDeliciousness
raise unless my_sort([2, 3, 1]) == [1, 2, 3]
raise unless my_sort([4, 5, 2, 3, 9, 6, 7, 1, 8, 10]) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
raise unless my_sort([3,1,2]) == [1,2,3]
raise unless my_sort([1]) == [1]
raise unless my_sort([]) == []
  
#Create a class with three attributes
class Person
  attr_accessor :first_name, :last_name, :age
  
  def initialize( first_name, last_name, age )
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end



#TDDeliciousness
p = Person.new("Earl", "Rubens-Watts", 2)
raise unless p.class == Person
raise unless p.first_name == "Earl"
raise unless p.last_name == "Rubens-Watts"
raise unless p.age == 2



#Extend the person class with a new attribute
class Musician < Person
  attr_accessor :instrument
  
  def initialize( first_name, last_name, age, instrument)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @instrument = instrument
  end
end


#TDDeliciousness
m = Musician.new("George", "Harrison", 58, "guitar")
raise unless m.first_name + " " + m.last_name + ": " + m.age.to_s == "George Harrison: 58"
raise unless m.instrument =="guitar"
puts "success"