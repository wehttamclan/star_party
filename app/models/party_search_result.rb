class PartySearchResult
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def parties
    @parties ||= Party.where('date >= ?', Date.today).near(@zip_code, 15)
  end
end
