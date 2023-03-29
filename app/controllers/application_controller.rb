# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def json_render(data: nil, errors: [], status: :ok)
    render json: { data: data, errors: errors }, status: status
  end
end
