Application.configure do |app|
  logger = Ougai::Logger.new(
    app.root.concat("/", Settings.log.path),
    level: Settings.log.level
  )

  logger.before_log = lambda do |data|
    data[:service] = { name: Settings.app.name }
    data[:request_id] ||= Thread.current[:request_id]
  end

  app.set :logger, logger
end

Sequel::Model.db.loggers.push(Application.logger)