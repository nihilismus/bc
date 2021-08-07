# frozen_string_literal: true

require 'grape'
require_relative 'bc/version'

# Bc module.
module Bc
  # Bc exception.
  class Error < StandardError; end

  # Bc API.
  class API < Grape::API
    version 'v1', using: :header, vendor: 'Bc'

    desc 'Root endpoint.'
    # GET /healthcheck
    get :healthcheck do
      content_type 'text/plain'
      body :ok
    end
  end
end
