module AdsService
  module RpcApi
    def publish_user_id(user_id:)
      payload = { user_id: user_id }.to_json
      publish(payload, type: "authenticate_user")
    end
  end
end