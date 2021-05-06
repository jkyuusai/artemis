# frozen_string_literal: true

require_relative "artemis/plant"

class Artemis
  CHOICES = {
    1 => "Check things out",
    2 => "Get some sun",
    3 => "Wait a little",
    4 => "Wait a while",
  }.freeze

  def initialize
    @plant = Sunflower.new
    main_loop
  end

  def main_loop
    while @plant.height < 10
      choice = get_next_choice
      unless CHOICES.include?(choice)
        puts "Sorry, I didn't catch that."
        next
      end
      act(choice)
    end
    puts @plant.name + " has matured. Great job! :)"
  end

  def get_next_choice
    print "What would you like to do? "
    gets.chomp.to_i
  end

  def act(choice)
    case choice
    when 1
      #TODO: Implement
        print_status
      when 2
        @plant.add_sunlight(5)
      when 3
        @plant.try_to_grow(1)
      when 4
        @plant.try_to_grow(5)
    end
  end
end

Artemis.new
