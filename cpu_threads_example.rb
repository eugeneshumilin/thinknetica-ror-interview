require 'benchmark'

def fib(n)
  return n if [0,1].include?(n)

  fib(n-1) + fib(n-2)
end

result = Benchmark.measure do
  threads = []

  10.times do
    threads << Thread.new { Thread.current[:output] = fib(35) } 
  end 

  threads.each { |thread| thread.join }
end

puts result
# CPU time | system CPU time | the sum of the user and system CPU times | elapsed real time
# 19.992102|      0.025245   |        20.017347                         |    ( 20.061374)

###########

# Without threads

# Benchmark.measure { 10.times { fib(35) } }
# 19.439084   0.008511  19.447595 ( 19.463788)

# We don't have any advantages to using threads in CPU bound tasks