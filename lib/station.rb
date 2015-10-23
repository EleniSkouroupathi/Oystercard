

# class Station

# 	attr_reader :name, :zone

# 	def initialize (name = "Old Street", zone = 1)
# 		@name = "Old Street"
# 		@zone = zone
# 	end

# end

Station = Struct.new(:name, :zone)
STATIONS = { 
	old_street: Station.new("Old Street", 1), 
	aldgate: Station.new("Aldgate", 3)
}