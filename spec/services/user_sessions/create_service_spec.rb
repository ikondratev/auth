require "application_helper"

RSpec.describe UserSessions::CreateService do
  subject { described_class }

  before do
    FactoryBot.create(:user)
  end

  describe "#call" do
    context "without any errors" do
      let(:email) { User.last.email }

      let(:user_params) do
        {
          email: email,
          password: "test_password"
        }
      end

      it "should authenticate user" do
        expect { subject.call(user_params) }.to change { UserSession.count }.from(0).to(1)
      end
    end

    context "when invalid params" do
      let(:user_params) do
        {
          email: "",
          password: "123"
        }
      end

      it "shouldn't create user_session" do
        expect { subject.call(user_params) }.not_to change { UserSession.count }
      end
    end
  end
end