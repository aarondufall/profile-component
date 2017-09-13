module ProfileComponent
  module Controls
    module Profile
      def self.example
        profile = ProfileComponent::Profile.build

        profile.id = self.id
        profile.something_happened_time = Time::Effective::Raw.example

        profile
      end

      def self.id
        ID.example(increment: id_increment)
      end

      def self.id_increment
        1111
      end

      module New
        def self.example
          ProfileComponent::Profile.build
        end
      end

      module Identified
        def self.example
          profile = New.example
          profile.id = Profile.id
          profile
        end
      end
    end
  end
end
