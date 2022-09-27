require "application_helper"

RSpec.describe Users::CreateService do
  subject { described_class }

  context "without any errors" do
    let(:user_params) do
      {
        name: "User",
        email: "user@user.com",
        password: "123"
      }
    end

    it "creates a new user" do
      expect { subject.call(user_params) }.to change { User.count }.from(0).to(1)
    end
  end

  context "when invalid params" do
    let(:user_params) do
      {
        name: "User",
        email: "",
        password: "123"
      }
    end

    it "does not create user" do
      expect { subject.call(user_params) }
        .not_to change { User.count }
    end
  end
end