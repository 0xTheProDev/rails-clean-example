# frozen_string_literal: true

# Type Definitions across the Application
module Types
  include Dry.Types

  # Common Interface for all Struct Definitions
  class Struct < Dry::Struct
    transform_keys(&:to_sym)
  end
end
