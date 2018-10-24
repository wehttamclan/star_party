class DayForecast
  attr_reader :moon_phase,
              :rain_chance,
              :cloud_cover,
              :summary

  def initialize(data)
    @time        = data[:time]
    @moon_phase  = data[:moonPhase]
    @rain_chance = data[:precipProbability]
    @cloud_cover = data[:cloudCover]
    @summary     = data[:summary]
  end

  def time
    Time.at(@time)
  end 
end
