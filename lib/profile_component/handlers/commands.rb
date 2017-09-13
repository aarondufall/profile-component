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

      # TODO Implement command handler block
      # eg:
      # handle DoSomething do |do_something|
      #   profile_id = do_something.profile_id

      #   profile, version = store.fetch(profile_id, include: :version)

      #   if profile.something_happened?
      #     logger.info(tag: :ignored) { "Command ignored (Command: #{do_something.message_type}, Profile ID: #{profile_id})" }
      #     return
      #   end

      #   something_happened = SomethingHappened.follow(do_something)

      #   something_happened.processed_time = clock.iso8601

      #   stream_name = stream_name(profile_id)

      #   write.(something_happened, stream_name, expected_version: version)
      # end
    end
  end
end
