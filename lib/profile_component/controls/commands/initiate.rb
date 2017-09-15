module ProfileComponent
  module Controls
    module Commands
      module Initiate
        def self.example
          initiate = ProfileComponent::Messages::Commands::Initiate.new

          initiate.profile_id = Profile.id
          initiate.name = Profile.name
          initiate.email = Profile.email
          initiate.avatar_url = Profile.avatar_url
          initiate.github_id = Profile.github_id
          initiate.time = Controls::Time::Effective.example

          initiate
        end
      end
    end
  end
end
