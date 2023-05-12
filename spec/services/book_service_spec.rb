# frozen_string_literal: true

RSpec.describe BookService do
  subject(:book_service) { described_class.new }

  describe '#add_book' do
    it 'creates a new Book' do
      book_name = 'The Man and The Sea'
      book_dto = BookDtos::AddBookDto.new(name: book_name)
      attrs = book_service.add_book(book_dto:)

      expect(attrs.id).to be_a(Integer)
      expect(attrs.name).to eql(book_name)
    end
  end

  describe '#add_author_by_id' do
    let(:author) { create(:author) }
    let(:book) { create(:book) }

    it 'adds author to a book' do
      author_id = author.id
      book_id = book.id
      attrs = book_service.add_author_by_id(author_id:, book_id:)

      expect(attrs.id).to eql(book_id)
      expect(attrs.authors.map(&:id)).to include(author_id)
    end
  end

  describe '#destroy_book' do
    let(:book) { create(:book) }

    it 'deletes a Book' do
      attrs = book_service.destroy_book(book_id: book.id)
      expect(attrs).to be(nil)
    end
  end

  describe '#find_all_books' do
    before do
      create_list(:book, 3)
    end

    it 'lists all books' do
      attrs = book_service.find_all_books
      expect(attrs).to be_a(Array)
    end
  end

  describe '#find_book_by_id' do
    let(:book) { create(:book, name: 'The Song of Ice and Fire') }

    it 'fetches appropriate Book' do
      attrs = book_service.find_book_by_id(book_id: book.id)

      expect(attrs.id).to eql(book.id)
      expect(attrs.name).to eql(book.name)
    end
  end

  describe '#find_books_by_name' do
    let(:book) { create(:book, name: 'The Song of Ice and Fire') }

    it 'fetches appropriate Books' do
      name = book.name
      attrs = book_service.find_books_by_name(name:)

      expect(attrs).to be_a(Array)
      expect(attrs[0].name).to eql(name)
    end
  end

  describe '#remove_author_by_id' do
    let(:author) { create(:author) }
    let(:book) { create(:book, name: 'The Song of Ice and Fire') }

    before do
      book.authors << author
      book.save
    end

    it 'removes Author from the list' do
      author_id = author.id
      book_id = book.id
      attrs = book_service.remove_author_by_id(book_id:, author_id:)

      expect(attrs.name).to eql(book.name)
      expect(attrs.authors.map(&:id)).not_to include(author_id)
    end
  end

  describe '#update_book' do
    let(:book) { create(:book, name: 'Game of Thrones') }

    it 'updates Book' do
      book_id = book.id
      book_dto = BookDtos::UpdateBookDto.new(name: 'The Song of Ice and Fire')
      attrs = book_service.update_book(book_id:, book_dto:)

      expect(attrs.id).to eql(book_id)
      expect(attrs.name).to eql(book_dto.name)
    end
  end
end
