module Lita
  module Handlers
    class SlackReactions
      extend ::Lita::Handler::EventRouter

      config :keenio do
        config :collection, type: String, default: 'reactions'
      end

      on :slack_reaction_added, :publish

      def publish(data)
        payload = PayloadBuilder.build(data)
        log.info "Publishing #{data[:name]} to Keen IO ---"
        log.info ::Keen.publish(config.keenio.collection, payload)
      end

      ::Lita.register_handler(self)
    end
  end
end
