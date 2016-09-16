module Lita
  module Handlers
    class SlackReactions
      class Item
        def self.for(payload)
          case payload['type']
          when 'message'
            MessageItem.new(payload)
          when 'file'
            FileItem.new(payload)
          when 'file_comment'
            FileCommentItem.new(payload)
          end
        end
      end

      class FileItem
        attr_reader :type, :file

        def initialize(payload)
          @type = payload['type']
          @file = payload['file']
        end

        def to_h
          {
            type: type,
            file: {
              id: file
            }
          }
        end
      end

      class FileCommentItem
        attr_reader :type, :file, :file_comment

        def initialize(payload)
          @type = payload['type']
          @file = payload['file']
          @file_comment = payload['file_comment']
        end

        def to_h
          {
            type: type,
            file: {
              id: file
            },
            file_comment: {
              id: file_comment
            }
          }
        end
      end

      class MessageItem
        attr_reader :type, :timestamp, :channel

        def initialize(payload)
          @type = payload['type']
          @timestamp = payload['ts'].to_f
          @channel = Lita::Room.fuzzy_find(payload['channel'])
        end

        def to_h
          {
            type: type,
            timestamp: timestamp,
            channel: {
              id: channel.id,
              name: channel.name
            }
          }
        end
      end
    end
  end
end
