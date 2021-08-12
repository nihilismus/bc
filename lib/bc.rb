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
    get :healthcheck do
      content_type 'text/plain'
      body :ok
    end

    get 'metadata/:id' do
      file = "resources/#{params[:id]}.json"
      if File.exist? file
        lines = File.readlines file
        content_type 'application/json'
        JSON.parse lines.join
      end
    end

    get 'duration/:id' do
      file = "resources/#{params[:id]}.json"
      if File.exist? file
        lines = File.readlines file
        hash = JSON.parse lines.join
        atoms = hash['atoms']
        atoms.map { |obj| obj['duration'] }.sum
      end
    end

    get 'manifest/:id/2s.m3u8' do
      file = "resources/#{params[:id]}.json"
      if File.exist? file
        lines = File.readlines file
        hash = JSON.parse lines.join
        atoms = hash['atoms']
        str = <<~MANIFEST
          #EXTM3U
          #EXT-X-VERSION:3
          #EXT-X-PLAYLIST-TYPE:VOD
          #EXT-X-MEDIA-SEQUENCE:1
          #EXT-X-TARGETDURATION:2
        MANIFEST

        i = 1
        atoms.each do |obj|
          duration = obj['duration'].to_i / 1000.0
          str += "#EXTINF:#{duration},\n"
          str += "http://example.com/simple/2s/#{i}.ts\n"
          i = i.next
        end

        str += '#EXT-X-ENDLIST'
        content_type 'application/x-mpegURL'
        str
      end
    end
  end
end
