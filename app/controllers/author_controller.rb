# frozen_string_literal: true

class AuthorController < ApplicationController
  def initialize
    @author_service = AuthorService.new

    super
  end

  def add_book
    book = author_service.add_book(author_id: params[:id], book_name: params[:name])
    json_render(data: book, status: :created)
  end

  def books
    books = author_service.find_books_by_author_id(author_id: params[:id])
    json_render(data: books)
  end

  def create
    author = author_service.add_author(author_dto: params.permit(:first_name, :last_name))
    json_render(data: author, status: :created)
  end

  def destroy
    author_service.destroy_author(author_id: params[:id])
    json_render(status: :no_content)
  end

  def get
    author = author_service.find_author_by_id(author_id: params[:id])
    json_render(data: author)
  end

  def index
    authors = author_service.find_all_authors
    json_render(data: authors)
  end

  def update
    author = author_service.update_author(author_id: params[:id], author_dto: params.permit(:first_name, :last_name))
    json_render(data: author)
  end

  private

  attr_reader :author_service
end
