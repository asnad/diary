require 'rails_helper'

RSpec.describe Batch, type: :model do
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
end
