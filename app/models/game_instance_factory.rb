class GameInstanceFactory
  def self.create_from level
    return nil if level.order <= 0 || level.order >= 20

    if level.game.name == 'Parecidos'
      return Mating::IdenticalObjectsMating.new level if level.order == 1
      return Mating::NonIdenticalObjectsMating.new level if level.order >= 2
    elsif level.game.name == 'Secuencia'
      return Sequence.new level
    else
      return nil
    end
  end
end
