class ApodFacade

  def source
    return_json[:hdurl]
  end

  def description
    "#{return_json[:title]}" + ", " + "#{return_json[:copyright]}"
  end

  private

  def return_json
    service.get_json
  end

  def service
    ApodService.new
  end
end
