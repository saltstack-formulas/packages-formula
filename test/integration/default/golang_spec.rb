go_path = '/home/kitchen/go'

# GO GET
control 'go get github.com/golang/example/hello' do
  title 'should be installed'
  desc '(only testing in the Debian platform, as these are OS-independent'

  only_if do
    os.debian?
  end

  describe file('/usr/local/go/bin/go') do
    it { should be_executable }
  end

  %w(
    github.com/golang/example/hello
  ).each do |f|
    describe file("#{go_path}/src/#{f}") do
      it { should exist }
    end
  end
