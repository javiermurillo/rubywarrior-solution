module WarriorUtils

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
    return false if @warrior.look[0].to_s == "Archer" or @warrior.look[1].to_s == "Archer"
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
    (@obj[0] == "Sludge" or @obj == "Wizard") or (@obj[0] == "nothing" and (@obj[1] == "Sludge" or @obj[1] == "Wizard")) or (((@obj[0] and @obj[1]) == "nothing") and (@obj[2] == "Sludge" or @obj[2] == "Wizard")) ? true : false
  end
end
