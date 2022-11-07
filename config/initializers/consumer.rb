channel = RabbitMq.consumer_channel
exchange = channel.default_exchange
queue = channel.queue("auth", durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  payload = JSON(payload)
  result = Auth::FetchUserService.call(token: payload["token"])

  body = {}
  body.merge!(state: :success, user_id: result.user.id) if result.success?

  exchange.publish(
    body.to_json,
    routing_key: properties.reply_to,
    correlation_id: properties.correlation_id
  )

  channel.ack(delivery_info.delivery_tag)
end
