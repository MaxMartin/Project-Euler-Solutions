# Sandwich code common to all problems, handles output & timer
def problem(n)
  puts "Problem #{n}"
  start_time = Time.now
  puts "Solution: #{yield}"
  puts "Took #{Time.now-start_time} seconds"
  puts
end

# Problem 1
problem(1){(1...1000).select{|x| x%3==0 || x%5==0}.inject(0){|s,x| s+x}}

# Problem 2
problem(2) do
  a=b=1
  s=0
  while a<4000000
    a,b=b,a+b
    s+=a if a.even?
  end
  s
end

# Problem 3
class Fixnum
  def prime?
    (2..Math.sqrt(self).floor).each do |y|
      return false if self%y==0
    end
    true
  end
  def largest_prime_factor
    lpf=nil
    (2..Math.sqrt(self).floor).each do |y|
      lpf=y if self%y==0 && y.prime?
    end
    lpf
  end
end

problem(3){600851475143.largest_prime_factor}

# Problem 4
class Fixnum
  def palindrome?
    num_str=self.to_s
    (0..(num_str.length/2).floor).each do |i|
      return false if num_str[i] != num_str[-(i+1)]
    end
    true
  end
end

problem(4) do
  largest_palindrome=0
  (100..999).each do |x|
    (100..999).each do |y|
      largest_palindrome=x*y if (x*y)>largest_palindrome && (x*y).palindrome?
    end
  end
  largest_palindrome
end
