# frozen_string_literal: true

require_relative 'concerns/dto_concern'
require_relative 'concerns/service_error_concern'

class ApplicationService
  include ::DtoConcern
  include ::ServiceErrorConcern
end
