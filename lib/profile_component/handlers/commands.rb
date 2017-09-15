module ProfileComponent
  module Handlers
    class Commands
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Commands
      include Messages::Events

      dependency :write, Messaging::Postgres::Write
      dependency :clock, Clock::UTC
      dependency :store, Store

      def configure
        Messaging::Postgres::Write.configure(self)
        Clock::UTC.configure(self)
        Store.configure(self)
      end

      category :profile

      handle Initiate do |initiate|
        profile_id = initiate.profile_id

        profile = store.fetch(profile_id)

        if profile.initiated?
          logger.info(tag: :ignored) { "Command ignored (Command: #{initiate.message_type}, Profile ID: #{profile_id})" }
          return
        end

        initiated = Initiated.follow(initiate)

        initiated.processed_time = clock.iso8601

        stream_name = stream_name(profile_id)

        write.initial(initiated, stream_name)
      end
    end
  end
end
