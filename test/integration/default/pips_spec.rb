%w{
  dxpy
  makerlabs
}.each do |p|
  describe pip(p) do
    it { should be_installed }
  end
end

%w{
  campbel
  reverse_geocode
  indy-crypto
}.each do |p|
  describe pip(p) do
    it { should_not be_installed }
  end
end
