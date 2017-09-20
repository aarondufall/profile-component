context "Commands" do
  context "Initiate" do
    context "Previous Message" do
      previous_message = Controls::Message.example

      profile_id = Controls::Profile.id
      name = Controls::Profile.name
      email = Controls::Profile.email
      avatar_url = Controls::Profile.avatar_url
      effective_time = Controls::Time::Effective::Raw.example

      initiate = Commands::Initiate.new
      initiate.clock.now = effective_time
      
      initiate.(profile_id: profile_id, name: name, email: email, avatar_url: avatar_url, previous_message: previous_message)

      write = initiate.write

      initiate_message = write.one_message do |written|
        written.instance_of?(Messages::Commands::Initiate)
      end

      refute(initiate_message.nil?)

      test "Initiate message follows previous message" do
        assert(initiate_message.follows?(previous_message))
      end
    end
  end
end
