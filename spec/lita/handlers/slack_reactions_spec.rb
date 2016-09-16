require 'spec_helper'

describe Lita::Handlers::SlackReactions, lita_handler: true do
  it { is_expected.to route_event(:slack_reaction_added).to(:publish) }

  describe 'publishing' do
    let(:user) { Lita::User.new(123) }
    let(:item_user) { Lita::User.new(234) }
    let(:event_payload) { {user: user, name: 'smile', item_user: item_user, item: {'type' => 'message', 'channel' => 'C2147483705', 'ts' => 1474062804.000496}, event_ts: 1474262679.807762} }
    let(:channel) { Lita::Room.new('C2147483705') }
    let(:keen_payload) do
      {
        reaction: {
          name: 'smile',
          skin_tone: nil
        },
        user: {
          id: user.id,
          name: user.name,
          mention_name: user.mention_name
        },
        item_user: {
          id: item_user.id,
          name: item_user.name,
          mention_name: item_user.mention_name
        },
        item: {
          type: 'message',
          channel: {
            id: 'C2147483705',
            name: 'C2147483705'
          },
          timestamp: 1474062804.000496
        },
        timestamp: 1474262679.807762
      }
    end

    before do
      allow(Lita::Room).to receive(:fuzzy_find).and_return(channel)
    end

    it 'publishes to Keen IO' do
      expect(::Keen).to receive(:publish).once.with('reactions', keen_payload)
      robot.trigger :slack_reaction_added, event_payload
    end

  end
end
