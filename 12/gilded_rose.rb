class GildedRose
  attr_reader :name, :quality, :days_remaining

  def initialize(name, quality, days_remaining)
    @name, @quality, @days_remaining = name, quality, days_remaining
  end

  def normal_tick
    if @quality != 0
      if @days_remaining <= 0
        @quality -= 1
      end

      @quality -= 1
    end

    @days_remaining -= 1
  end

  def brie_tick
    @quality += 1 if @quality < 50
    @quality += 1 if @days_remaining <= 0
    @days_remaining -= 1
  end

  def sulfuras_tick



  end

  def backstage_tick

    
    @quality = 0 if @days_remaining <= 0 
    @quality +=1 if @days_remaining == 11 && @quality < 50
    @quality += 2 if @days_remaining > 5 && @days_remaining <11
    @quality += 3 if @days_remaining <= 5 && @days_remaining > 0

    
    

    @days_remaining -= 1

  end

  def tick
    return normal_tick if @name == "normal"
    return brie_tick if @name == "Aged Brie"
    return sulfuras_tick if @name == "Sulfuras, Hand of Ragnaros"
    return backstage_tick if @name == "Backstage passes to a TAFKAL80ETC concert"
  end

end

