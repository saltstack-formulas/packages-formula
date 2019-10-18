# frozen_string_literal: true

### REMOTE PKGS
remote_pkgs = ['zoom']

case platform[:family]
when 'suse'
  remote_pkgs = []
end

control 'Remote packages' do
  title 'should be downloaded and installed'

  remote_pkgs.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end
end
