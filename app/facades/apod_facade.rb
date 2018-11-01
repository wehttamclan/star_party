class ApodFacade

  def source
    if return_json[:hdurl]
      return return_json[:hdurl]
    else
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Hubble_ultra_deep_field_high_rez_edit1.jpg/768px-Hubble_ultra_deep_field_high_rez_edit1.jpg"
    end
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
