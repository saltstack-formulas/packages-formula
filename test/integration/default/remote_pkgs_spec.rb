### REMOTE PKGS
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
