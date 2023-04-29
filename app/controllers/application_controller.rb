# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ::ApplicationService::AuthorNotFound, with: :invalid_author_id_error
  rescue_from ::ApplicationService::BookNotFound,   with: :invalid_book_id_error

  def json_render(data: nil, errors: [], status: :ok)
    render json: { data:, errors: }, status:
  end

  def method_missing
    json_render(errors: ['Invalid action'], status: :bad_request)
  end

  private

  def invalid_author_id_error(author_id)
    json_render(errors: ["Invalid Author Id (#{author_id}) given."], status: :bad_request)
  end

  def invalid_book_id_error(book_id)
    json_render(errors: ["Invalid Book Id (#{book_id}) given."], status: :bad_request)
  end
end
