require_relative '../../automated_init'

context "Handle Commands" do
  context "Initiate" do
    context "Initiated" do
      handler = Handlers::Commands.new

      processed_time = Controls::Time::Processed::Raw.example

      handler.clock.now = processed_time

      initiate = Controls::Commands::Initiate.example

      profile_id = initiate.profile_id or fail
      name = initiate.name or fail
      email = initiate.email or fail
      avatar_url = initiate.avatar_url or fail
      github_id = initiate.github_id or fail
      effective_time = initiate.time or fail 

      handler.(initiate)

      writer = handler.write

      initiated = writer.one_message do |event|
        event.instance_of?(Messages::Events::Initiated)
      end

      test "Initiated Event is Written" do
        refute(initiated.nil?)
      end

      test "Written to the profile stream" do
        written_to_stream = writer.written?(initiated) do |stream_name|
          stream_name == "profile-#{profile_id}"
        end

        assert(written_to_stream)
      end

      context "Attributes" do
        test "profile_id" do
          assert(initiated.profile_id == profile_id)
        end

        test "name" do
          assert(initiated.name == name)
        end

        test "time" do
          assert(initiated.time == effective_time)
        end

        test "email" do
          assert(initiated.email == email)
        end

        test "avatar_url" do
          assert(initiated.avatar_url == avatar_url)
        end

        test "github_id" do
          assert(initiated.github_id == github_id)
        end

        test "processed_time" do
          processed_time_iso8601 = Clock::UTC.iso8601(processed_time)

          assert(initiated.processed_time == processed_time_iso8601)
        end
      end
    end
  end
end
