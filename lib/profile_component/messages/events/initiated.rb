module ProfileComponent
  module Messages
    module Events
      class Initiated
        include Messaging::Message

        attribute :profile_id, String
        attribute :name, String
        attribute :email, String
        attribute :avatar_url, String
        attribute :github_id, String
        attribute :time, String
        attribute :processed_time, String
      end 
    end
  end
end
