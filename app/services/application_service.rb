# frozen_string_literal: true

require_relative 'concerns/dto_concern'

class ApplicationService
  extend ::DtoConcern
  extend ::ServiceErrorConcern
end
