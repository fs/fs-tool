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
    its(:first) { should be_a_kind_of(FsTool::Server) }
  end
end
