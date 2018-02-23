module ProfileComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :profile

    apply Initiated do |initiated|
      SetAttributes.(profile, initiated, copy: [
        { :profile_id => :id },
        :name,
        :email,
        :avatar_url
      ])

      initiated_time = Clock.parse(initiated.time)

      profile.initiated_time = initiated_time
    end
  end
end

