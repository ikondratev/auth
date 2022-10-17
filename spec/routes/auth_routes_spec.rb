require "application_helper"

RSpec.describe AuthRoutes, type: :routes do
  describe "GET /ping" do
    it "should return PONG" do
      get "/ping"

      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("PONG")
    end
  end

  describe "POST /v1/login" do
    let(:user_id) { 1 }

    context "missing parameters" do
      it "should return error" do
        post "/v1/login"

        expect(last_response.status).to eq(422)
      end
    end

    context "when invalid parameters" do
      let(:user_params) do
        {
          email: "test@email.com",
          password: nil
        }
      end

      let(:expected_error) do
        [{ "detail"=>"Ошибка в параметре запроса" }]
      end

      it "should return error" do
        post "/v1/login", user_params

        expect(last_response.status).to eq(422)
        expect(response_body["errors"]).to eq(expected_error)
      end
    end

    context "in case of unauthenticated user" do
      let(:user_params) do
        {
          email: "test@email.com",
          password: "123"
        }
      end

      let(:expected_error) do
        [{ "detail"=>"Пользователь не прошел аутентификацию" }]
      end

      it "should return error" do
        post "/v1/login", user_params

        expect(response_body["errors"]).to eq(expected_error)
      end
    end

    context "without any errors" do
      before do
        FactoryBot.create(:user)
        FactoryBot.create(:user_session)
      end

      let(:user_params) do
        {
          email: "test@email.com",
          password: "123"
        }
      end

      let(:user_session) do
        UserSession.last
      end

      it "should return valid result" do
        post "/v1/login", user_params

        expect(last_response.status).to eq(200)
        expect(response_body["meta"]["token"]).not_to be_nil
      end
    end
  end

  describe "POST /v1/signup" do
    context "missing parameters" do
      it "should return error" do
        post "/v1/signup"

        expect(last_response.status).to eq(422)
      end
    end

    context "when invalid parameters" do
      let(:user_params) do
        {
          email: "test@email.com",
          password: "123"
        }
      end

      let(:expected_error) do
        [{ "detail"=>"Ошибка в параметре запроса" }]
      end

      it "should return error" do
        post "/v1/signup", user_params

        expect(last_response.status).to eq(422)
        expect(response_body["errors"]).to eq(expected_error)
      end
    end

    context "without any errors" do
      let(:user_params) do
        {
          name: "user",
          email: "test@email.com",
          password: "123"
        }
      end

      it "should return valid result" do
        post "/v1/signup", user_params

        expect(last_response.status).to eq(201)
      end
    end

  end
end