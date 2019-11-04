# frozen_string_literal: true

module AcmeV2::Client::Resources::Challenges
  require 'acmev2/client/resources/challenges/base'
  require 'acmev2/client/resources/challenges/http01'
  require 'acmev2/client/resources/challenges/dns01'
  require 'acmev2/client/resources/challenges/unsupported_challenge'

  CHALLENGE_TYPES = {
    'http-01' => AcmeV2::Client::Resources::Challenges::HTTP01,
    'dns-01' => AcmeV2::Client::Resources::Challenges::DNS01
  }

  def self.new(client, type:, **arguments)
    CHALLENGE_TYPES.fetch(type, Unsupported).new(client, **arguments)
  end
end
