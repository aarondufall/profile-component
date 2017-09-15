require_relative '../../automated_init'

context "Handle Commands" do
  context "Open" do
    context "Ignored" do
      handler = Handlers::Commands.new

      initiate = Controls::Commands::Initiate.example

      profile = Controls::Profile::Initiated.example

      handler.store.add(profile.id, profile)

      handler.(initiate)

      writer = handler.write

      initiated = writer.one_message do |event|
        event.instance_of?(Messages::Events::Initiated)
      end

      test "Initiated Event is not Written" do
        assert(initiated.nil?)
      end
    end
  end
end
