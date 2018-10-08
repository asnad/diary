require 'rails_helper'

RSpec.describe Batch, type: :model do
  context "statuses" do
    it "contain rolls" do
      Batch.statuses.should == {"active"=>0, "completed"=>1, "pending"=>2}
    end
  end
  context "invalid batch" do
    let (:invalid_batch){build :batch, :invalid_batch}
    it "invalid" do
      invalid_batch.should_not be_valid
    end
    
    it "contails validation errors" do
      invalid_batch.should_not be_valid
      invalid_batch.errors.full_messages.should == ["Standard can't be blank", "Start date can't be blank", "End date can't be blank"]
    end
  
  end

  context "valid batch" do
    let(:valid_batch){build :batch, :valid_batch}
    
    it "a valid batch" do
      valid_batch.should be_valid
    end

    it "has many school batches" do
      t = Batch.reflect_on_association(:school_batches)
      expect(t.macro).to eq(:has_many)
    end

    it "default status" do
      valid_batch.status.should == 'active'
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

    it "associated with school batches" do
      t = Batch.reflect_on_association(:school_batches)
      expect(t.macro).to eq(:has_many)
    end
  end
end
