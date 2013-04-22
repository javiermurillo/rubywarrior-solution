class Player
  def play_turn(warrior)
    @warrior = warrior
    if enemy?
      warrior.attack!
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
end
