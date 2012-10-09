# Find the average

def average(numbers)
  sum = 0.0
  numbers.each { |i| sum += i }
  (sum / numbers.count)
end

# Write a method that creates a cat

def make_cat(cat_name, home_city, age)
  { "name"=> cat_name, "home_city" => home_city, "age" => age }
end



# Write a method that computes the average cat age

def average_cat_age(cats)
   numbers = []
   for cat in cats do
     numbers << cat["age"].to_f
   end
   intergize(average(numbers))  # new new method added
end

# Write a method that computes the number of cats in each city

def cats_per_city(cats)
 cities = {}
 for cat in cats do
   if cities.keys.include?(cat["home_city"])
     cities[cat["home_city"]] += 1
   else
     cities[cat["home_city"]] = 1
   end
 end
 cities
end

# convenience method that formats float ending in .0 into integers
def intergize(num)
  if num%1 == 0.0
    num.to_i
  else
    num
  end
end

# tests: Find the average
average([5]) == 5
average([5, 15]) == 10
average([5, 10, 15]) == 10
average([5, 6]) == 5.5

# tests: Write a method that creates a cat

fluffy = make_cat("Breakfast", "San Francisco", 10) == {
  "name" => "Breakfast",
  "home_city" => "San Francisco",
  "age" => 10
}

# tests: Write a method that computes the average cat age
cat1 = make_cat("Breakfast", "San Francisco", 10)
cat2 = make_cat("Earl", "San Francisco", 2)
cat3 = make_cat("Gizmo", "Albany", 12)
average_cat_age([cat1, cat2, cat3]) == 8

cat4 = make_cat("Breakfast", "San Francisco", 5.5)
cat5 = make_cat("Earl", "San Francisco", 5.5)
cat6 = make_cat("Gizmo", "Albany", 5.5)
average_cat_age([cat4, cat5, cat6]) == 5.5

# tests Write a method that computes the number of cats in each city
cat2 = make_cat("Earl", "San Francisco", 2)
cat3 = make_cat("Gizmo", "Albany", 12)
cats_per_city([cat1, cat2, cat3]) == {
  "San Francisco" => 2,
  "Albany" => 1
}