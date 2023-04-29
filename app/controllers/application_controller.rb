# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ::ApplicationService::AuthorNotDeleted, with: :failed_to_delete_author
  rescue_from ::ApplicationService::AuthorNotFound,   with: :invalid_author_id_error
  rescue_from ::ApplicationService::AuthorNotSaved,   with: :failed_to_save_author

  rescue_from ::ApplicationService::BookNotDeleted,       with: :failed_to_delete_book
  rescue_from ::ApplicationService::BookNotFound,         with: :invalid_book_id_error
  rescue_from ::ApplicationService::BookNotPublished,     with: :failed_to_publish_book
  rescue_from ::ApplicationService::BookNotSaved,         with: :failed_to_save_book
  rescue_from ::ApplicationService::BookNotUnpublished,   with: :failed_to_unpublish_book

  def json_render(data: nil, errors: [], status: :ok)
    render json: { data:, errors: }, status:
  end

  def method_missing
    json_render(errors: ['Invalid action'], status: :method_not_allowed)
  end

  private

  def failed_to_delete_author(author_id)
    json_render(errors: ["Failed to Delete Author (Id: #{author_id})."], status: :internal_server_error)
  end

  def failed_to_delete_book(book_id)
    json_render(errors: ["Failed to Delete Book (Id: #{book_id})."], status: :internal_server_error)
  end

  def failed_to_publish_book(author_id, book_id)
    json_render(errors: ["Failed to Publish Book (Id: #{book_id}) for Author (Id: #{author_id})."], status: :internal_server_error)
  end

  def failed_to_save_author(author_id)
    err_str = author_id ? " (Id: #{author_id})" : ''
    json_render(errors: ["Failed to Save Author#{err_str}."], status: :internal_server_error)
  end

  def failed_to_save_book(book_id = nil)
    err_str = book_id ? " (Id: #{book_id})" : ''
    json_render(errors: ["Failed to Save Book#{err_str}."], status: :internal_server_error)
  end

  def failed_to_unpublish_book(author_id, book_id)
    json_render(errors: ["Failed to Unpublish Book (Id: #{book_id}) for Author (Id: #{author_id})."], status: :internal_server_error)
  end

  def invalid_author_id_error(author_id)
    json_render(errors: ["Invalid Author Id (#{author_id}) given."], status: :bad_request)
  end

  def invalid_book_id_error(book_id)
    json_render(errors: ["Invalid Book Id (#{book_id}) given."], status: :bad_request)
  end
end
