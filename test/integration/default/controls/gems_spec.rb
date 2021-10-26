# frozen_string_literal: true

### WANTED/REQUIRED
control 'Wanted/Required gems' do
  title 'should be installed'

  wanted = %w[
    progressbar
    minitest
  ]
  case platform[:family]
  when 'redhat'
    wanted.delete('minitest')
  end

  wanted.each do |p|
    describe gem(p) do
      it { should be_installed }
    end
  end
end

### SPECIFIC GEMS VERSIONS
control "Specific gems' versions" do
  title 'should be installed'

  specific_gems = {
    'regexp_parser' => '1.7.0',
    'strings' => '0.1.8'
  }
  specific_gems.each do |p, v|
    describe gem(p) do
      it { should be_installed }
      its('versions') { should include(v) }
    end
  end
end

### UNWANTED
control 'Unwanted gems' do
  title 'should be uninstalled'
  %w[
    diff-lcs
    kwalify
    kitchen-vagrant
  ].each do |p|
    describe gem(p) do
      it { should_not be_installed }
    end
  end
end
