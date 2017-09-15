module ProfileComponent
  module Controls
    module Commands
      module Initiated
        def self.example
          initiate = ProfileComponent::Messages::Events::Initiated.new

          initiate.profile_id = Profile.id
          initiate.name = Profile.name
          initiate.email = Profile.email
          initiate.avatar_url = Profile.avatar_url
          initiate.github_id = Profile.github_id
          initiate.processed_time = Controls::Time::Processed.example

          initiate
        end
      end
    end
  end
end
