# frozen_string_literal: true

require_relative '../dtos/author_dtos'
require_relative '../dtos/book_dtos'

class AuthorService < ApplicationService
  returns   :find_author_by_id, :update_author, dto: ::Dtos::AuthorDtos::AuthorDto
  returns   :find_all_authors, :find_authors_by_first_name, :find_authors_by_last_name,
            dto: ::Dtos::AuthorDtos::AuthorListDto
  validates :add_author, author_dto: ::Dtos::AuthorDtos::AddAuthorDto, returns: ::Dtos::AuthorDtos::AuthorDto
  validates :add_book, book_dto: ::Dtos::BookDtos::AddBookDto, returns: ::Dtos::BookDtos::BookDto
  validates :update_author, author_dto: ::Dtos::AuthorDtos::UpdateAuthorDto, returns: ::Dtos::AuthorDtos::AuthorDto

  def add_author(author_dto:)
    author = Author.new
    author.first_name = author_dto.first_name
    author.last_name = author_dto.last_name
    author.save
    author.attributes
  end

  def add_book(author_id:, book_dto:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?

    book = Book.new
    book.name = book_dto.name
    book.authors << author
    book.save
    book.attributes
  end

  def destroy_author(author_id:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?

    author.destroy
  end

  def find_all_authors
    Author.all.map(&:attributes)
  end

  def find_author_by_id(author_id:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound if author.nil?

    author.attributes
  end

  def find_authors_by_first_name(first_name:)
    Author.where(first_name:).map(&:attributes)
  end

  def find_authors_by_last_name(last_name:)
    Author.where(last_name:).map(&:attributes)
  end

  def find_books_by_author_id(author_id:)
    author = Author.includes(:books).find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?

    author.books.map(&:attributes)
  end

  def update_author(author_id:, author_dto:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?

    author.first_name = author_dto.first_name
    author.last_name = author_dto.last_name
    author.save
    author.attributes
  end
end
