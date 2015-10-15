require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike, working=true)
    fail 'Docking station full' if full?
    bike.working = working
    bikes << bike
  end

  def release_bike
    fail 'No bikes available' if empty? || !bikes.any? { |bike| bike.working? }
    bikes.pop
  end

  def release_broken_bike
    fail 'No bikes available' if empty?
    broken_bike = nil
    bikes.each do |bike|
      if !bike.working
        bikes.delete(bike)
        broken_bike = bike
        break
      end
    end
    broken_bike
  end


  private

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end
end