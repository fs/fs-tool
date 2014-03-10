require 'spec_helper'

describe FsTool::ServerList do
  let(:new_home) { File.expand_path('../../fixtures', __FILE__) }

  around do |example|
    previous_home = ENV['HOME']
    ENV['HOME'] = new_home

    example.run

    ENV['HOME'] = previous_home
  end

  before do
    Dir.stub(pwd: File.join(new_home, 'project'))
  end

  describe '#initialize' do
    subject { described_class.new.servers }

    it { should have(3).items }
    its(['home']) { should be_a_kind_of(FsTool::Server) }
  end

  describe '#names' do
    subject { described_class.new.names }
    it { should =~ %w(home staging staging_2) }
  end

  describe '#find' do
    let(:server_list) { described_class.new }

    it 'returns server by name (key)' do
      server_list.find('home').should be_a_kind_of(FsTool::Server)
    end

    context 'when server is NOT found' do
      it 'returns nil' do
        server_list.find('non_existent').should be_nil
      end
    end
  end
end
