class Car
	def sound
		return "Brooom"
	end

	def num_wheels
		return 4
	end

end

class Bicycle
	def sound
		return "clackety clack"
	end

	def num_wheels
		return 2
	end
end

class Counter
	def initialize(vehicles)
		@vehicles = vehicles
	end

	def count_wheels
		@vehicles.reduce(0) do |sum, vehicle| 
			sum + vehicle.num_wheels
		end
	end
end

class SoundMaker
	def initialize(sounds)
		@sounds = sounds
	end

	def total_sounds
		@sounds.each do |vehicle|
			puts vehicle.sound
		end
	end
end

vehicles = [Car.new, Bicycle.new]
total_wheels = Counter.new(vehicles).count_wheels
SoundMaker.new(vehicles).total_sounds
puts total_wheels
