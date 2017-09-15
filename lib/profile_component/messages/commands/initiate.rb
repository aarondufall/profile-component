module ProfileComponent
  module Messages
    module Commands
      class Initiate
        include Messaging::Message

        attribute :profile_id, String
        attribute :name, String
        attribute :email, String
        attribute :avatar_url, String
        attribute :github_id, String
        attribute :time, String
      end 
    end
  end
end
