object @replay => :replay
child :game => :game do

  attribute :category,
    :map,
    :speed,
    :time,
    :type

  child :winner => :winner do
    attributes :actual_race,
      :chosen_race,
      :handicap,
      :id,
      :name,
      :won,
      :color
  end

end

child :players => :players do
  attributes :actual_race,
    :chosen_race,
    :handicap,
    :id,
    :name,
    :won,
    :color
end
