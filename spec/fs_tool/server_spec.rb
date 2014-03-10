require 'spec_helper'

describe FsTool::Server do
  let(:server_params) do
    {
      name: 'default',
      environment: 'staging',
      root: '/home/staging/app',
      address: 'foo@bar.com'
    }
  end

  describe '.initialize' do
    subject { described_class.new(server_params) }

    its(:name) { should == 'default' }
    its(:environment) { should == 'staging' }
    its(:root) { should == '/home/staging/app' }
    its(:address) { should == 'foo@bar.com' }
  end

  describe '#params' do
    subject { described_class.new(server_params).params }

    it { should be_a_kind_of(Hash) }
    its(:keys) { should =~ [:name, :environment, :root] }
  end
end
