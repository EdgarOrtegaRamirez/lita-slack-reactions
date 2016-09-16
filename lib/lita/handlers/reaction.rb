module Lita
  module Handlers
    class Reaction
      extend Lita::Handler::EventRouter

      on :slack_reaction_added, :store

      def store(payload)
        payload[:user]
        payload[:name]
        payload[:item]
        payload[:event_ts]
      end

      Lita.register_handler(self)
    end
  end
end
