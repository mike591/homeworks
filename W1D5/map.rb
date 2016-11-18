class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    location = lookup(key)
    if location != nil
      @map[location][1] = value
    else
      @map << [key,value]
    end
  end

  def lookup(key)
    location = nil
    @map.each_with_index do |el, idx|
      location = idx if el[0] == key
    end
    return location
  end

  def remove(key)
    location = lookup(key)
    @map.slice!(location,1)
  end

  def show
    @map
  end
end
