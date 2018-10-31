class ApodFacade

  def source
    return_json[:hdurl]
  end

  def title
    return_json[:title]
  end

  # def copyright
  #   if return_json[:copyright]
  #     return_json[:copyright]
  #   else
  #     "Public Domain"
  #   end
  # end

  private
  def return_json
    service.get_json
  end

  def service
    @service ||= ApodService.new
  end
end
