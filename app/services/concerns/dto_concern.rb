# frozen_string_literal: true

module DtoConcern
  class DtoConcernError < StandardError; end
  class DtoValidationError < DtoConcernError; end

  def self.included(base)
    base.extend DtoConcernMethods
  end

  module DtoConcernMethods
    def validates(method_name, returns: nil, **dto_map)
      to_prepend = Module.new do
        define_method method_name do |*args, **kwargs, &block|
          kwargs_validated = kwargs.map do |kwarg, kwval|
            return [kwarg, kwval] unless dto_map.include?(kwarg)

            begin
              [kwarg, dto_map[kwarg][kwval]]
            rescue StandardError => e
              Rails.logger.debug(e.inspect)
              raise DtoValidationError, "#{method_name} has been called with invalid argument #{kwarg}"
            end
          end.to_h

          return_value = super(*args, **kwargs_validated, &block)
          return_value unless returns

          begin
            returns[return_value]
          rescue StandardError => e
            Rails.logger.debug(e.inspect)
            raise DtoValidationError, "#{method_name} has returned invalid value"
          end
        end
      end

      prepend to_prepend
    end

    def returns(*method_names, dto:)
      to_prepend = Module.new do
        method_names.each do |method_name|
          define_method method_name do |*args, **kwargs, &block|
            return_value = super(*args, **kwargs, &block)
            begin
              dto[return_value]
            rescue StandardError => e
              Rails.logger.debug(e.inspect)
              raise DtoValidationError, "#{method_name} has returned invalid value"
            end
          end
        end
      end

      prepend to_prepend
    end
  end
end
