require 'spec_helper'

describe FsTool::SshCommandManager do
  describe '#parse' do
    let(:server_list) { double(:server_list, find: nil, names: %w(Tyler Durden)) }
    let(:command_manager) { described_class.new }

    before { FsTool::ServerList.stub(new: server_list) }

    context 'when server is NOT found' do
      it 'returns nothing' do
        command_manager.parse('foo').should == nil
      end
    end

    context 'when server is found' do
      let(:args) { %w(foo my cool command) }

      let(:server) do
        FsTool::Server.new(name: 'foo', environment: 'baz', address: 'foo@bar.com', root: '/var')
      end

      before { server_list.stub(find: server) }

      subject { command_manager.parse(*args) }

      its(:first) { should == server }

      context 'command params' do
        subject { command_manager.parse(*args)[1] }

        its([:subject]) { should == 'my cool command' }
        its([:environment]) { should == 'baz' }
        its([:root]) { should == '/var' }
      end
    end
  end
end
