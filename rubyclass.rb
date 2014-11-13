class Greeter

	attr_accessor :name

	def initialize(name="World")
		@name = name
	end

	def hi
		puts "hello #{@name}\n"
	end

	def bi
		puts "bibi #{@name}\n"
	end
end

class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

end


marcin = Greeter.new("marcin")
world = Greeter.new

marcin.hi
world.hi

#puts Greeter.instance_methods
#puts Greeter.class
#puts Greeter.class.superclass
puts world.name

#puts 'marcin reponds to name' + marcin.respond_to?("name").to_s
#puts 'marcin reponds to name' + marcin.respond_to?("hi").to_s


if __FILE__ == $0   #contains the name of the current file
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
