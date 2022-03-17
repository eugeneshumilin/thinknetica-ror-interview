module Runner
  def run(args)
    puts "Worker started: #{args.inspect}"
    result = super
    puts "Worker finished: #{result}" 
  end
end

class Worker
  prepend Runner
  
  def run(args)
    args.each do |arg|
      # do something
    end
    
    :ok
  end
end