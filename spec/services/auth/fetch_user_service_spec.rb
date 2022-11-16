require "application_helper"

describe Auth::FetchUserService do
  subject { described_class }

  let(:uuid) { "test.uuid" }

  let(:session) do
    create(:user_session)
  end

  describe "#call" do
    context "without any errors" do
      before do
        allow(UserSession).to receive(:find).and_return(session)
      end

      it "should return valid result" do
        result = subject.call(token: uuid)
        expect(result.success?).to be_truthy
      end
    end

    context "without any errors" do
      before do
        allow(UserSession).to receive(:find).and_return(nil)
      end

      it "should return valid result" do
        result = subject.call(token: uuid)
        expect(result.success?).not_to be_truthy
      end
    end
  end
end
