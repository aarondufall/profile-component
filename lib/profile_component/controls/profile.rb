module ProfileComponent
  module Controls
    module Profile
      def self.example
        profile = ProfileComponent::Profile.build

        profile.id = self.id
        profile.name = name
        profile.email = email
        profile.avatar_url = avatar_url
        profile.initiated_time = Time::Effective::Raw.example

        profile
      end

      def self.id
        ID.example(increment: id_increment)
      end

      def self.name
        'some name'
      end

      def self.email
        'email@some_domain.com'
      end

      def self.avatar_url
        'http://some_domain.com/images/some_avatar.jpg'
      end

      def self.id_increment
        1111
      end

      module New
        def self.example
          ProfileComponent::Profile.build
        end
      end

      module Initiated
        def self.example
          Profile.example
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
