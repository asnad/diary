require 'rails_helper'

RSpec.describe SchoolBatch, type: :model do
  context "invalid school batch" do
    let(:invalid_school_batch){build :school_batch, :invalid_school_batch}
    it "invalid" do
      invalid_school_batch.should_not be_valid
    end

    it "validation errors" do
      invalid_school_batch.should_not be_valid
      invalid_school_batch.errors.full_messages.should == ["Batch must exist", "Batchable must exist"]
    end

    it "default status" do
      invalid_school_batch.status.should == 'active'
    end
    
    it "it belongs to batch" do
      t = SchoolBatch.reflect_on_association(:batch)
      expect(t.macro).to eq(:belongs_to)
    end

    it "it belongs to batchable" do
      t = SchoolBatch.reflect_on_association(:batchable)
      expect(t.macro).to eq(:belongs_to)
    end
  end

  context "valid school batch" do
    let(:school_batch) {build :school_batch, :invalid_school_batch}
    let(:batch){build :batch, :valid_batch}
    let(:teacher){build :user, :valid_user}
    it "belongs to user and batch" do
      school_batch.batchable = teacher
      school_batch.batch = batch
      school_batch.should be_valid
    end
  end
end
