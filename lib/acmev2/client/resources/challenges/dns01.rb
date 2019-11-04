# frozen_string_literal: true

class AcmeV2::Client::Resources::Challenges::DNS01 < AcmeV2::Client::Resources::Challenges::Base
  CHALLENGE_TYPE = 'dns-01'.freeze
  RECORD_NAME = '_acme-challenge'.freeze
  RECORD_TYPE = 'TXT'.freeze
  DIGEST = OpenSSL::Digest::SHA256

  def record_name
    RECORD_NAME
  end

  def record_type
    RECORD_TYPE
  end

  def record_content
    AcmeV2::Client::Util.urlsafe_base64(DIGEST.digest(key_authorization))
  end
end
