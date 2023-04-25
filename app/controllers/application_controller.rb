# frozen_string_literal: true

class ApplicationController < ActionController::Base
  extend ApiErrorConcern

  def json_render(data: nil, errors: [], status: :ok)
    render json: { data: data, errors: errors }, status: status
  end

  def method_missing
    json_render(errors: ['Invalid action'], status: :bad_request)
  end
end
