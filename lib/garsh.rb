require "faraday"
require "typhoeus"
require "typhoeus/adapters/faraday"

require "garsh/version"

class Garsh
  attr_reader :code
  GA_ENDPOINT = "https://www.google-analytics.com"

  def self.client(code = ENV['GA_CODE'])
    return new(code)
  end

  def initialize(code)
    @code = code
    @adapter = defined?(Typhoeus) ? :typhoeus : Faraday.default_adapter
  end

  def create_event(action:, category: "", client_id: "555")
    event = Event.new(code: code, action: action, category: category, client_id: client_id)
    send_payload(Event::ENDPOINT, event.to_params)
  end

  def send_payload(endpoint, params)
    @http_client ||= Faraday.new(url: GA_ENDPOINT) { |cli|
      cli.adapter @adapter
      cli.response :logger
    }
    @http_client.get(endpoint, params)
  end

  class Event
    attr_reader   :version
    attr_reader   :tracking_code
    attr_accessor :client_id
    attr_accessor :category
    attr_accessor :action

    ENDPOINT = "collect"

    EVENT_ID = "event"

    def initialize(opts={})
      # required
      @tracking_code = opts.fetch(:code)
      @action = opts.fetch(:action)
      # optional
      @client_id = opts.fetch(:client_id, "")
      @version = opts.fetch(:version, 1)
      @category = opts.fetch(:category, "")
    end

    def to_params
      {
        v: version,
        tid: tracking_code,
        cid: client_id,
        t: EVENT_ID,
        ec: category,
        ea: action
      }
    end
  end
end
