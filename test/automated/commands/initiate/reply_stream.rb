require_relative '../../automated_init'

context "Commands" do
  context "Initiate" do
    context "Reply Stream" do
      profile_id = Controls::Profile.id
      name = Controls::Profile.name
      email = Controls::Profile.email

      reply_stream = 'someReplyStream'
      initiate = Commands::Initiate.new

      initiate.(name: name, email: email, reply_stream_name: reply_stream)

      write = initiate.write

      initiate_message = write.one_message do |written|
        written.instance_of?(Messages::Commands::Initiate)
      end

      refute(initiate_message.nil?)

      test "Reply stream is set" do
        assert(initiate_message.metadata.reply_stream_name == reply_stream)
      end
    end
  end
end
