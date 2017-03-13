require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'squid class' do

  context 'basic setup' do

    it "workarround for ubuntu14.04 docker image" do
      expect(shell("lsb_release -a | grep trusty; if [ $? -eq 0 ]; then mv /sbin/initctl /sbin/oldinitctl; echo -e '#!/bin/bash\nif [ $1 == \"--version\" ]\nthen\n  echo \"initctl (upstart 1.12.1)\"\nfi\n/sbin/oldinitctl \"$@\"' > /sbin/initctl; chmod 755 /sbin/initctl; fi").exit_code).to be_zero
    end

    #cat /etc/redhat-release  | awk '{ print $4 }' | grep "^7"
    # it "workarround for centos7 docker image" do
    #   expect(shell("cat /etc/redhat-release  | awk '{ print $4 }' | grep \"^7\"; if [ $? -eq 0 ]; then mv /sbin/initctl /sbin/oldinitctl; echo -e '#!/bin/bash\nif [ $1 == \"--version\" ]\nthen\n  echo \"initctl (upstart 1.12.1)\"\nfi\n/sbin/oldinitctl \"$@\"' > /sbin/initctl; chmod 755 /sbin/initctl; fi").exit_code).to be_zero
    # end

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
    # it "check init" do
    #   expect(shell("/sbin/initctl --version").exit_code).to be_zero
    # end
    #
    # it "debug ps" do
    #   expect(shell("ps auxf").exit_code).to be_zero
    # end
    #
    # it "debug netstat" do
    #   expect(shell("netstat -tpln").exit_code).to be_zero
    # end

    it "squid configtest" do
      expect(shell("squid -k check").exit_code).to be_zero
    end

  end
end
