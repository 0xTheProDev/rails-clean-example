# frozen_string_literal: true

require_relative '../dtos/book_dtos'

class BookService < ApplicationService
  # returns   :add_author_by_id, :find_book_by_id, :remove_author_by_id, dto: ::Dtos::BookDtos::BookDto
  # returns   :find_all_books, :find_book_by_name, dto: ::Dtos::BookDtos::BookListDto
  validates :add_book, book_dto: ::Dtos::BookDtos::AddBookDto
  validates :update_book, book_dto: ::Dtos::BookDtos::UpdateBookDto, returns: ::Dtos::BookDtos::BookDto

  def add_book(book_dto:)
    book = Book.new
    book.name = book_dto.name
    book.save
    book.attributes
  end

  def add_author_by_id(book_id:, author_id:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?

    book = Book.includes(:authors).find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?

    publication = Publication.new
binding.pry
    publication.author_id = author.id
    publication.book_id   = book.id
    publication.save

    book.reload
    book.attributes
  end

  def destroy_book(book_id:)
    book = Book.find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?

    book.destroy
  end

  def find_all_books
    Book.includes(:authors).all.map(&:attributes)
  end

  def find_book_by_id(book_id:)
    book = Book.includes(:authors).find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?

    book.attributes
  end

  def find_book_by_name(name:)
    Book.includes(:authors).where(name:).map(&:attributes)
  end

  def remove_author_by_id(book_id:, author_id:)
    book = Book.includes(:authors).find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?

    book.authors = book.authors.filter { |author| author.id != author_id.to_i }
    book.save
    book.attributes
  end

  def update_book(book_id:, book_dto:)
    book = Book.find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?

    book.name = book_dto.name
    book.save
    book.attributes
  end
end
