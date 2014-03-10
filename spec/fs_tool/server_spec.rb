require 'spec_helper'

describe FsTool::Server do
  let(:params) do
    {
      name: 'default',
      environment: 'staging',
      root: '/home/staging/app',
      address: 'foo@bar.com'
    }
  end

  subject { described_class.new(params) }

  its(:name) { should == 'default' }
  its(:environment) { should == 'staging' }
  its(:root) { should == '/home/staging/app' }
  its(:address) { should == 'foo@bar.com' }
end
