require 'rails_helper'

RSpec.describe User, type: :model do
  context "User tests" do
    let (:teacher) {build :user, :invalid_teacher}
    it "render" do
    end
  end
end
