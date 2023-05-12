# frozen_string_literal: true

RSpec.describe Book do
  it 'has a valid factory' do
    FactoryBot.build(:book).should be_valid
  end

  it 'is invalid without a name' do
    FactoryBot.build(:book, name: nil).should_not be_valid
  end

  describe '#with_author_attrs' do
    it 'includes author information' do
      book = FactoryBot.build(:book)
      expect(book.with_author_attrs).to match(hash_including(:authors))
    end
  end
end
