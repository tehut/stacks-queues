require './Stack.rb'
require './Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll,:count

  def initialize(jobs_available, total_jobs)
    #setting total numbers
    @count = total_jobs
    all = Array.new
    (0..count).each{|number|all.push("Worker ##{number+1}")}
    #splitting workers between those working and those waiting
    starting_workers = all.slice(0..jobs_available)
    waiting_workers = all.slice(jobs_available + 1..-1)

    @workers = Stack.new
    starting_workers.each{|worker|workers.push(worker)}

    @waiting = Queue.new
    waiting_workers.reverse.each{|worker|waiting.enqueue(worker)}
  end

  def cycle
    roll = rand(1..6)
    hold = []
    roll.times do
      fired = @workers.pop
      hold << fired
      puts "FIRED: #{fired}"
    end

    hold.each{|worker|waiting.enqueue(worker)}

    roll.times do
      hired = @waiting.dequeue
      puts "HIRE: #{hired}"
      @workers.push(hired)
    end




  end
end

## Allows us to run our code and see what's happening:
sim = JobSimulation.new(6,10)
puts "------------------------------"
puts "Before the simulation starts"
puts "Employed: #{sim.workers}"
puts "Waitlist: #{sim.waiting}"
puts "------------------------------"
print "<enter to cycle>\n"

count = 0
until gets.chomp != ""
  puts "-------Cycle #{count+=1}-------"
  sim.cycle
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
end
