class Train
  attr_accessor :number, :type, :speed, :wagons
  attr_writer :current_station_id

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
  end

  def add_route(route)
    @current_station_id = 0
    @route = route
  end

  def current_station
      @route.stations[@current_station_id]
  end

  def next_station
    route.stations[@current_station_id + 1]
  end

  def prev_station
    route.stations[@current_station_id - 1]
  end

  def forward
    @current_station_id += 1
  end

  def back
    @current_station_id -= 1
  end

  def stop
    self.speed = 0
  end

  def go(speed)
    self.speed = speed
  end

  def count_wagons
    self.wagons.count
  end 

  def add_wagon(wagon)
    self.wagons << wagon if valid_wagon?(wagon)    
  end

  def remove_wagon(wagon)
    wagons.delete(wagon) if stopped? && wagons.zero > 0
  end

  protected

  def stopped?
    speed == 0
  end

end