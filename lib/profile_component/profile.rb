module ProfileComponent
  class Profile
    include Schema::DataStructure

    attribute :id, String
    attribute :name, String
    attribute :email, String
    attribute :avatar_url, String
    attribute :initiated_time, Time
    
    def initiated?
      !initiated_time.nil?
    end
  end
end
