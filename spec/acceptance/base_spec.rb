require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'squid class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'squid':
        visible_hostname => 'testsquid',
        disable_cache => true,
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    it "sleep 10 to make sure squid is started" do
      expect(shell("sleep 10").exit_code).to be_zero
    end

    describe port(3128) do
      it { should be_listening }
    end

    #/sbin/initctl --version
    it "check init" do
      expect(shell("/sbin/initctl --version").exit_code).to be_zero
    end

  end
end
