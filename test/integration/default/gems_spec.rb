### WANTED/REQUIRED
control 'Wanted/Required gems' do
  title 'should be installed'

  %w{
    progressbar
    minitest
  }.each do |p|
    describe gem(p) do
      it { should be_installed }
    end
  end
end

### UNWANTED
control 'Unwanted gems' do
  title 'should be uninstalled'
  %w{
    diff-lcs
    kwalify
    kitchen-vagrant
  }.each do |p|
    describe gem(p) do
      it { should_not be_installed }
    end
  end
end
