## FIXME! inspec's npm resource fails to check correctly (sudo issues, path issues)
## so I added some "poor man's checks" to ensure, at least, that npms are in place

npms_path = '/home/kitchen/npms'

wanted_npms = {
  '@davidodio/hello': '2.3.0',
  'hello-world-npm': '1.1.1',
  'sax': '1.2.4',
  'coffee-script': '1.0.1'
}

### WANTED/REQUIRED
control 'Wanted/Required npm packages' do
  title 'should be installed'
  desc '(only testing in the Debian platform, as the node-formula dependency is too specific)'

  only_if do
    os.name == 'debian'
  end

  describe directory(npms_path) do
    it { should exist }
    its('owner') { should cmp 'kitchen' }
    its('group') { should cmp 'kitchen' }
    its('mode') { should cmp '0755' }
  end

  wanted_npms.each do |p,v|
    describe directory("#{npms_path}/node_modules/#{p}") do
      it { should exist }
    end
  end
end

### UNWANTED
control 'Unwanted npm packages' do
  title 'should be uninstalled'
  desc '(only testing in the Debian platform, as the node-formula dependency is too specific)'

  only_if do
    os.name == 'debian'
  end

  %w{
    gist
  }.each do |p|
    describe npm(p) do
      it { should_not be_installed }
    end
  end
end
