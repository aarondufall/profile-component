module ProfileComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :profile

    # TODO Implement event projection blocks
    # eg:
    # apply SomethingHappened do |something_happened|
    #   SetAttributes.(profile, something_happened, copy: [
    #     { :profile_id => :id }
    #   ])

    #   something_happened_time = Clock.parse(something_happened.time)

    #   profile.something_happened_time = something_happened_time
    # end
  end
end
