require 'spec_helper'

describe AcmeV2::Client::ChainIdentifier do
  let(:pem) { open('./spec/fixtures/certificate_chain.pem').read }
  let(:issuer_name) { 'Pebble Root CA' }

  subject { AcmeV2::Client::ChainIdentifier.new(pem) }
  it 'matches certificate by name' do
    expect(subject).to be_a_match_name(issuer_name)
  end

  it 'fail non matching certificate name' do
    expect(subject).not_to be_a_match_name('foo')
  end
end
