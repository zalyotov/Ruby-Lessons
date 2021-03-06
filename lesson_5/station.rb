class Station
  attr_accessor :trains
  attr_reader :name
  # переменная класса
  @@stations = []

  class << self
    def all
      @@stations
    end
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def arrive(train)
    puts "Поезд №#{train.number} (#{train.type}) прибыл на станцию #{self.name}" if self.trains << train
    train.stop
  end

  def departure(train)
    puts "Поезд №#{train.number} (#{train.type}) убыл со станции #{@name}" if self.trains.delete(train)
    train.go(50)
  end

  # в задании надо "возвращать список поездов на станции 
  # по типу (см. ниже): кол-во грузовых, пассажирских", 
  # тоесть вернуть все поезда, отсортированные по типу
  def train_filter_list
    result = {cargo: 0, passanger: 0}
    self.trains.each do |train| 
      if train.type == "cargo"
        result[:cargo] += 1
      else
        result[:passanger] += 1
      end
    end
    puts "Список поездов, находящиеся на станции #{@name} по типу: пассажирских - #{result[:passanger]}, грузовых - #{result[:cargo]}"
  end

  def train_list
    result = {cargo: 0, passanger: 0}
    self.trains.each do |train| 
      if train.class == CargoTrain
        result[:cargo] += 1
      else
        result[:passanger] += 1
      end
    end
    
    if result[:passanger] > 0 || result[:cargo] > 0
      puts "пассажирские - #{result[:passanger]}, грузовые - #{result[:cargo]}"
    else
      puts "поездов нет"
    end
  end
end