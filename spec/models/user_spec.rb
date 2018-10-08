require 'rails_helper'

RSpec.describe User, type: :model do
  context "Invalid users and default values" do
    let (:user) {build :user, :invalid_user}
    it "it should not be valid" do
      expect(user).to be_invalid
    end

    it "should contain errors" do
      user.should_not be_valid
      user.errors.full_messages.should == ["Email can't be blank", "Password can't be blank", "First name can't be blank", "Last name can't be blank"]
    end

    it "default teacher user type" do
      user.user_type.should == "teacher"
    end
  end

  context "Valid user" do
    let(:user) {build :user, :valid_user}

    it "is a valid user" do
      user.should be_valid
    end

    it "should be active" do
      user.active_for_authentication?.should == true
    end

    it "disabled user" do
      user.disabled!
      user.active_for_authentication?.should == false
    end
  end
end
