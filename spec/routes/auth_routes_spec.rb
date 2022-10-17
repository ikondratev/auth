require "application_helper"

describe AuthRoutes, type: :routes do
  describe "POST /v1/" do
    context "without auth token" do
      let(:expected_error) do
        [{ "detail"=>"Пользователь не авторизован" }]
      end

      it "should return error" do
        post "/v1/"

        expect(last_response.status).to eq(403)
        expect(response_body["errors"]).to eq(expected_error)
      end
    end

    context "in case of wrong auth token" do
      let(:expected_error) do
        [{ "detail"=>"Пользователь не авторизован" }]
      end

      it "should return error" do
        header "Authorization", "token"
        post "/v1/"

        expect(last_response.status).to eq(403)
        expect(response_body["errors"]).to eq(expected_error)
      end
    end

    context "without any errors" do
      before do
        FactoryBot.create(:user)
      end

      it "should return valid" do
        header "Authorization", auth_token(User.last)
        post "/v1/"

        expect(last_response.status).to eq(200)
        expect(response_body["meta"]["user_id"]).to be(User.last.id)
      end
    end
  end
end
