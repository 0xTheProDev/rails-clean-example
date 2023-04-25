# frozen_string_literal: true

class BookService < ApplicationService
  def add_book(book_dto:)
    book = Book.new
    book.name = book_dto.name
    book.save
  end

  def add_author_by_id(book_id:, author_id:)
    author = Author.find_by_id(author_id)
    raise AuthorNotFound if author.nil?

    book = Book.find_by_id(book_id)
    raise BookNotFound if book.nil?

    book.authors << author
    book.save
    book
  end

  def destry_book(book_id:)
    book = Book.find_by_id(book_id)
    raise BookNotFound if book.nil?

    book.destroy
  end

  def find_all_books
    Book.all
  end

  def find_book_by_id(book_id:)
    book = Book.find_by_id(book_id)
    raise BookNotFound if book.nil?
    book
  end

  def find_by_name(name:)
    Book.where(name: name)
  end

  def remove_author_by_id(book_id:, author_id:)
    book = Book.find_by_id(book_id)
    raise BookNotFound if book.nil?

    book.authors = book.authors.filter { |author| author.id != author_id.to_i }
    book.save
    book
  end

  def update_book(book_id:, book_dto:)
    book = Book.find_by_id(book_id)
    raise BookNotFound if book.nil?

    book.name = book_dto.name
    book.save
    book
  end
end
