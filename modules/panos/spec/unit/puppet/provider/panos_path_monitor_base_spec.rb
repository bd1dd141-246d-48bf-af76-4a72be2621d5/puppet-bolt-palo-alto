require 'spec_helper'
require 'support/matchers/have_xml'
require 'puppet/provider/panos_path_monitor_base'
require 'support/shared_examples'
RSpec.describe Puppet::Provider::PanosPathMonitorBase do
  let(:context) { instance_double('Puppet::ResourceApi::BaseContext', 'context') }
  let(:transport) { instance_double('Puppet::ResourceApi::Transport::Panos', 'transport') }
  let(:typedef) { instance_double('Puppet::ResourceApi::TypeDefinition', 'typedef') }
  let(:provider) { described_class.new('ip') }

  before(:each) do
    allow(context).to receive(:transport).with(no_args).and_return(transport)
    allow(context).to receive(:type).with(no_args).and_return(typedef)
    allow(typedef).to receive(:ensurable?).and_return(true)
  end

  describe '#initialize(version_label)' do
    let(:instance) {  described_class.new(label) }

    context 'store the version label' do
      let(:label) { 'some_version' }

      it { expect(instance.instance_variable_get('@version_label')).to eq label }
    end
  end

  describe '#munge(entry)' do
    context 'when the path monitor is configured with an `enable` option' do
      let(:entry) do
        {
          route:  'example vr/test route',
          enable: 'yes',
        }
      end

      it { expect(provider.munge(entry)[:enable]).to be_truthy }
    end
  end

  describe '#xml_from_should(name, should)' do
    test_data = [
      {
        desc: 'a full example',
        name: {
          path:   'path monitor',
          route:  'example vr/test route 1',
        },
        attrs: {
          route:        'example vr/test route 1',
          path:         'path monitor',
          source:       'source',
          destination:  'destination',
          interval:     '5',
          count:        '4',
          enable:       true,
        },
        xml: '<entry name="path monitor">
                <source>source</source>
                <destination>destination</destination>
                <interval>5</interval>
                <count>4</count>
                <enable>yes</enable>
              </entry>',
      },
      {
        desc: 'essentials example',
        name: {
          path:   'path monitor',
          route:  'example vr/test route 1',
        },
        attrs: {
          route:        'example vr/test route 1',
          path:         'path monitor',
          source:       'source',
          interval:     '5',
          count:        '10',
          destination:  'destination',
        },
        xml: '<entry name="path monitor">
                <source>source</source>
                <destination>destination</destination>
                <interval>5</interval>
                <count>10</count>
              </entry>',
      },
    ]

    include_examples 'xml_from_should(name, should)', test_data, described_class.new('ip')
  end

  describe '#get(context)' do
    let(:example_data) do
      REXML::Document.new <<EOF
        <response>
          <result>
            #{expected_xml}
          </result>
        </response>
EOF
    end

    let(:resource_data) do
      [
        {
          route:        'example vr/test route 1',
          path:         'path monitor',
          source:       'source',
          destination:  'destination',
          interval:     '5',
          count:        '4',
          enable:       true,
          title:        'example vr/test route 1/path monitor',
          ensure:       'present',
        },
      ]
    end

    let(:expected_xml) do
      String.new <<EOF
        <entry name="example vr">
          <routing-table>
            <#{ip_version}>
              <static-route>
                <entry name="test route 1">
                  <path-monitor>
                    <monitor-destinations>
                      <entry name="path monitor">
                        <source>source</source>
                        <destination>destination</destination>
                        <interval>5</interval>
                        <count>4</count>
                        <enable>yes</enable>
                      </entry>
                    </monitor-destinations>
                  </path-monitor>
                </entry>
              </static-route>
            </#{ip_version}>
          </routing-table>
        </entry>
EOF
    end

    before(:each) do
      allow(typedef).to receive(:definition).and_return(base_xpath: 'some_xpath')
    end

    it 'allows transport api error to bubble up' do
      allow(transport).to receive(:get_config).with('some_xpath/entry').and_raise(Puppet::ResourceError, 'Some Error Message')

      expect { provider.get(context) }.to raise_error Puppet::ResourceError
    end

    context 'ipv4 provider' do
      let(:ip_version) { 'ip' }
      let(:provider) { described_class.new(ip_version) }

      it 'processes resources' do
        allow(transport).to receive(:get_config).with('some_xpath/entry').and_return(example_data)
        allow(typedef).to receive(:attributes).and_return(Puppet::Type.type(:panos_path_monitor).type_definition.attributes)

        expect(provider.get(context)).to eq resource_data
      end
    end
    context 'ipv6 provider' do
      let(:ip_version) { 'ipv6' }
      let(:attrs) {}
      let(:provider) { described_class.new(ip_version) }

      it 'processes resources' do
        allow(transport).to receive(:get_config).with('some_xpath/entry').and_return(example_data)
        allow(typedef).to receive(:attributes).with(no_args).and_return(Puppet::Type.type(:panos_path_monitor).type_definition.attributes)

        expect(provider.get(context)).to eq resource_data
      end
    end
  end

  describe '#create(context, name, should)' do
    context 'when called' do
      let(:expected_path) do
        '/config/devices/entry/network/virtual-router/entry[@name=\'foo\']/routing-table/ip/static-route/entry[@name=\'bar\']/path-monitor/monitor-destinations'
      end
      let(:namevars) do
        {
          title:  'foo/bar/path',
          route:  'foo/bar',
          path:   'path',
        }
      end
      let(:mystruct) { {} }

      it 'will call set_config' do
        expect(typedef).to receive(:definition).and_return(mystruct).twice
        expect(provider).to receive(:xml_from_should).with(namevars, anything)
        expect(transport).to receive(:set_config).with(expected_path, anything)
        provider.create(context, namevars, anything)
      end
    end
  end

  describe '#update(context, name, should)' do
    context 'when called' do
      let(:expected_path) do
        '/config/devices/entry/network/virtual-router/entry[@name=\'foo\']/routing-table/ip/static-route/entry[@name=\'bar\']/path-monitor/monitor-destinations'
      end
      let(:namevars) do
        {
          route: 'foo/bar',
          path:  'moo',
          title: 'foo/bar/moo',
        }
      end
      let(:mystruct) { {} }

      it 'will call set_config' do
        expect(typedef).to receive(:definition).and_return(mystruct).twice
        expect(provider).to receive(:xml_from_should).with(namevars, anything)
        expect(transport).to receive(:set_config).with(expected_path, anything)
        provider.update(context, namevars, anything)
      end
    end
  end

  describe '#delete(context, name)' do
    context 'when called' do
      let(:expected_path) do
        '/some_xpath/entry[@name=\'bar\']/routing-table/ip/static-route/entry[@name=\'bar\']/path-monitor/monitor-destinations/entry[@name=\'moo\']'
      end
      let(:mystruct) do
        {
          base_xpath: '/some_xpath',
        }
      end
      let(:namevars) do
        {
          title: 'bar/bar/moo',
          route: 'bar/bar',
          path:  'moo',
        }
      end

      it 'will call delete_config' do
        expect(typedef).to receive(:definition).and_return(mystruct)
        expect(transport).to receive(:delete_config).with(expected_path)
        provider.delete(context, namevars)
      end
    end
  end
end
