
# Build a Ruby class for a `Building` that:

# * Initializes with a name, address, number of floors, and number of tenants
# * The name and number of tenants should be readable and writeable
# * The address should be readable
# * The number of floors should not be readable or writeable
# * The class should keep track of all buildings that are created
# * The class should tell the average number of tenants in a building
# * A building should have a placard method that returns the name and address of the building
# * A building should have a method returns the average number of tenants per floor

# Then:

# Make objects for the three buildings on this corner. Use a Fermi estimate for the number of tenants.
require 'pry'
class Building
    attr_accessor :name, :number_of_tenants
    attr_reader :number_of_floors

    @@all = []
    def initialize name, address, number_of_floors, number_of_tenants
        @name = name
        @address = address
        @number_of_floors = number_of_floors
        @number_of_tenants = number_of_tenants
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.average_number_of_tenants
        tenants_total, number_of_entry = self.total_and_length_of_tenants
        average_tenants = tenants_total/number_of_entry
        return average_tenants.round()
    end


    def self.placard
        'The name is #{@name} and the building is #{@address}'
    end

    def average_number_of_tenants_per_floor
        @number_of_tenants/@number_of_floors

    end

    def self.total_and_length_of_tenants
        length = @@all.count
        total = @@all.reduce(0) do |tot, building|
            tot + building.number_of_tenants
        end
        return total, length       

    end




end
