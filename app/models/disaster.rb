require 'faraday'
require 'json'

class Disaster < ActiveRecord::Base

  def self.list_all
    request_disasters
  end

  private

  def self.request_disasters
    @conn = Faraday.new(:url => "http://api.rwlabs.org")
    response = @conn.get "/v1/reports"
    # Unirest::get "http://api.rwlabs.org/v1/reports"
    JSON.parse(response.body, symbolize_names:true)[:data]
  end

end
