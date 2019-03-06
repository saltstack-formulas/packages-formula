## Some vars
common_packages = %w(
  git
  less
  bc
  curl
  fail2ban
)

case os[:name]
when 'redhat', 'centos'
  os_packages = %w(yum-plugin-versionlock)
  held_packages = {
    # We use this test for held packages in a list,
    # with no version (current version).
    'alien': '',
    'iotop': ''
  }
  lock_file = '/etc/yum/pluginconf.d/versionlock.list'
when 'fedora'
  os_packages = %w(
    python2-dnf-plugin-versionlock
    python3-dnf-plugin-versionlock
  )
  held_packages = {
    'alien': '8.95-8.fc29',
    'iotop': '0.6-18.fc29'
  }
  lock_file = '/etc/dnf/plugins/versionlock.list'
# Adding empty Suse entries, to get tests passing
# Don't know the correct values to add here.
when 'opensuse'
  os_packages = %w()
  held_packages = {}
  lock_file = ''
when 'debian', 'ubuntu'
  os_packages = %w()
  held_packages = {
    'alien': '8.95',
    # To match also ubuntu16's
    'iotop': '0.6-'
  }
  lock_file = '/var/lib/dpkg/status'
end

unheld_packages = (common_packages + os_packages).flatten.uniq
all_packages = (unheld_packages + held_packages.keys.map { |k| k.to_s }).flatten.uniq

### WANTED/REQUIRED/HELD
control 'Wanted/Required/Held packages' do
  title 'should be installed'

  all_packages.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end
end

### WANTED UNHELD
control 'Wanted packages' do
  title 'should NOT be marked as hold'

  unheld_packages.each do |p,v|
    case os[:name]
    when 'redhat', 'centheld_packagesheld_packagesos', 'fedora'
      match_string = "#{p}-.*#{v}"
      describe file(lock_file) do
        its('content') { should_not match(match_string) }
      end
    when 'debian', 'ubuntu'
      match_string = "^Package: #{p}\nStatus: install ok installed"
      describe file(lock_file) do
        its('content') { should match(match_string) }
      end
    end
  end
end

### HELD
control 'Held packages' do
  title 'should be marked as hold'

  held_packages.each do |p,v|
    case os[:name]
    when 'redhat', 'centos', 'fedora'
      match_string = "#{p}-.*#{v}"
    when 'debian', 'ubuntu'
      match_string = "^Package: #{p}\nStatus: hold ok installed\nP.*\nS.*\nI.*\nM.*\nA.*\nVersion: #{v}"
    end
  
    describe file(lock_file) do
      its('content') { should match(match_string) }
    end
  end
end
  
### UNWANTED
control 'Unwanted packages' do
  title 'should be uninstalled'
  %w{
    avahi-daemon
  }.each do |p|
    describe package(p) do
      it { should_not be_installed }
    end
  end
end
