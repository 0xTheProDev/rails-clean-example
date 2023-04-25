# frozen_string_literal: true

require_relative 'concerns/dto_concern'

class ApplicationService
  extend ::DtoConcern

  class AuthorNotFound < StandardError; end
  class BookNotFound < StandardError; end
end
