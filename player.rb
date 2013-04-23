class Player
  def play_turn(warrior)
    @health ||= warrior.health
    @warrior = warrior
    @retreating ||= 0

    if enemy?
      warrior.attack!
    elsif can_shoot?
      warrior.shoot!
    elsif captive?
      warrior.rescue!
    elsif retreating?
      wall? ? warrior.rest! : warrior.walk!
      @retreating -= 1
    elsif dying?
      @retreating = 3
      warrior.pivot!
    elsif taking_damage?
      warrior.walk!
    elsif can_rest?
      warrior.rest!
    elsif wall?
      warrior.pivot!
    elsif space?
      warrior.walk!
    end
    @health = warrior.health
  end

  def enemy?
    @warrior.feel.enemy?
  end

  def space?
    @warrior.feel.empty?
  end

  def can_rest?
    space? and @warrior.health < 20
  end

  def taking_damage?
    @warrior.health < @health
  end

  def dying?
    @warrior.health < @health and @warrior.health < 10
  end

  def captive?
    @warrior.feel.captive?
  end

  def retreating?
    @retreating != 0
  end

  def wall?
    @warrior.feel.wall?
  end

  def can_shoot?
    @obj = Array.new(3)
    @warrior.look.each_with_index{ |objective,index|  @obj[index] = objective.to_s }
    (@obj[0] == "Wizard") or (@obj[0] == "nothing" and @obj[1] == "Wizard") or (((@obj[0] and @obj[1]) == "nothing") and @obj[2] == "Wizard") ? true : false
  end
end
