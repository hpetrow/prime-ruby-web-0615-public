# Add  code here!
require 'benchmark'

def prime? (n)
  if (n <= 0)
    result = false
  elsif (n ==1 || n == 2)
    result = true
  else
    primes = sieve_of_eras(n)
    result = primes.last == n ? true : false
  end
  result
end

def sieve_of_eras (n)
  primes = (3..n).to_a
  primes = primes.select {|n| n == 2 || n.odd?}
  primes.each {|prime|
    break if prime**2 > primes.last
    primes = primes.select {|n| n == prime || n%prime != 0}
  }
  primes
end

Benchmark.bm do |bm|
  bm.report {prime?(1000)}
end
