require_relative '../automated_init'

context "Profile" do
  context "Has Initiated Time" do
    profile = Controls::Profile::Initiated.example

    test "Is initiated" do
      assert(profile.initiated?)
    end
  end

  context "Does not Have Initated Time" do
    profile = Controls::Profile::New.example

    test "Is not initiated" do
      refute(profile.initiated?)
    end
  end
end
