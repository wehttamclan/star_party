class ApodService
  def conn
    Faraday.new(url: "https://api.nasa.gov")
  end

  def response
    conn.get("/planetary/apod?api_key=#{ENV["NASA_API_KEY"]}")
  end

  def get_json
    JSON.parse(response.body, symbolize_names: true)
  end
end
