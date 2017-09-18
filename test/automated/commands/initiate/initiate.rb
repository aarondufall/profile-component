require_relative '../../automated_init'

context "Commands" do
  context "Initiate" do
    profile_id = Controls::Profile.id
    name = Controls::Profile.name
    email = Controls::Profile.email
    avatar_url = Controls::Profile.avatar_url
    effective_time = Controls::Time::Effective::Raw.example

    initiate = Commands::Initiate.new
    initiate.clock.now = effective_time

    initiate.(profile_id: profile_id, name: name, email: email, avatar_url: avatar_url)

    write = initiate.write

    initiate_message = write.one_message do |written|
      written.instance_of?(Messages::Commands::Initiate)
    end

    test "Initiate command is written" do
      refute(initiate_message.nil?)
    end

    test "Written to the profile command stream" do
      written_to_stream = write.written?(initiate_message) do |stream_name|
        stream_name == "profile:command-#{profile_id}"
      end

      assert(written_to_stream)
    end

    context "Attributes" do
      test "profile_id is assigned" do
        assert(initiate_message.profile_id == profile_id)
      end

      test "name is assigned" do 
        assert(initiate_message.name == name)
      end

      test "email is assigned" do 
        assert(initiate_message.email == email)
      end

      test "avatar_url is assigned" do 
        assert(initiate_message.avatar_url == avatar_url)
      end

      test "time" do
        effective_time_iso8601 = Clock.iso8601(effective_time)

        assert(initiate_message.time == effective_time_iso8601)
      end
    end
  end
end
