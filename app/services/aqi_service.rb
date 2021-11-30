class AqiService
  BASE_URL = "http://api.waqi.info/feed".freeze
  TOKEN = "b8435bf86e53fd842f3a8ee9410ca37de428c3c3".freeze

  attr_accessor :city, :conn

  def self.call(city)
    AqiService.new.get_pm25(city)
  end

  def initialize
    @conn = Faraday.new(url: BASE_URL) do |conn|
      conn.use Faraday::Response::RaiseError
      conn.adapter Faraday::Adapter::NetHttp
    end
  end

  def get_pm25(city)
    response = conn.get(BASE_URL + '/' + city + '/?token=' + TOKEN)
    if response.body
      JSON.parse(response.body).dig('data', 'iaqi', 'pm25', 'v')
    else
      nil
    end
  end
end
