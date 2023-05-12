# frozen_string_literal: true

class AuthorService < ApplicationService
  returns   :add_book, dto: ::BookDtos::BookThinDto
  returns   :find_author_by_id, :update_author, dto: ::AuthorDtos::AuthorDto
  returns   :find_all_authors, :find_authors_by_first_name, :find_authors_by_last_name,
            dto: ::AuthorDtos::AuthorListDto
  returns   :find_books_by_author_id, dto: ::BookDtos::BookThinListDto
  validates :add_author, author_dto: ::AuthorDtos::AddAuthorDto, returns: ::AuthorDtos::AuthorDto
  # validates :update_author, author_dto: ::AuthorDtos::UpdateAuthorDto, returns: ::AuthorDtos::AuthorDto

  def add_author(author_dto:)
    author = Author.create(first_name: author_dto.first_name, last_name: author_dto.last_name)
    raise AuthorNotSaved unless author.save

    author.attributes
  end

  def add_book(author_id:, book_name:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?

    book = Book.create(name: book_name)
    book.authors << author
    raise BookNotSaved, name unless book.save

    book.attributes
  end

  def destroy_author(author_id:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?
    raise AuthorNotDeleted unless author.destroy
  end

  def find_all_authors
    Author.all.map(&:attributes)
  end

  def find_author_by_id(author_id:)
    author = Author.find_by(id: author_id)
    raise AuthorNotFound, author_id if author.nil?

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
    raise AuthorNotSaved, author_id unless author.save

    author.attributes
  end
end
