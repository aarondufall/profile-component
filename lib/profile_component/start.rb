module ProfileComponent
  module Start
    def self.call
      Consumers::Commands.start('profile:command')
      Consumers::Events.start('profile')
    end
  end
end
