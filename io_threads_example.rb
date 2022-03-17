require 'benchmark'
require 'net/http'

LINKS = Array.new(1000, "ya.ru")

def get_response(links)
  threads = []

  links.each do |link| 
    threads << Thread.new do
      response = Net::HTTP.get_response(link, '/')
      puts link, response.code
    end
  end

  threads.each { |thread| thread.join }
end

puts Benchmark.measure { get_response(LINKS) }

# CPU time | system CPU time | the sum of the user and system CPU times | elapsed real time
# 0.655518 |  0.784549       |     1.440067                             |   (  0.820569)

###########

# Without threads

# def get_response(links)
#   links.each do |link| 
#     response = Net::HTTP.get_response(link, '/')
#     puts link, response.code
#   end
# end
# 0.540842 |  0.452501  | 0.993343 | ( 24.989710)

# Without threads we have worst result -- too big elapsed time