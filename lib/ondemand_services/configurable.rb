module OndemandServices

  # Configuration options for {Client}, defaulting to values in {Default}
  module Configurable

    # @!attribute [rw] client_id
    #   @return [String] Configure client ID / API key
    # @!attribute [rw] client_secret
    #   @return [String] Configure client secret
    # @!attribute [rw] device_id
    #   @return [String] Configure device ID
    # @!attribute [rw] device_token
    #   @return [String] Configure device token
    attr_accessor :client_id, :client_secret,
                  :device_id, :device_token

    class << self

      # List of configurable keys for {OndemandServices::Client}
      # @return [Array] of option keys
      def keys
        @keys ||= [
          :client_id,
          :client_secret,
          :device_id,
          :device_token
        ]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      OndemandServices::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", OndemandServices::Default.options[key])
      end
      self
    end
    alias setup reset!

    # Compares client options to a Hash of requested options
    #
    # @param opts [Hash] Options to compare with current client options
    # @return [Boolean]
    def same_options?(opts)
      opts.hash == options.hash
    end

    private

    def options
      Hash[OndemandServices::Configurable.keys.map{ |key| [key, instance_variable_get(:"@#{key}")] }]
    end
  end
end
