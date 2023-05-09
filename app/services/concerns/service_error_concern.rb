# frozen_string_literal: true

module ServiceErrorConcern
  class ServiceError < StandardError; end

  class AuthorServiceError < ServiceError; end
  class AuthorNotDeleted < AuthorServiceError; end
  class AuthorNotFound < AuthorServiceError; end
  class AuthorNotSaved < AuthorServiceError; end

  class BookServiceError < ServiceError; end
  class BookNotDeleted < BookServiceError; end
  class BookNotFound < BookServiceError; end
  class BookNotPublished < BookServiceError; end
  class BookNotSaved < BookServiceError; end
  class BookNotUnpublished < BookServiceError; end
end
