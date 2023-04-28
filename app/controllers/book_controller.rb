# frozen_string_literal: true

class BookController < ApplicationController
  rescue_from ::ApplicationService::AuthorNotFound, with: :invalid_author_id_error
  rescue_from ::ApplicationService::BookNotFound,   with: :invalid_book_id_error

  def initialize
    @book_service = BookService.new

    super
  end

  def add_author
    book = book_service.add_author_by_id(book_id: params[:id], author_id: params[:author_id])
    json_render(data: book['authors'])
  end

  def authors
    book = book_service.find_book_by_id(book_id: params[:id])
    json_render(data: book['authors'])
  end

  def create
    book = book_service.add_book(book_dto: params.permit(:name))
    json_render(data: book, status: :created)
  end

  def destroy
    book_service.destroy_book(book_id: params[:id])
    json_render(status: :no_content)
  end

  def get
    book = book_service.find_book_by_id(book_id: params[:id])
    json_render(data: book)
  end

  def index
    books = book_service.find_all_books
    json_render(data: books)
  end

  def remove_author
    book = book_service.remove_author_by_id(book_id: params[:id], author_id: params[:author_id])
    json_render(data: book['authors'])
  end

  def update
    book = book_service.update_book(book_id: params[:id], book_dto: params[:body])
    json_render(data: book)
  end

  private

  attr_reader :book_service

  def invalid_author_id_error(author_id)
    json_render(errors: ["Invalid Author Id (#{author_id}) given."], status: :bad_request)
  end

  def invalid_book_id_error(book_id)
    json_render(errors: ["Invalid Book Id (#{book_id}) given."], status: :bad_request)
  end
end
