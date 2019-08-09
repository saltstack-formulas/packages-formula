### WANTED/REQUIRED
case os[:name]
when 'fedora', 'opensuse'
  wanted_pips = []
else
  wanted_pips = %w{
    dxpy
    attrs
  }
end

control 'Wanted/Required python packages' do
  title 'should be installed'

  wanted_pips.each do |p|
    describe pip(p) do
      it { should be_installed }
    end
  end
end

### UNWANTED
control 'Unwanted python packages' do
  title 'should be uninstalled'
  %w{
    campbel
    reverse_geocode
    indy-crypto
  }.each do |p|
    describe pip(p) do
      it { should_not be_installed }
    end
  end
end
