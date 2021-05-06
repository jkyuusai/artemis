# frozen_string_literal: true

class Plant
  attr_accessor :current_sunlight,
                :height,
                :maximum_sunlight,
                :minimum_sunlight,
                :name

  def initialize
    @current_sunlight = 0
    @height = 0
    super
  end

  def add_sunlight(minutes)
    if @current_sunlight >= 100
      puts "Wow it's really hot in here"
      @current_sunlight = 100
    else
      @current_sunlight += minutes * 5
      puts "The " + @name + " soaks in the rays."
    end
  end

  # Simulate time passing:
  # - check each minute if the plant is able to grow and add to height if it can
  # - consume materials (such as sunlight) whether it grows or not
  def try_to_grow(minutes)
    starting_height = @height
    minutes.times do
      @height += 1 if self.can_grow?
      @current_sunlight -= 1 if @current_sunlight.positive?
    end
    ending_height = @height
    total_growth = ending_height - starting_height
    if total_growth.zero?
      puts "Time wore on, but not much seemed to change."
    else
      #TODO: Pluralization
      puts "The " + @name + " grew by " + total_growth.to_s + " inches!"
    end
    puts "sunlight: " + @current_sunlight.to_s
  end

  def can_grow?
    puts "sunlight: " + @current_sunlight.to_s
    @current_sunlight.between?(@minimum_sunlight, @maximum_sunlight)
  end
end

class Sunflower < Plant
  def initialize
    @name = "Sunflower"
    @minimum_sunlight = 80
    @maximum_sunlight = 100
    super
  end
end

class Foxglove < Plant
  def initialize
    @name = "Foxglove"
    @minimum_sunlight = 30
    @maximum_sunlight = 50
    super
  end
end
