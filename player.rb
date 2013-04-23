class Player
  def play_turn(warrior)
    @health ||= warrior.health
    @warrior = warrior

    if enemy?
      warrior.attack!
    elsif captive?
      warrior.rescue!
    elsif taking_damage?
      warrior.walk!
    elsif can_rest?
      warrior.rest!
    elsif space?
      warrior.walk!
    end
    @health = warrior.health
  end

  def enemy?
    @warrior.feel.enemy? ? true : false
  end

  def space?
    @warrior.feel.empty? ? true : false
  end

  def can_rest?
    space? and @warrior.health < 20 ? true : false
  end

  def taking_damage?
    @warrior.health < @health ? true : false
  end

  def captive?
    @warrior.feel.captive? ? true : false
  end
end
