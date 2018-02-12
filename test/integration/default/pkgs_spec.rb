%w{
  git
  git
  less
  bc
  curl
  fail2ban
}.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

%w{
  avahi-daemon
}.each do |p|
  describe package(p) do
    it { should_not be_installed }
  end
end
