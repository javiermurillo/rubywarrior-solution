require 'warrior_utils.rb'

class Player
  include WarriorUtils
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
end
