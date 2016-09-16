module Lita
  module Handlers
    class SlackReactions
      class Reaction
        attr_reader :name, :skin_tone

        def initialize(reaction)
          @name, @skin_tone = reaction.split('::')
        end

        def to_h
          {
            name: name,
            skin_tone: skin_tone
          }
        end
      end
    end
  end
end
