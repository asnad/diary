require 'rails_helper'

RSpec.describe User, type: :model do
  context "Roles" do
    it "contain rolls" do
      User.user_types.should == {"teacher"=>0, "guardian"=>1, "administrator"=>2}
    end
  end
  
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

  context "Associations" do
    let(:school_batch) {build :school_batch, :invalid_school_batch}
    let(:batch){build :batch, :valid_batch}
    let(:teacher){build :user, :valid_user}
    it "has many school batches" do
      school_batch.batch = batch
      teacher.batches << batch
      teacher.batches.length.should == 1
      teacher.school_batches.length.should == 1
    end

    it "associated with batches" do
      t = User.reflect_on_association(:batches)
      expect(t.macro).to eq(:has_many)
    end

    it "associated with school batches" do
      t = User.reflect_on_association(:school_batches)
      expect(t.macro).to eq(:has_many)
    end
  end
end
