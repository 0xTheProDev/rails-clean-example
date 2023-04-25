# frozen_string_literal: true

module ApiErrorConcern
  def on_error(*method_names, exception:, handler:)
    to_prepend = Module.new do
      method_names.each do |method_name|
        define_method method_name do |*args, **kwargs, &block|
          begin
            super(*args, **kwargs, &block)
          rescue exception => e
            Rails.logger.debug(e.inspect)
            self.send(handler, *args, **kwargs, &block)
          end
        end
      end
    end

    prepend to_prepend
  end
end
