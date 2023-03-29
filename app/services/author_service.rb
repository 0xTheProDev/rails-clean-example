# frozen_string_literal: true

class AuthorService < ApplicationService
  def add_author(author_dto:)
    author = Author.new
    author.first_name = authorDto.first_name
    author.last_name = authorDto.last_name
    author.save
  end

  def add_book(author_id:, book_dto:)
    author = Author.find_by_id(authorId)
    raise AuthorNotFound if author.nil?

    book = Book.new
    book.name = book_dto.name
    book.add_author(author)
    book.save
  end

  def destroy_author(author_id:)
    author = Author.find_by_id(author_id)
    raise AuthorNotFound if author.nil?

    author.destroy
  end

  def find_all_authors
    Author.all
  end

  def find_author_by_id(author_id:)
    author = Author.find_by_id(author_id)
    raise AuthorNotFound if author.nil?
    author
  end

  def find_authors_by_first_name(first_name:)
    Author.where(first_name: first_name)
  end

  def find_authors_by_last_name(last_name:)
    Author.where(last_name: last_name)
  end

  def update_author(author_id:, author_dto:)
    author = Author.find_by_id(authorId)
    raise AuthorNotFound if author.nil?

    author.first_name = author_dto.first_name || author.first_name
    author.last_name = author_dto.last_name || author.last_name
    author.save
  end
end
