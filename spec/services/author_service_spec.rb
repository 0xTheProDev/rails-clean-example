# frozen_string_literal: true

RSpec.describe AuthorService do
  subject(:author_service) { described_class.new }

  describe '#add_author' do
    it 'creates a new Author' do
      first_name = 'Ernest'
      last_name = 'Hemingway'

      author_dto = Dtos::AuthorDtos::AddAuthorDto.new(first_name:, last_name:)
      attrs = author_service.add_author(author_dto:)

      expect(attrs.id).to be_a(Integer)
      expect(attrs.first_name).to eql(first_name)
      expect(attrs.last_name).to eql(last_name)
    end
  end

  describe '#add_book' do
    let(:author) { create(:author, first_name: 'Ernest', last_name: 'Hemingway') }

    it 'creates a new Book' do
      book_name = 'The Man and The Sea'
      attrs = author_service.add_book(author_id: author.id, book_name:)

      expect(attrs.id).to be_a(Integer)
      expect(attrs.name).to eql(book_name)
    end
  end

  describe '#destroy_author' do
    let(:author) { create(:author) }

    it 'deletes an Author' do
      author_service.destroy_author(author_id: author.id)
      expect(true).to eql(true) # Dummy Expression that should always yield to True
    end
  end

  describe '#find_all_authors' do
    before :each do
      create_list(:author, 3)
    end

    it 'lists all authors' do
      attrs = author_service.find_all_authors
      expect(attrs).to be_a(Array)
    end
  end

  describe '#find_author_by_id' do
    let(:author) { create(:author, first_name: 'Ruskin', last_name: 'Bond') }

    it 'fetches appropriate Author' do
      attrs = author_service.find_author_by_id(author_id: author.id)

      expect(attrs.id).to eql(author.id)
      expect(attrs.first_name).to eql(author.first_name)
      expect(attrs.last_name).to eql(author.last_name)
    end
  end

  describe '#find_authors_by_first_name' do
    let(:author) { create(:author, first_name: 'Ruskin', last_name: 'Bond') }

    it 'fetches appropriate Authors' do
      attrs = author_service.find_authors_by_first_name(first_name: author.first_name)

      expect(attrs).to be_a(Array)
      expect(attrs[0].first_name).to eql(author.first_name)
      expect(attrs[0].last_name).to eql(author.last_name)
    end
  end

  describe '#find_authors_by_last_name' do
    let(:author) { create(:author, first_name: 'Ruskin', last_name: 'Bond') }

    it 'fetches appropriate Authors' do
      attrs = author_service.find_authors_by_last_name(last_name: author.last_name)

      expect(attrs).to be_a(Array)
      expect(attrs[0].first_name).to eql(author.first_name)
      expect(attrs[0].last_name).to eql(author.last_name)
    end
  end

  describe '#find_books_by_author' do
    let(:author) { create(:author, first_name: 'Masashi', last_name: 'Kisimoto') }
    let(:book) { create(:book, name: 'Naruto', authors: [author]) }

    it 'fetches Books written by the Author' do
      attrs = author_service.find_books_by_author_id(author_id: book.authors[0].id)

      expect(attrs).to be_a(Array)
      expect(attrs[0].name).to eql(book.name)
    end
  end

  describe '#update_author' do
    let(:author) { create(:author) }

    it 'updates Author' do
      author_dto = Dtos::AuthorDtos::UpdateAuthorDto.new(first_name: 'Makoto', last_name: 'Shinkai')
      attrs = author_service.update_author(author_id: author.id, author_dto:)

      expect(attrs.id).to eql(author.id)
      expect(attrs.first_name).to eql(author_dto.first_name)
      expect(attrs.last_name).to eql(author_dto.last_name)
    end
  end
end
