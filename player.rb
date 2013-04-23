class Player
  def play_turn(warrior)
    @warrior = warrior

    if enemy?
      warrior.attack!
    elsif can_rest?
      warrior.rest!
    elsif space?
      warrior.walk!
    end
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
end
