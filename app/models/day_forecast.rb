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

  def star_party_rating
    raw_score = moonscore + rain_chance + cloud_cover
    (10 - ((raw_score) * 2.5)).round(2)
  end

  def image_tag
    moon = (moon_phase * 10).round()
    cloud = (cloud_cover * 10).round()
    cloud = 9 if cloud == 10
    moon = 0 if moon == 10
    moon = 0 if cloud == 9
    "#{cloud}#{moon}"
  end

  def moon_name
    moon_phase_namer.each do |range, name|
      if range === moon_phase
        return name
      end
    end
  end

  private

  def moon_phase_namer
    {
      0..0.2 => "New Moon",
      0.3..0.24 => "Waxing Crescent",
      0.25 => "First Quarter Moon",
      0.26...0.49 => "Waxing Gibbous",
      0.5 => "Full Moon",
      0.51..0.74 => "Waning Gibbous",
      0.75 => "Last Quarter Moon",
      0.76..0.97 => "Waning Crescent",
      0.98..1 => "New Moon"
    }
  end

  def moon_phase_converter
    {
      0..0.25 => 0,
      0.26...0.5 => 0.5,
      0.5 => 1,
      0.51..0.75 => 0.5,
      0.76..1 => 0
    }
  end

  def moonscore
    moon_phase_converter.each do |range, score|
      if range === moon_phase
        return score
      end
    end
  end
end
