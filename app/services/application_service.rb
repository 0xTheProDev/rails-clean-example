# frozen_string_literal: true

require_relative 'concerns/dto_concern'

class ApplicationService
  extend ::DtoConcern

  class AuthorServiceError < StandardError; end
  class AuthorNotDeleted < AuthorServiceError; end
  class AuthorNotFound < AuthorServiceError; end
  class AuthorNotSaved < AuthorServiceError; end

  class BookServiceError < StandardError; end
  class BookNotDeleted < BookServiceError; end
  class BookNotFound < BookServiceError; end
  class BookNotPublished < BookServiceError; end
  class BookNotSaved < BookServiceError; end
  class BookNotUnpublished < BookServiceError; end
end
