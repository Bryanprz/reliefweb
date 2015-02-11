require 'json'

class Disaster < ActiveRecord::Base

  def self.list_all
    request_disasters
  end

  private

  def self.request_disasters
    response = Unirest::get "http://api.rwlabs.org/v1/reports"
    JSON.parse(response.body, symbolize_names:true)
  end

end
