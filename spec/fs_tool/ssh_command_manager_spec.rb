require 'spec_helper'

describe FsTool::SshCommandManager do
  describe '#process' do
    let(:command) { nil }
    let(:server_list) { double(:server_list, find: nil) }
    let(:command_manager) { described_class.new(command) }

    before { FsTool::ServerList.stub(new: server_list) }

    context 'when server is NOT found' do
      it 'raises error' do
        expect { command_manager.process('foo') }.to raise_error(FsTool::ServerNotFoundException)
      end
    end

    context 'when server is found' do
      let(:server) do
        FsTool::Server.new(name: 'foo', environment: 'baz', address: 'foo@bar.com', root: '/var')
      end

      before { server_list.stub(find: server) }

      context 'and command is empty' do
        it 'open ssh session to the server' do
          command_manager.should_receive(:exec).with('ssh foo@bar.com')

          command_manager.process('foo')
        end
      end

      context 'and command is NOT empty' do
        let(:command) { "cd %{root}; echo %{environment}" }

        it 'runs specified command on the server' do
          command_manager.should_receive(:exec).with("ssh foo@bar.com -t 'cd /var; echo baz'")

          command_manager.process('foo')
        end
      end

      context 'and command contains %{subject}' do
        let(:command) { "echo %{subject}" }

        it 'passes %{subject} to remote command' do
          command_manager.should_receive(:exec).with("ssh foo@bar.com -t 'echo my cool command'")

          command_manager.process(*%w(foo my cool command))
        end
      end
    end
  end
end
