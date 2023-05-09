# frozen_string_literal: true

require_relative '../dtos/book_dtos'

class BookService < ApplicationService
  returns   :add_author_by_id, :find_book_by_id, :remove_author_by_id, :update_book, dto: ::Dtos::BookDtos::BookDto
  returns   :find_all_books, :find_books_by_name, dto: ::Dtos::BookDtos::BookListDto
  validates :add_book, book_dto: ::Dtos::BookDtos::AddBookDto, returns: ::Dtos::BookDtos::BookThinDto
  # validates :update_book, book_dto: ::Dtos::BookDtos::UpdateBookDto, returns: ::Dtos::BookDtos::BookDto

  def add_book(book_dto:)
    book = Book.create(name: book_dto.name)
    raise BookNotSaved unless book.save

    book.attributes
  end

  def add_author_by_id(book_id:, author_id:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?

    book = Book.find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?

    pub = Publication.create(author:, book:)
    raise BookNotPublished, author_id, book_id unless pub.save

    book.with_author_attrs
  end

  def destroy_book(book_id:)
    book = Book.find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?
    raise BookNotDeleted, book_id unless book.destroy
  end

  def find_all_books
    Book.includes(:authors).all.map(&:with_author_attrs)
  end

  def find_book_by_id(book_id:)
    book = Book.includes(:authors).find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?

    book.with_author_attrs
  end

  def find_books_by_name(name:)
    Book.includes(:authors).where(name:).map(&:with_author_attrs)
  end

  def remove_author_by_id(book_id:, author_id:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?

    book = Book.find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?

    pub = Publication.find_by(author_id: author.id, book_id: book.id)
    raise BookNotUnpublished, author_id, book_id unless pub.destroy

    book.with_author_attrs
  end

  def update_book(book_id:, book_dto:)
    book = Book.find_by(id: book_id)
    raise BookNotFound, book_id if book.nil?

    book.name = book_dto.name
    raise BookNotSaved, book_id unless book.save

    book.with_author_attrs
  end
end
