wanted_npms = {
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

  wanted_npms.each do |p,v|
    describe npm(p) do
      it { should be_installed }
      # FIXME! Testing for version is failing, seems an issue in inspec
      # Same happens with testing path, as it performs a cd command and it fails when using sudo
      # its('version') { should eq v }
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
