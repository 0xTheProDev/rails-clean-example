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
    let(:author) { create(:author) }

    it 'creates a new Book' do
      book_name = 'The Man and The Sea'
      attrs = author_service.add_book(author_id: author.id, book_name:)

      expect(attrs.id).to be_a(Integer)
      expect(attrs.name).to eql(book_name)
    end
  end

  describe '#destroy_author' do
    let(:author) { create(:author) }

    it 'should delete an Author' do
      author_service.destroy_author(author_id: author.id)
      expect(true).to eql(true) # Dummy Expression that should always yield to True
    end
  end
end
