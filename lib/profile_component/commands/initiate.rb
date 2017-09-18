module ProfileComponent
  module Commands
    class Initiate
      include Command

      def self.configure(receiver, attr_name: nil)
        attr_name ||= :initiate
        instance = build
        receiver.public_send("#{attr_name}=", instance)
      end

      def self.call(profile_id: nil, name:, email:, avatar_url: nil, reply_stream_name: nil, previous_message: nil)     
        instance = self.build
        profile_id ||= Identifier::UUID::Random.get
        instance.(profile_id: profile_id, name: name, email: email, avatar_url: avatar_url, reply_stream_name: reply_stream_name, previous_message: previous_message)
      end

      def call(profile_id: nil, name:, email:, avatar_url: nil, reply_stream_name: nil, previous_message: nil)      
        initiate = self.class.build_message(Messages::Commands::Initiate, previous_message)

        initiate.profile_id = profile_id
        initiate.name = name
        initiate.email = email
        initiate.avatar_url = avatar_url
        initiate.time = clock.iso8601

        stream_name = command_stream_name(profile_id)

        write.(initiate, stream_name, reply_stream_name: reply_stream_name)

        initiate
      end
    end
  end
end
