### REMOTE PKGS
remote_pkgs = ['zoom']

case os[:name]
when 'opensuse'
  remote_pkgs = []
end

control 'Remote packages' do
  title 'should be downloaded and installed'

  %w{
    zoom
  }.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end
end
