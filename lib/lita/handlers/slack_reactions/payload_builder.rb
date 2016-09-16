module Lita
  module Handlers
    class SlackReactions
      class PayloadBuilder
        attr_reader :user, :item_user, :item, :channel, :reaction, :timestamp

        def self.build(payload)
          new(payload).build
        end

        def initialize(payload)
          @user = ReactionUser.new(payload[:user])
          @item_user = ReactionUser.new(payload[:item_user])
          @item = Item.for(payload[:item])
          @reaction = Reaction.new(payload[:name])
          @timestamp = payload[:event_ts].to_f
        end

        def build
          {
            reaction: reaction.to_h,
            user: user.to_h,
            item_user: item_user.to_h,
            item: item.to_h,
            timestamp: timestamp
          }
        end
      end
    end
  end
end
