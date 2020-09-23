require 'puppet/util/network_device/panos/device'

RSpec.describe Puppet::Util::NetworkDevice::Panos::Device do
  let(:connection_info) { { host: 'www.example.com', user: 'foo', password: 'password' } }

  it 'initialises correctly' do
    expect(described_class.new(connection_info).transport).to be_instance_of(Puppet::Transport::Panos)
  end
end
