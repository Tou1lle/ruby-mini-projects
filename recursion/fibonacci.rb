def fibs(n)
  arr_fib = []

  for i in 0..n do 
    if i < 2
      arr_fib << i
    else
      arr_fib << (arr_fib[i - 1] + arr_fib[i - 2])
    end
  end

  arr_fib
end

def fib_rec(n)
  return [0] if n === 0
  return [0, 1] if n === 1

  fib_sequence = fib_rec(n-1)
  fib_sequence << fib_sequence[-1] + fib_sequence[-2]
  fib_sequence
end

p fibs(5)
p fib_rec(5) 