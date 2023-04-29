# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AuthorService do
  subject(:author_service) { described_class.new }

  describe '#add_author' do
    it 'should create a new Author' do
      author_dto = Dtos::AuthorDtos::AddAuthorDto.new(first_name: 'Ernest', last_name: 'Hemingway')
      attrs = author_service.add_author(author_dto:)

      expect(attrs.id).to be_a(Integer)
      expect(attrs.first_name).to eql('Ernest')
      expect(attrs.last_name).to eql('Hemingway')
    end
  end
end
