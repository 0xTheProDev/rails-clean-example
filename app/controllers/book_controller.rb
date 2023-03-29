# frozen_string_literal: true

class BookController < ApplicationController
  def initialize
    @book_service = BookService.new

    super
  end

  def create
    book = book_service.add_book(book_dto: params)
    json_render(data: book)
  end

  def destroy
    book_service.destroy_book(book_id: params[:id])
    json_render
  end

  def get
    book = book_service.find_book_by_id(book_id: params[:id])
    json_render(data: book)
  end

  def index
    books = book_service.find_all_books
    json_render(data: books)
  end

  def update
    book = book_service.update_book(params[:id], params[:body])
    json_render(data: book)
  end

  private

  attr_reader :book_service

  def invalid_book_id_error
    json_render(errors: ['Invalid Book Id given.'], status: :bad_request)
  end
end
