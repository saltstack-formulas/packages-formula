### ARCHIVE PKGS
control 'Archive packages' do
  title 'should be downloaded and installed'
  desc '(only testing in the Debian platform, as these are OS-independent'

  only_if do
    os.debian?
  end

  %w(
    docker-compose.yml
    phantomjs-2.1.1-linux-x86_64/bin
  ).each do |f|
    describe file("/usr/local/src/#{f}") do
      it { should exist }
    end
  end
  describe file('/usr/local/bin/kubectl') do
    it { should be_executable }
  end
end
