### WANTED/REQUIRED
control 'Wanted/Required npm packages' do
  title 'should be installed'
  desc '(only testing in the Debian platform, as the node-formual dependency is too specific)'

  only_if do
    os.name == 'debian'
  end

  %w{
    sax
    hello-world-npm
  }.each do |p|
    describe npm(p) do
      it { should be_installed }
    end
  end
end

### UNWANTED
control 'Unwanted npm packages' do
  title 'should be uninstalled'
  desc '(only testing in the Debian platform, as the node-formual dependency is too specific)'

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
