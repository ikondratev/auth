module System
  module Kernel
    # @param [String] message
    # @param [Hash] opts
    def l(message, **opts)
      Application.logger.info(message, opts)
    end

    # @param [Sting] message
    # @param [Array<Hash>] errors
    def le(message, *errors)
      Application.logger.error(message, error_messages: errors)
    end
  end
end
