# Class to handle bug #
class AcmeV2::Client::CertificateRequest::ECKeyPatch < OpenSSL::PKey::EC
  alias private? private_key?
  alias public? public_key?
end
