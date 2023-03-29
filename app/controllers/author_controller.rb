# frozen_string_literal: true

class AuthorController < ApplicationController
  def initialize
    @author_service = AuthorService.new

    super
  end

  def create
    author = author_service.add_author(author_dto: params)
    json_render(data: author)
  end

  def destroy
    author_service.destroy_author(author_id: params[:id])
    json_render
  end

  def get
    author = author_service.find_author_by_id(author_id: params[:id])

    return invalid_author_id_error if author.nil?
    json_render(data: author)
  end

  def index
    authors = author_service.find_all_authors
    json_render(data: authors)
  end

  def update
    author = author_service.update_author(params[:id], params[:body])
    json_render(data: author)
  end

  private

  attr_reader :author_service

  def invalid_author_id_error
    json_render(errors: ['Invalid Author Id given.'], status: :bad_request)
  end
end
