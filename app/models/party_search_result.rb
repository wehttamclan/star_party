class PartySearchResult
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def parties
    @parties ||= Party.near("80215") #test zip code entered
    # Party.where('zip_code = ? AND date >= ?', @zip_code, Date.today)
  end
end
