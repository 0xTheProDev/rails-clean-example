# frozen_string_literal: true

RSpec.describe AuthorController do
  describe 'POST /:id/books' do
    let(:author) { create(:author, first_name: 'Leo', last_name: 'Tolstoy') }

    it 'creates a Book for an Author' do
      book_name = 'War and Peace'

      post :add_book, params: { id: author.id, name: book_name }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:created)
      expect(resp).to match({
                              data: {
                                id: be_a_kind_of(Integer),
                                name: book_name
                              },
                              errors: []
                            })
    end
  end

  describe 'GET /:id/books' do
    let(:author) { create(:author) }
    let(:books) { create_list(:book, 3) }

    it 'lists all Books by an Author' do
      books.map { |book| book.authors << author }

      get :books, params: { id: author.id }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
                            data: books.map { |book| { id: book.id, name: book.name } },
                            errors: []
                          })
    end
  end

  describe 'POST /' do
    it 'creates an Author' do
      first_name = 'Martin'
      last_name = 'Fowler'

      post :create, params: { first_name:, last_name: }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:created)
      expect(resp).to match({
                              data: {
                                id: be_a_kind_of(Integer),
                                first_name:,
                                last_name:
                              },
                              errors: []
                            })
    end
  end

  describe 'DELETE /:id' do
    let(:author) { create(:author) }

    it 'deletes an Author' do
      delete :destroy, params: { id: author.id }
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

    it 'fetches an Author' do
      get :get, params: { id: author.id }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
                            data: {
                              id: author.id,
                              first_name: author.first_name,
                              last_name: author.last_name
                            },
                            errors: []
                          })
    end
  end

  describe 'GET /' do
    it 'lists all Authors' do
      authors = create_list(:author, 3)

      get :index
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
                            data: authors.map do |author|
                                    {
                                      id: author.id,
                                      first_name: author.first_name,
                                      last_name: author.last_name
                                    }
                                  end,
                            errors: []
                          })
    end
  end

  xdescribe 'PUT /:id' do
    let(:author) { create(:author) }

    it 'updates an Author' do
      first_name = 'Leo'
      last_name = 'Tolstoy'

      put :update, params: { id: author.id, first_name:, last_name: }
      resp = JSON.parse(response.body).deep_symbolize_keys!

      expect(response).to have_http_status(:ok)
      expect(resp).to eql({
                            data: {
                              id: author.id,
                              first_name:,
                              last_name:
                            },
                            errors: []
                          })
    end
  end
end
