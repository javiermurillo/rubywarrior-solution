class Player
  def play_turn(warrior)
    @health ||= warrior.health
    @direction ||= :forward
    @warrior = warrior
    @retreating ||= 0

    change_direction if wall?

    if enemy?
      warrior.attack!(@direction)
    elsif captive?
      warrior.rescue!(@direction)
    elsif retreating?
      @retreating -= 1
      warrior.walk!(@direction)
    elsif dying?
      change_direction
      @retreating = 2
      warrior.walk!(@direction)
    elsif taking_damage?
      warrior.walk!(@direction)
    elsif can_rest?
      warrior.rest!
    elsif space?
      warrior.walk!(@direction)
    end
    @health = warrior.health
  end

  def enemy?
    @warrior.feel(@direction).enemy? ? true : false
  end

  def space?
    @warrior.feel(@direction).empty? ? true : false
  end

  def can_rest?
    space? and @warrior.health < 20 ? true : false
  end

  def taking_damage?
    @warrior.health < @health ? true : false
  end

  def dying?
    @warrior.health < @health and @warrior.health < 10 ? true : false
  end

  def captive?
    @warrior.feel(@direction).captive? ? true : false
  end

  def change_direction
    @direction = @direction == :backward ? :forward : :backward
  end

  def retreating?
    @retreating != 0 ? true : false
  end

  def wall?
    @warrior.feel(@direction).wall? ? true : false
  end
end
