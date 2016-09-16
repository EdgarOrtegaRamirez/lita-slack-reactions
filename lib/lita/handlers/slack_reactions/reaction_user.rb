module Lita
  module Handlers
    class SlackReactions
      class ReactionUser
        attr_reader :lita_user

        def initialize(lita_user)
          @lita_user = lita_user
        end
        
        def to_h
          {
            id: lita_user.id,
            name: lita_user.name,
            mention_name: lita_user.mention_name
          }
        end
      end
    end
  end
end