# lita-slack-reactions

A handler that subscribes itself to the `slack_reaction_added` event from [lita-slack](https://github.com/litaio/lita-slack) and publish to [Keen.io](https://keen.io).

More information:

* Slack API: https://api.slack.com/events/reaction_added

## Installation

Add lita-slack-reactions to your Lita instance's Gemfile:

```ruby
gem "lita-slack-reactions"
```

## Configuration

### Required ENV varibles

* `KEEN_PROJECT_ID` - Keen IO Project ID
* `KEEN_WRITE_KEY` - Keen IO Write Key

### Optional attributes
* `keenio.collection` (`String`) - The collection name in Keen IO (default: `reactions`)

#### Example

```ruby
Lita.configure do |config|
  # ...
  config.handlers.slack_reactions.keenio.collection = 'reactions'
end
```
