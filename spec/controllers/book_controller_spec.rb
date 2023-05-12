# frozen_string_literal: true

RSpec.describe BookController do
  describe 'POST /:id/authors' do
    let(:author) { create(:author) }
    let(:book) { create(:book) }

    it 'adds Author to a Book' do
      post :add_author, params: { author_id: author.id, id: book.id }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
        data: [{
          id: author.id,
          first_name: author.first_name,
          last_name: author.last_name
        }],
        errors: []
      })
    end
  end

  describe 'GET /:id/authors' do
    let(:authors) { create_list(:author, 2) }
    let(:book) { create(:book, authors:) }

    it 'lists all Authors of a Book' do
      get :authors, params: { id: book.id }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
        data: authors.map { |author| {
          id: author.id,
          first_name: author.first_name,
          last_name: author.last_name
        }},
        errors: []
      })
    end
  end

  describe 'POST /' do
    it 'creates a Book' do
      name = 'The Art of War'

      post :create, params: { name:, }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:created)
      expect(resp).to match({
        data: {
          id: be_a_kind_of(Integer),
          name:
        },
        errors: []
      })
    end
  end

  describe 'DELETE /:id' do
    let(:book) { create(:book) }

    it 'deletes a Book' do
      delete :destroy, params: { id: book.id }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:no_content)
      expect(resp).to eql({
        data: nil,
        errors: []
      })
    end
  end

  describe 'GET /:id' do
    let(:author) { create(:author) }
    let(:book) { create(:book, authors: [author]) }

    it 'fetches a Book' do
      get :get, params: { id: book.id }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
        data: {
          id: book.id,
          name: book.name,
          authors: [{
            id: author.id,
            first_name: author.first_name,
            last_name: author.last_name
          }]
        },
        errors: []
      })
    end
  end

  describe 'GET /' do
    it 'lists all Books' do
      books = create_list(:book, 3)

      get :index
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
        data: books.map { |book| {
          id: book.id,
          name: book.name,
          authors: []
        }},
        errors: []
      })
    end
  end

  describe 'DELETE /:id/authors' do
    let(:authors) { create_list(:author, 2) }
    let(:book) { create(:book, authors:) }

    it 'lists all Authors of a Book' do
      delete :remove_author, params: { author_id: authors[0].id, id: book.id }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
        data: [{
          id: authors[1].id,
          first_name: authors[1].first_name,
          last_name: authors[1].last_name
        }],
        errors: []
      })
    end
  end

  xdescribe 'PUT /:id' do
    let(:book) { create(:book) }

    it 'updates a Book' do
      name = 'War and Peace'

      put :update, params: { id: book.id, name: }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
        data: {
          id: book.id,
          name: name,
        },
        errors: []
      })
    end
  end
end
