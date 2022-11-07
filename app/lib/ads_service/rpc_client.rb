require_relative "rpc_api"

module AdsService
  class RpcClient
    extend Dry::Initializer[undefined: false]
    include RpcApi

    option :queue, default: proc { create_queue }
    option :reply_queue, default: proc { create_reply_queue }
    option :lock, default: proc { Mutex.new }
    option :condition, default: proc { ConditionVariable.new }

    ADS_QUEUE_CHANNEL = "ads".freeze
    REPLY_TO_QUEUE_CHANNEL = "ads_reply".freeze

    def self.fetch
      Thread.current["ads_service.rpc_client"] ||= new.start
    end

    def start
      @reply_queue.subscribe do |_info, properties, _payload|
        if properties.correlation_id == @correlation_id
          @lock.synchronize { @condition.signal }
        end
      end

      self
    end

    private

    attr_writer :correlation_id

    def create_queue
      RabbitMq.channel.queue(ADS_QUEUE_CHANNEL, durable: true)
    end

    def create_reply_queue
      RabbitMq.channel.queue(REPLY_TO_QUEUE_CHANNEL)
    end

    def publish(payload, **opts)
      @lock.synchronize do
        self.correlation_id = SecureRandom.uuid

        @queue.publish(
          payload,
          opts.merge(
            app_id: "auth",
            correlation_id: @correlation_id,
            reply_to: @reply_queue.name
          )
        )

        @condition.wait(@lock)
      end
    end
  end
end