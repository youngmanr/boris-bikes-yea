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
    fail 'No bikes available' if empty? || !bikes.any? { |e|  }? { |bike| bike.working? }
    bikes.pop
  end

  private

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end
end