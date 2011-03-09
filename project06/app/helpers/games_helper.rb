module GamesHelper
  def percent_rated(games)
    (games.each.count(&:rating).to_f / games.count.to_f) * 100
  end
end
